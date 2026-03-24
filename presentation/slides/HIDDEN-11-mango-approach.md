---
type: content
title: "Two Challenges: Precision and Scalability"
hidden: True
---

<svg viewBox="0 0 1050 675" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">

  <!-- ==================== PRECISION CHALLENGE (TOP) ==================== -->
  <rect x="15" y="10" width="1020" height="200" rx="8" fill="#fafafa" stroke="#ddd" stroke-width="1"/>

  <!-- TOP CARD HEADER -->
  <text x="35" y="40" font-size="24" font-weight="700" fill="#333" font-family="Inter, sans-serif">PRECISION: What transforms data?</text>

  <!-- LEFT SIDE: DIAGRAM (taint bit vs rich expression) -->
  <!-- Traditional taint box -->
  <text x="35" y="70" font-size="16.5" font-weight="600" fill="#999" font-family="Inter, sans-serif">Taint</text>
  <rect x="35" y="80" width="240" height="110" rx="5" fill="#f5f5f5" stroke="#ccc" stroke-width="1"/>
  <rect x="50" y="95" width="60" height="35" rx="18" fill="#bbb"/>
  <text x="80" y="117" font-size="15" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">true</text>
  <text x="125" y="117" font-size="21" fill="#999" font-family="Inter, sans-serif">→</text>
  <text x="145" y="117" font-size="15" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">? (lost)</text>
  <text x="195" y="95" font-size="15" fill="#999" font-family="Inter, sans-serif">Information loss:</text>
  <text x="195" y="109" font-size="13.5" fill="#999" font-family="Inter, sans-serif">no history of transforms</text>

  <!-- Rich Expression box -->
  <text x="35" y="155" font-size="16.5" font-weight="600" fill="#E65100" font-family="Inter, sans-serif">Rich Expression (Mango)</text>
  <rect x="35" y="165" width="240" height="30" rx="5" fill="#fff8e1" stroke="#FF9800" stroke-width="1.5"/>
  <text x="50" y="185" font-size="13.5" text-anchor="start" fill="#E65100" font-family="Inter, sans-serif">fgets → strlen → system</text>

  <!-- RIGHT SIDE: PROBLEM AND SOLUTION -->
  <!-- Problem text -->
  <text x="340" y="75" font-size="18" font-weight="600" fill="#333" font-family="Inter, sans-serif">Problem:</text>
  <text x="340" y="92" font-size="16.5" fill="#555" font-family="Inter, sans-serif">Traditional taint bits discard</text>
  <text x="340" y="107" font-size="16.5" fill="#555" font-family="Inter, sans-serif">transformation history. Cannot</text>
  <text x="340" y="122" font-size="16.5" fill="#555" font-family="Inter, sans-serif">distinguish safe transforms (strlen)</text>
  <text x="340" y="137" font-size="16.5" fill="#555" font-family="Inter, sans-serif">from dangerous (system).</text>

  <!-- Solution badge -->
  <rect x="340" y="155" width="680" height="28" rx="4" fill="#FF9800"/>
  <text x="680" y="175" font-size="18" font-weight="600" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Rich Expressions</text>


  <!-- ==================== SCALABILITY CHALLENGE (BOTTOM) ==================== -->
  <rect x="15" y="225" width="1020" height="200" rx="8" fill="#fafafa" stroke="#ddd" stroke-width="1"/>

  <!-- BOTTOM CARD HEADER -->
  <text x="35" y="255" font-size="24" font-weight="700" fill="#333" font-family="Inter, sans-serif">SCALABILITY: How to avoid exponential blowup?</text>

  <!-- LEFT SIDE: CALL TREE DIAGRAMS -->
  <!-- Full tree (problem) -->
  <text x="35" y="285" font-size="16.5" font-weight="600" fill="#999" font-family="Inter, sans-serif">Analyze Every Callee</text>
  <circle cx="85" cy="310" r="8" fill="#D32F2F"/>
  <text x="85" y="314" font-size="13.5" font-weight="bold" text-anchor="middle" fill="white">f</text>
  <line x1="80" y1="318" x2="60" y2="340" stroke="#D32F2F" stroke-width="1.5"/>
  <line x1="90" y1="318" x2="110" y2="340" stroke="#D32F2F" stroke-width="1.5"/>
  <circle cx="60" cy="346" r="6" fill="#EF5350"/>
  <circle cx="110" cy="346" r="6" fill="#EF5350"/>
  <line x1="54" y1="352" x2="40" y2="365" stroke="#EF5350" stroke-width="1"/>
  <line x1="66" y1="352" x2="80" y2="365" stroke="#EF5350" stroke-width="1"/>
  <line x1="104" y1="352" x2="90" y2="365" stroke="#EF5350" stroke-width="1"/>
  <line x1="116" y1="352" x2="130" y2="365" stroke="#EF5350" stroke-width="1"/>
  <!-- X marks on all leaves -->
  <text x="40" y="375" font-size="18" fill="#D32F2F" font-family="Inter, sans-serif">✕</text>
  <text x="80" y="375" font-size="18" fill="#D32F2F" font-family="Inter, sans-serif">✕</text>
  <text x="90" y="375" font-size="18" fill="#D32F2F" font-family="Inter, sans-serif">✕</text>
  <text x="130" y="375" font-size="18" fill="#D32F2F" font-family="Inter, sans-serif">✕</text>
  <!-- Cost label -->
  <text x="35" y="400" font-size="15" fill="#D32F2F" font-family="Inter, sans-serif">Cost: O(2^n) paths</text>

  <!-- Separator arrow between trees -->
  <text x="155" y="340" font-size="27" fill="#999" font-family="Inter, sans-serif">→</text>

  <!-- Selective tree (solution) -->
  <text x="185" y="285" font-size="16.5" font-weight="600" fill="#E65100" font-family="Inter, sans-serif">Assumed Nonimpact</text>
  <circle cx="235" cy="310" r="8" fill="#FF9800"/>
  <text x="235" y="314" font-size="13.5" font-weight="bold" text-anchor="middle" fill="white">f</text>
  <line x1="230" y1="318" x2="210" y2="340" stroke="#ccc" stroke-width="1.5" stroke-dasharray="3,2"/>
  <line x1="240" y1="318" x2="260" y2="340" stroke="#FF9800" stroke-width="1.5"/>
  <circle cx="210" cy="346" r="6" fill="#ddd"/>
  <text x="210" y="363" font-size="12" font-weight="600" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">skip</text>
  <circle cx="260" cy="346" r="6" fill="#FF9800"/>
  <line x1="254" y1="352" x2="240" y2="365" stroke="#ccc" stroke-width="1" stroke-dasharray="2,2"/>
  <line x1="266" y1="352" x2="280" y2="365" stroke="#ccc" stroke-width="1" stroke-dasharray="2,2"/>
  <!-- Check mark only on analyzed path -->
  <text x="260" y="375" font-size="18" fill="#2E7D32" font-family="Inter, sans-serif">✓</text>
  <!-- Cost label -->
  <text x="185" y="400" font-size="15" fill="#2E7D32" font-family="Inter, sans-serif">Cost: Linear</text>

  <!-- RIGHT SIDE: PROBLEM AND SOLUTION -->
  <!-- Problem text -->
  <text x="340" y="290" font-size="18" font-weight="600" fill="#333" font-family="Inter, sans-serif">Problem:</text>
  <text x="340" y="307" font-size="16.5" fill="#555" font-family="Inter, sans-serif">Analyzing every callee in every binary</text>
  <text x="340" y="322" font-size="16.5" fill="#555" font-family="Inter, sans-serif">creates exponential path explosion.</text>
  <text x="340" y="337" font-size="16.5" fill="#555" font-family="Inter, sans-serif">Search space becomes intractable.</text>

  <!-- Solution badge -->
  <rect x="340" y="355" width="680" height="28" rx="4" fill="#FF9800"/>
  <text x="680" y="375" font-size="18" font-weight="600" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Assumed Nonimpact</text>

</svg>

???

Mango solves two problems. First, precision. Traditional taint analysis tracks a single bit: is this value tainted or not? It cannot distinguish between tainted data that was passed through strlen, which just measures it, versus tainted data passed directly to system, which executes it. The second distinction is critical for reducing false positives. A human analyst makes that distinction all the time: "this value came from user input, passed through a filtering function, and reached the sink." The value carries its history. Second, scalability. If you analyze every callee in every binary, the search space explodes exponentially. Karonte builds a dependency graph from border binary seeds and expands through shared IPC keys, but the resulting graph of 5 to 15 binaries still faces path explosion in symbolic execution. SaTC avoids symbolic execution but restricts scope to binaries matching frontend keywords. Both sacrifice coverage to stay tractable. Mango's goal is to analyze every binary while solving both problems: tracking precise transformations and avoiding the scalability blowup.
