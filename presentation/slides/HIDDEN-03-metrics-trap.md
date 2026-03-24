---
type: content
title: "Precision & Recall"
hidden: true
---

<svg id="pr-venn" viewBox="0 -5 840 430" style="width:92%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <clipPath id="clip-ellipse">
      <ellipse cx="410" cy="175" rx="210" ry="135"/>
    </clipPath>
    <clipPath id="clip-fp-zone" clip-rule="evenodd">
      <path fill-rule="evenodd" d="M410,40 A210,135 0 1,1 409.99,40 Z M50,40 L420,40 L420,310 L50,310 Z"/>
    </clipPath>
  </defs>

  <!-- "relevant elements" bracket -->
  <text x="235" y="16" text-anchor="middle" font-family="Inter, sans-serif" font-size="13" fill="#555" font-weight="500" letter-spacing="0.3">relevant elements</text>
  <path d="M58,24 L58,30 M58,24 L412,24 M412,24 L412,30" fill="none" stroke="#999" stroke-width="1.2"/>

  <!-- Base shapes -->
  <rect x="50" y="35" width="370" height="275" rx="0" fill="#e8e8e8" stroke="#bbb" stroke-width="1.5"/>
  <ellipse cx="410" cy="175" rx="210" ry="135" fill="#e8e8e8" stroke="#888" stroke-width="2"/>

  <!-- STEP 1: True Positives -->
  <g id="pr-tp" opacity="0">
    <rect x="50" y="35" width="370" height="275" fill="#a5d6a7" clip-path="url(#clip-ellipse)"/>
    <circle cx="260" cy="100" r="7" fill="#2e7d32"/>
    <circle cx="300" cy="90" r="7" fill="#2e7d32"/>
    <circle cx="335" cy="140" r="7" fill="#2e7d32"/>
    <circle cx="275" cy="175" r="7" fill="#2e7d32"/>
    <circle cx="360" cy="125" r="7" fill="#2e7d32"/>
    <circle cx="245" cy="235" r="7" fill="#2e7d32"/>
    <circle cx="320" cy="220" r="7" fill="#2e7d32"/>
    <circle cx="290" cy="270" r="7" fill="#2e7d32"/>
    <text x="300" y="198" text-anchor="middle" font-family="Inter, sans-serif" font-size="13" fill="#1b5e20" font-weight="700">true positives</text>
  </g>

  <!-- STEP 2: False Positives -->
  <g id="pr-fp" opacity="0">
    <ellipse cx="410" cy="175" rx="210" ry="135" fill="#ef9a9a" opacity="0.6" clip-path="url(#clip-fp-zone)"/>
    <circle cx="490" cy="115" r="7" fill="none" stroke="#c62828" stroke-width="2.5"/>
    <circle cx="525" cy="160" r="7" fill="none" stroke="#c62828" stroke-width="2.5"/>
    <circle cx="510" cy="215" r="7" fill="none" stroke="#c62828" stroke-width="2.5"/>
    <circle cx="555" cy="190" r="7" fill="none" stroke="#c62828" stroke-width="2.5"/>
    <circle cx="475" cy="260" r="7" fill="none" stroke="#c62828" stroke-width="2.5"/>
    <text x="520" y="142" text-anchor="middle" font-family="Inter, sans-serif" font-size="13" fill="#b71c1c" font-weight="700">false positives</text>
  </g>

  <!-- STEP 3: False Negatives -->
  <g id="pr-fn" opacity="0">
    <circle cx="100" cy="85" r="7" fill="#616161"/>
    <circle cx="130" cy="145" r="7" fill="#616161"/>
    <circle cx="80" cy="195" r="7" fill="#616161"/>
    <circle cx="115" cy="250" r="7" fill="#616161"/>
    <circle cx="155" cy="95" r="7" fill="#616161"/>
    <circle cx="88" cy="285" r="7" fill="#616161"/>
    <circle cx="175" cy="275" r="7" fill="#616161"/>
    <text x="130" y="172" text-anchor="middle" font-family="Inter, sans-serif" font-size="13" fill="#424242" font-weight="700">false negatives</text>
  </g>

  <!-- STEP 4: True Negatives -->
  <g id="pr-tn" opacity="0">
    <circle cx="700" cy="70" r="6" fill="none" stroke="#999" stroke-width="2"/>
    <circle cx="730" cy="125" r="6" fill="none" stroke="#999" stroke-width="2"/>
    <circle cx="715" cy="185" r="6" fill="none" stroke="#999" stroke-width="2"/>
    <circle cx="745" cy="240" r="6" fill="none" stroke="#999" stroke-width="2"/>
    <circle cx="690" cy="285" r="6" fill="none" stroke="#999" stroke-width="2"/>
    <text x="720" y="52" text-anchor="middle" font-family="Inter, sans-serif" font-size="13" fill="#757575" font-weight="700">true negatives</text>
  </g>

  <!-- "retrieved elements" label -->
  <text x="410" y="335" text-anchor="middle" font-family="Inter, sans-serif" font-size="13" fill="#555" font-weight="500" letter-spacing="0.3">retrieved elements</text>

  <!-- STEP 5: Equations -->
  <g id="pr-equations" opacity="0">
    <line x1="50" y1="350" x2="780" y2="350" stroke="#ddd" stroke-width="1"/>
    <text x="200" y="370" text-anchor="middle" font-family="Inter, sans-serif" font-size="11" fill="#777">How many retrieved items are relevant?</text>
    <text x="148" y="400" text-anchor="middle" font-family="Inter, sans-serif" font-size="18" font-weight="700" fill="#1565c0">Precision =</text>
    <text x="253" y="392" text-anchor="middle" font-family="Inter, sans-serif" font-size="14" font-weight="600" fill="#2e7d32">TP</text>
    <line x1="225" y1="397" x2="282" y2="397" stroke="#555" stroke-width="1.2"/>
    <text x="253" y="414" text-anchor="middle" font-family="Inter, sans-serif" font-size="14" font-weight="600" fill="#555">TP + FP</text>

    <text x="600" y="370" text-anchor="middle" font-family="Inter, sans-serif" font-size="11" fill="#777">How many relevant items are retrieved?</text>
    <text x="553" y="400" text-anchor="middle" font-family="Inter, sans-serif" font-size="18" font-weight="700" fill="#2e7d32">Recall =</text>
    <text x="645" y="392" text-anchor="middle" font-family="Inter, sans-serif" font-size="14" font-weight="600" fill="#2e7d32">TP</text>
    <line x1="617" y1="397" x2="674" y2="397" stroke="#555" stroke-width="1.2"/>
    <text x="645" y="414" text-anchor="middle" font-family="Inter, sans-serif" font-size="14" font-weight="600" fill="#555">TP + FN</text>
  </g>
