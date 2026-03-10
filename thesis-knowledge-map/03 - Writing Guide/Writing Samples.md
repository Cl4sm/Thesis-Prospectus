# Writing Samples

Examples of your voice done well, pulled from existing chapters and the Mango paper. Use these as calibration when writing new text (especially [[Artiphishell Writing Strategy|Artiphishell chapter 4]]).

## Abstract Voice (from Mango paper)
> "But this increase in convenience comes with increased security risks to the users of IoT devices, partially because IoT firmware is frequently complex, feature-rich, and very vulnerable."

What works: direct claim, no hedging, "complex, feature-rich, and very vulnerable" is a clean three-beat list.

## Technical Explanation Voice
> "Traditional inter-function data-flow analysis cannot effectively analyze firmware at scale. One fundamental problem is that forward inter-function data-flow analysis usually must enter and analyze every callee; otherwise, it misses the artifacts that the callee generates."

What works: states the problem first, then the mechanism. No "it is important to note that."

## Editorial Aside Voice (from Ch. 2)
> "Dynamic analysis of firmware requires running the firmware outside its original hardware. This is called rehosting, and it is (to put it mildly) painful."

What works: parenthetical injects personality without undermining the technical claim.

## Crisp Comparison (from Ch. 1)
> "Mango analyzed 3,599 binaries versus SaTC's 131, a 27x increase, while running 22x faster per binary."

What works: numbers do the talking. No "significantly outperforms."

## Design Decision Voice (from Ch. 4, existing draft)
> "The core design philosophy: bolt together diverse analysis techniques through a multi-agent architecture where specialized AI agents each handle a different piece of the vulnerability lifecycle."

What works: physical verb ("bolt together"), colon instead of em dash, clear statement of intent.

## Honest Limitation Voice (from Mango paper)
> "Our evaluation shows that Assumed Nonimpact works well in most cases, and we hope future advances in binary analysis research will alleviate these issues."

What works: acknowledges limitations without being defensive or apologetic.

## Anti-Patterns (DON'T do this)
- ~~"In today's rapidly evolving cybersecurity landscape, the need for robust vulnerability detection has never been more pressing."~~ → Just state what the tool does.
- ~~"This is not just a fuzzer. This is a fully autonomous reasoning system."~~ → FATAL pattern. Just describe the system.
- ~~"We leverage the power of LLMs to harness..."~~ → "We use LLMs to..."

## Related
- [[Voice DNA Rules]]
- [[Banned Phrases]]
