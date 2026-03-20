#!/usr/bin/env python3
# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "jinja2",
#     "markdown",
#     "pyyaml",
# ]
# ///
"""Build presentation: compile markdown slides + Jinja2 templates into a single HTML file."""

import os
import sys
import glob
import re
import yaml
import markdown
from jinja2 import Environment, FileSystemLoader

def protect_html_blocks(text):
    """Extract raw HTML blocks (SVG, div with style) before markdown processing.

    Markdown's parser inserts <p> tags between SVG child elements when there
    are blank lines, breaking the SVG. We extract these blocks, replace with
    placeholders, and restore them after markdown conversion.
    """
    placeholders = {}
    counter = [0]

    def replace_block(match):
        key = f"HTMLBLOCK{counter[0]}PLACEHOLDER"
        placeholders[key] = match.group(0)
        counter[0] += 1
        # Surround with newlines so markdown treats surrounding content as separate blocks
        return f"\n\n{key}\n\n"

    # Order matters: extract OUTER containers first, then standalone SVGs.
    # This prevents inner SVGs from being extracted separately when they're
    # already inside a protected div block.

    # 1. Protect top-level <div> blocks by matching balanced open/close tags.
    #    The regex approach fails on deeply nested divs, so use a stack-based
    #    parser to find the correct closing </div> for each top-level opener.
    def extract_balanced_divs(txt):
        """Find top-level <div ...> blocks with balanced open/close tags."""
        result = txt
        # Find all top-level div blocks that start a line (after optional whitespace)
        # and match them with their balanced closing tag
        pattern = re.compile(r'<div[\s>]')
        i = 0
        while i < len(result):
            m = pattern.search(result, i)
            if not m:
                break
            start = m.start()
            # Check this is a top-level block (at start of text or after newlines)
            before = result[:start].rstrip()
            if before and not before.endswith('\n') and before != '':
                # Check if it's not inside another HTML block already replaced
                if 'PLACEHOLDER' not in result[max(0,start-50):start]:
                    i = m.end()
                    continue
            # Stack-based matching for balanced divs
            depth = 0
            pos = start
            open_re = re.compile(r'<div[\s>]')
            close_re = re.compile(r'</div>')
            while pos < len(result):
                next_open = open_re.search(result, pos)
                next_close = close_re.search(result, pos)
                if next_close is None:
                    break
                if next_open and next_open.start() < next_close.start():
                    depth += 1
                    pos = next_open.end()
                else:
                    depth -= 1
                    if depth == 0:
                        end = next_close.end()
                        block = result[start:end]
                        key = f"HTMLBLOCK{counter[0]}PLACEHOLDER"
                        placeholders[key] = block
                        counter[0] += 1
                        result = result[:start] + f"\n\n{key}\n\n" + result[end:]
                        i = start + len(key) + 4
                        break
                    pos = next_close.end()
            else:
                i = m.end()
                continue
            if depth != 0:
                i = m.end()
        return result

    text = extract_balanced_divs(text)

    # 2. Protect standalone <svg>...</svg> blocks (not already inside a div)
    text = re.sub(r'<svg[\s\S]*?</svg>', replace_block, text)

    return text, placeholders

def restore_html_blocks(html, placeholders):
    """Restore protected HTML blocks after markdown conversion."""
    for key, value in placeholders.items():
        # The placeholder may be wrapped in <p> tags by markdown
        html = html.replace(f'<p>{key}</p>', value)
        html = html.replace(key, value)
    return html

def parse_slide(filepath):
    """Parse a markdown file with YAML frontmatter."""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Split frontmatter from body
    if content.startswith('---'):
        parts = content.split('---', 2)
        if len(parts) >= 3:
            frontmatter = yaml.safe_load(parts[1]) or {}
            body = parts[2].strip()
        else:
            frontmatter = {}
            body = content
    else:
        frontmatter = {}
        body = content

    # Split presenter notes from body (separator: ??? on its own line)
    notes = ''
    if '\n???\n' in body:
        body, notes = body.split('\n???\n', 1)
        body = body.strip()
        notes = notes.strip()

    # Protect raw HTML/SVG blocks from markdown mangling
    body, placeholders = protect_html_blocks(body)

    # Render markdown to HTML
    md = markdown.Markdown(extensions=['tables', 'fenced_code', 'attr_list'])
    body_html = md.convert(body)

    # Restore protected blocks
    body_html = restore_html_blocks(body_html, placeholders)

    frontmatter['body_html'] = body_html

    # Render notes to HTML
    if notes:
        md_notes = markdown.Markdown(extensions=['tables', 'fenced_code'])
        frontmatter['notes_html'] = md_notes.convert(notes)
    else:
        frontmatter['notes_html'] = ''

    return frontmatter

def build(presentation_dir=None):
    """Build the presentation."""
    if presentation_dir is None:
        presentation_dir = os.path.dirname(os.path.abspath(__file__))

    slides_dir = os.path.join(presentation_dir, 'slides')
    templates_dir = os.path.join(presentation_dir, 'templates')
    meta_file = os.path.join(presentation_dir, 'meta.yaml')

    # Load metadata
    with open(meta_file, 'r', encoding='utf-8') as f:
        meta = yaml.safe_load(f)

    # Load and parse all slide files (sorted by filename)
    slide_files = sorted(glob.glob(os.path.join(slides_dir, '*.md')))
    slides = []
    for i, filepath in enumerate(slide_files):
        slide = parse_slide(filepath)
        slide['_index'] = i + 1
        slide['_filename'] = os.path.basename(filepath)
        slide['_template'] = f"{slide.get('type', 'content')}.html.j2"
        slides.append(slide)

    print(f"Loaded {len(slides)} slides")

    # Setup Jinja2
    env = Environment(loader=FileSystemLoader(templates_dir))
    template = env.get_template('base.html.j2')

    # Render
    html = template.render(meta=meta, slides=slides)

    # Write output
    output_path = os.path.join(presentation_dir, '..', 'prospectus_presentation.html')
    output_path = os.path.normpath(output_path)
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(html)

    print(f"Built presentation: {output_path}")
    print(f"  {len(slides)} slides from {len(slide_files)} files")

if __name__ == '__main__':
    build()