</svg>

<script>
window._animQueue.push(function() {
  var el = document.getElementById('pr-venn');
  if (!el) return;
  var slideEl = el.closest('.slide');
  if (!slideEl) return;
  var slides = document.querySelectorAll('.slide');
  var idx = Array.from(slides).indexOf(slideEl);
  if (idx < 0) return;

  window.registerSlideAnimation(idx, {
    mode: 'step',
    steps: [
      makeStep(['pr-tp']),
      makeStep(['pr-fp']),
      makeStep(['pr-fn']),
      makeStep(['pr-tn']),
      makeStep(['pr-equations'])
    ]
  });
});
</script>

???

[CLICK] [step 1] True positives sit in the overlap: elements that are both relevant and retrieved. Real vulnerabilities that the tool correctly flagged. [CLICK] [step 2] False positives fall outside the relevant set but inside the retrieval boundary. The tool flagged them, but they are noise. Every false positive burns analyst time. [CLICK] [step 3] False negatives are the silent failures: relevant elements the tool never retrieved. Real vulnerabilities sitting in the codebase, invisible to the analysis. [CLICK] [step 4] True negatives are everything else: code that is not vulnerable and was not flagged. Uninteresting for our purposes. [CLICK] [step 5] The two metrics that matter. Precision measures retrieval quality: of everything the tool flagged, how much was real? Recall measures retrieval coverage: of everything that is real, how much did the tool find? A useful vulnerability analysis system must score well on both simultaneously.
