---
type: content
title: "The Fuzzing Gap"
---

<svg viewBox="0 0 1000 300" style="width:100%; margin:0.5rem auto 0.5rem auto; display:block;">
  <defs>
    <marker id="arrFuzzGap" markerWidth="10" markerHeight="10" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#888"/>
    </marker>
  </defs>

  <!-- Detection box -->
  <rect x="30" y="80" width="200" height="90" fill="#fff3e0" stroke="#FF9800" stroke-width="2.5" rx="8"/>
  <text x="130" y="115" text-anchor="middle" font-size="14" font-weight="700" fill="#E65100">Fuzzer</text>
  <text x="130" y="140" text-anchor="middle" font-size="11" fill="#555">"crash at memcpy()</text>
  <text x="130" y="156" text-anchor="middle" font-size="11" fill="#555">with input X"</text>

  <!-- Arrow into gap -->
  <path d="M 230 125 L 290 125" stroke="#888" stroke-width="2.5" fill="none" marker-end="url(#arrFuzzGap)"/>

  <!-- Gap region with blockers -->
  <rect x="295" y="30" width="380" height="240" fill="#fff8e1" stroke="#FF9800" stroke-width="2" rx="10" stroke-dasharray="6,3"/>
  <text x="485" y="58" text-anchor="middle" font-size="14" font-weight="700" fill="#E65100">The Gap</text>

  <!-- Blocker items -->
  <rect x="320" y="75" width="330" height="38" fill="#ffebee" stroke="#E53935" stroke-width="1.5" rx="5"/>
  <text x="340" y="99" font-size="12" fill="#C62828" font-weight="600">Crash may not be security-relevant</text>

  <rect x="320" y="123" width="330" height="38" fill="#ffebee" stroke="#E53935" stroke-width="1.5" rx="5"/>
  <text x="340" y="147" font-size="12" fill="#C62828" font-weight="600">No root cause or vulnerability class identified</text>

  <rect x="320" y="171" width="330" height="38" fill="#ffebee" stroke="#E53935" stroke-width="1.5" rx="5"/>
  <text x="340" y="195" font-size="12" fill="#C62828" font-weight="600">Coverage limited to exercised paths</text>

  <rect x="320" y="219" width="330" height="38" fill="#ffebee" stroke="#E53935" stroke-width="1.5" rx="5"/>
  <text x="340" y="243" font-size="12" fill="#C62828" font-weight="600">Cannot prove absence of deeper bugs</text>

  <!-- Arrow out of gap -->
  <path d="M 675 125 L 735 125" stroke="#888" stroke-width="2.5" fill="none" marker-end="url(#arrFuzzGap)"/>

  <!-- Confirmation box -->
  <rect x="740" y="80" width="220" height="90" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5" rx="8"/>
  <text x="850" y="115" text-anchor="middle" font-size="14" font-weight="700" fill="#2E7D32">Vendor-Ready Report</text>
  <text x="850" y="140" text-anchor="middle" font-size="11" fill="#555">Classified vulnerability</text>
  <text x="850" y="156" text-anchor="middle" font-size="11" fill="#555">+ root cause analysis</text>

  <!-- Bottom note -->
  <text x="485" y="290" text-anchor="middle" font-size="13" fill="#333" font-weight="600" font-style="italic">A crash is evidence, but not an explanation</text>
</svg>

???

Now consider the same gap from the fuzzing side. A fuzzer triggers a crash at memcpy with a specific input. That crash is real. It happened. But is it a security vulnerability? The crash might corrupt memory that never gets used again. It might be a benign null pointer dereference that the program handles gracefully. Even when the crash is exploitable, the fuzzer does not tell you why it happened. It gives you a symptom, not a diagnosis. You still need to identify the root cause, determine the vulnerability class, and understand which code paths remain untested. Fuzzing produces the strongest form of evidence, a concrete execution, but only for the paths it happens to reach. Everything it missed is invisible. So the gap here is not about validation. It is about completeness and understanding. You have proof that something broke, but you lack the context to explain it or to know what else might be broken.
