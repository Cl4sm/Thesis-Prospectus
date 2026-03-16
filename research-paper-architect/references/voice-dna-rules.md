# Voice DNA Rules for Research Paper Writing

These rules govern ALL written output. No exceptions. Read this before writing any LaTeX.

## Core Principles

1. Write technically and academically, as a PhD would.
2. Get to the point. No throat-clearing, no preamble. The first sentence of every paragraph states the claim or finding.
3. Be specific: numbers, system names, concrete details. Never "significant improvement"; always "27x more binaries in comparable time."
4. Vary sentence length. Mix short punchy lines with longer explanatory ones.
5. Use physical verbs for abstract processes: "stripped back" not "simplified," "bolted on" not "added," "sanded down" not "improved," "carved out" not "created."
6. Parenthetical asides inject personality without undermining technical claims (like this one).
7. Never pad output to seem more thorough. Shorter and accurate beats longer and fluffy.
8. Hedging is acceptable when honest: "we believe," "in most cases," "our evaluation suggests." False confidence is worse than honest uncertainty.

## Formatting

- Numbers as digits with commas: 10,834 not "ten thousand"
- NO em dashes ever. Use commas, periods, colons, semicolons, or parentheses.
- Bold sparingly: 1-2 key moments per section at most.
- Code blocks for specific commands, tool outputs, or algorithm names.

## Banned Phrases (FATAL if any appear in output)

### Dead AI Language
- "In today's [anything]..."
- "It's important to note that..." / "It's worth noting..."
- "Delve" / "Dive into" / "Unpack"
- "Harness" / "Leverage" / "Utilize"
- "Landscape" / "Realm" / "Robust"
- "Game-changer" / "Cutting-edge"
- "Straightforward"
- "In order to" (just say "to")

### Dead Transitions
- "Moving forward" / "At the end of the day"
- "To put this in perspective..."
- "What makes this particularly interesting is..."
- "The implications here are..."
- "In other words..."
- "It goes without saying..."

### The Big One (FATAL — instant rejection of output)
- "This isn't X. This is Y." and ALL variations
- "Not X. Y."
- "Forget X. This is Y."
- "Less X, more Y."
- ANY sentence that negates one framing then asserts a corrected one
- If even ONE appears, delete the negation and just state the positive claim

### Also Banned
- "Supercharge" / "Unlock" / "Future-proof"
- "Here's the part nobody's talking about"
- "What nobody tells you"
- Anything with "nobody" or "most people don't realize"

## Voice Calibration Examples

### Good: Abstract voice
> "But this increase in convenience comes with increased security risks to the users of IoT devices, partially because IoT firmware is frequently complex, feature-rich, and very vulnerable."

Why it works: direct claim, no hedging, clean three-beat list.

### Good: Technical explanation
> "Traditional inter-function data-flow analysis cannot effectively analyze firmware at scale. One fundamental problem is that forward inter-function data-flow analysis usually must enter and analyze every callee; otherwise, it misses the artifacts that the callee generates."

Why it works: states the problem first, then the mechanism. No "it is important to note that."

### Good: Editorial aside
> "This is called rehosting, and it is (to put it mildly) painful."

Why it works: parenthetical injects personality without undermining the technical claim.

### Good: Crisp comparison
> "Mango analyzed 3,599 binaries versus SaTC's 131, a 27x increase, while running 22x faster per binary."

Why it works: numbers do the talking. No "significantly outperforms."

### Good: Honest limitation
> "Our evaluation shows that Assumed Nonimpact works well in most cases, and we hope future advances in binary analysis research will alleviate these issues."

Why it works: acknowledges limitations without being defensive or apologetic.

### Bad: AI slop (DO NOT WRITE LIKE THIS)
- ~~"In today's rapidly evolving cybersecurity landscape, the need for robust vulnerability detection has never been more pressing."~~ → Just state what the tool does.
- ~~"We leverage the power of LLMs to harness..."~~ → "We use LLMs to..."
- ~~"This is not just a fuzzer. This is a fully autonomous reasoning system."~~ → FATAL pattern. Just describe the system.

## Self-Check Procedure

Before presenting any LaTeX to the user, run this checklist:
1. Search for em dashes (— or --) → replace with commas, colons, semicolons, or parentheses
2. Search for every banned phrase → rewrite the sentence
3. Search for the "Not X. Y." pattern → delete the negation, state the positive
4. Search for "in order to" → replace with "to"
5. Verify every claim has a number or citation
6. Read the first sentence of every paragraph: does it state the point? If not, restructure.
7. Read the whole section aloud (mentally): does it sound like a sharp human wrote it? If it sounds like ChatGPT, rewrite.
