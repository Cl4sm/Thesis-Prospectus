---
type: content
title: "The Detection-to-Confirmation Gap"
---

<svg viewBox="0 0 1000 300" style="width:100%; margin:0.5rem auto 0.5rem auto; display:block;">
  <defs>
    <marker id="arrGap" markerWidth="10" markerHeight="10" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#888"/>
    </marker>
  </defs>

  <!-- Detection box -->
  <rect x="30" y="80" width="200" height="90" fill="#e3f2fd" stroke="#2196F3" stroke-width="2.5" rx="8"/>
  <text x="130" y="115" text-anchor="middle" font-size="14" font-weight="700" fill="#1565C0">Static Analyzer</text>
  <text x="130" y="140" text-anchor="middle" font-size="11" fill="#555">"tainted data flows</text>
  <text x="130" y="156" text-anchor="middle" font-size="11" fill="#555">to system()"</text>

  <!-- Arrow into gap -->
  <path d="M 230 125 L 290 125" stroke="#888" stroke-width="2.5" fill="none" marker-end="url(#arrGap)"/>

  <!-- Gap region with blockers -->
  <rect x="295" y="30" width="380" height="240" fill="#fff8e1" stroke="#FF9800" stroke-width="2" rx="10" stroke-dasharray="6,3"/>
  <text x="485" y="58" text-anchor="middle" font-size="14" font-weight="700" fill="#E65100">The Gap</text>

  <!-- Blocker items -->
  <rect x="320" y="75" width="330" height="38" fill="#ffebee" stroke="#E53935" stroke-width="1.5" rx="5"/>
  <text x="340" y="99" font-size="12" fill="#C62828" font-weight="600">Guard condition may block the path</text>

  <rect x="320" y="123" width="330" height="38" fill="#ffebee" stroke="#E53935" stroke-width="1.5" rx="5"/>
  <text x="340" y="147" font-size="12" fill="#C62828" font-weight="600">Input sanitization before the sink</text>

  <rect x="320" y="171" width="330" height="38" fill="#ffebee" stroke="#E53935" stroke-width="1.5" rx="5"/>
  <text x="340" y="195" font-size="12" fill="#C62828" font-weight="600">Path constraints may be unsatisfiable</text>

  <rect x="320" y="219" width="330" height="38" fill="#ffebee" stroke="#E53935" stroke-width="1.5" rx="5"/>
  <text x="340" y="243" font-size="12" fill="#C62828" font-weight="600">Calling context not fully modeled</text>

  <!-- Arrow out of gap -->
  <path d="M 675 125 L 735 125" stroke="#888" stroke-width="2.5" fill="none" marker-end="url(#arrGap)"/>

  <!-- Confirmation box -->
  <rect x="740" y="80" width="220" height="90" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5" rx="8"/>
  <text x="850" y="115" text-anchor="middle" font-size="14" font-weight="700" fill="#2E7D32">Vendor-Ready Report</text>
  <text x="850" y="140" text-anchor="middle" font-size="11" fill="#555">Concrete PoC exploit</text>
  <text x="850" y="156" text-anchor="middle" font-size="11" fill="#555">+ triggering input</text>

  <!-- Question mark -->
  <text x="485" y="290" text-anchor="middle" font-size="13" fill="#333" font-weight="600" font-style="italic">Vendors reject reports without Proof-of-Concept exploits</text>
</svg>

???

Let me make this concrete. A static analyzer reports that tainted data flows from a network socket to a system() call. That looks like command injection. But is it actually exploitable? A guard condition might block the entire path. Input sanitization logic might neutralize the payload before it reaches the sink. The path constraints might be unsatisfiable once you account for all the branches between source and sink. The calling context might introduce preconditions that the analysis did not model. In practice, even if your detection is sound, vendors will reject your report unless you include a proof-of-concept exploit. They have learned not to trust analysis tools without validation. This gap between what a detector finds and what a vendor will accept is the crux of the problem we solve in this work.
