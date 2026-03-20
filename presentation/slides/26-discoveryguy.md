---
type: content
title: "Dynamic Analysis"
---

<svg viewBox="0 0 1000 340" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <!-- Row 1: Two technique boxes -->
  <rect x="30" y="10" width="460" height="90" fill="#f5f5f5" stroke="#2196F3" stroke-width="2" rx="6"/>
  <text x="50" y="42" font-size="15" font-weight="bold" fill="#2196F3">Coverage-Guided Fuzzing</text>
  <text x="420" y="42" font-size="12" fill="#999" text-anchor="end">(AFL++, Jazzmine)</text>
  <text x="50" y="72" font-size="12" fill="#444">Fast state-space exploration via input mutation</text>

  <rect x="520" y="10" width="460" height="90" fill="#f5f5f5" stroke="#FF9800" stroke-width="2" rx="6"/>
  <text x="540" y="42" font-size="15" font-weight="bold" fill="#FF9800">Grammar-Based Fuzzing</text>
  <text x="910" y="42" font-size="12" fill="#999" text-anchor="end">(GrammarGuy)</text>
  <text x="540" y="72" font-size="12" fill="#444">Structured inputs for JSON, SQL, XML parsers</text>

  <!-- Row 2: Two more technique boxes -->
  <rect x="30" y="120" width="460" height="90" fill="#f5f5f5" stroke="#4CAF50" stroke-width="2" rx="6"/>
  <text x="50" y="152" font-size="15" font-weight="bold" fill="#4CAF50">LLM Seed Generation</text>
  <text x="420" y="152" font-size="12" fill="#999" text-anchor="end">(QuickSeed)</text>
  <text x="50" y="182" font-size="12" fill="#444">Bootstraps fuzzing with structurally valid initial inputs</text>

  <rect x="520" y="120" width="460" height="90" fill="#f5f5f5" stroke="#8C1D40" stroke-width="2" rx="6"/>
  <text x="540" y="152" font-size="15" font-weight="bold" fill="#8C1D40">LLM-Directed Fuzzing</text>
  <text x="910" y="152" font-size="12" fill="#999" text-anchor="end">(AIJON)</text>
  <text x="540" y="182" font-size="12" fill="#444">LLM-generated IJON annotations for directed fuzzing</text>

  <!-- AIJON speedup callout
  <rect x="250" y="240" width="500" height="90" fill="#fff3e0" stroke="#FF9800" stroke-width="2" rx="8"/>
  <text x="500" y="272" font-size="16" font-weight="bold" text-anchor="middle" fill="#E65100">AIJON Speedup Results</text>
  <text x="380" y="305" font-size="26" font-weight="bold" text-anchor="middle" fill="#8C1D40">35x</text>
  <text x="380" y="322" font-size="11" text-anchor="middle" fill="#666">vs conventional directed fuzzers</text>
  <text x="620" y="305" font-size="26" font-weight="bold" text-anchor="middle" fill="#8C1D40">100x</text>
  <text x="620" y="322" font-size="11" text-anchor="middle" fill="#666">with high-quality seeds</text> -->
</svg>

???

DiscoveryGuy is the fuzzing pipeline. It combines four approaches. Coverage-guided fuzzing with AFL++ mutates inputs and tracks which code paths get exercised. It's fast and thorough for unstructured input. But when the target expects a specific format, like JSON schema, SQL queries, or XML documents, random byte mutations rarely produce valid inputs. Grammar-based fuzzing solves that. Jazzmine understands input structure and generates syntactically valid test cases. The LLM seed generator, QuickSeed, examines the target codebase and produces initial inputs that exercise interesting functionality. Those seeds bootstrap the coverage-guided and grammar-based fuzzers. AIJON is the most novel component. It uses an LLM to automatically generate IJON annotations, which are custom feedback signals that guide the fuzzer toward specific program locations. Preliminary results show a thirty-five times speedup over conventional directed fuzzers, and one hundred times faster with high-quality seeds. That acceleration is critical in a time-bounded competition. Every hour of fuzzing that takes thirty-five times longer is thirty-five hours we cannot spend discovering other vulnerabilities.
