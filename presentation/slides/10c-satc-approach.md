---
type: content
title: "SaTC: Frontend-Guided Binary Selection"
---

<svg viewBox="0 0 900 520" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" style="max-height: 60vh; display: block; margin: 0 auto;">

  <!-- FRONTEND SECTION -->
  <text x="450" y="28" text-anchor="middle" font-size="16" font-weight="700" fill="#666" font-family="Arial, sans-serif">Frontend Files</text>

  <!-- HTML file -->
  <rect x="120" y="45" width="250" height="50" rx="6" fill="#fff" stroke="#999" stroke-width="1.5"/>
  <text x="245" y="67" text-anchor="middle" font-size="14" fill="#666" font-family="Arial, sans-serif">index.html</text>
  <text x="245" y="85" text-anchor="middle" font-size="13" fill="#E65100" font-family="monospace">"password"  "admin_user"</text>

  <!-- PHP file -->
  <rect x="530" y="45" width="250" height="50" rx="6" fill="#fff" stroke="#999" stroke-width="1.5"/>
  <text x="655" y="67" text-anchor="middle" font-size="14" fill="#666" font-family="Arial, sans-serif">admin.php</text>
  <text x="655" y="85" text-anchor="middle" font-size="13" fill="#E65100" font-family="monospace">"config_set"  "remote_pw"</text>

  <!-- Keywords box -->
  <rect x="100" y="115" width="700" height="40" rx="6" fill="#FFF3E0" stroke="#FF9800" stroke-width="2"/>
  <text x="450" y="141" text-anchor="middle" font-size="15" font-weight="600" fill="#E65100" font-family="Arial, sans-serif">Extracted Keywords: password, admin_user, config_set, remote_pw</text>

  <!-- Arrows down -->
  <path d="M 300 155 L 300 185" stroke="#FF9800" stroke-width="2.5" fill="none" marker-end="url(#arr-satc)"/>
  <path d="M 600 155 L 600 185" stroke="#FF9800" stroke-width="2.5" fill="none" marker-end="url(#arr-satc)"/>
  <text x="450" y="178" text-anchor="middle" font-size="13" fill="#FF9800" font-weight="600" font-family="Arial, sans-serif">match against string references in binaries</text>

  <!-- BACKEND SECTION -->
  <text x="450" y="210" text-anchor="middle" font-size="16" font-weight="700" fill="#666" font-family="Arial, sans-serif">Backend Binaries</text>

  <!-- Matched binaries (green) -->
  <rect x="50" y="225" width="180" height="55" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
  <text x="140" y="250" text-anchor="middle" font-size="16" font-weight="bold" fill="#333" font-family="Arial, sans-serif">httpd</text>
  <text x="140" y="268" text-anchor="middle" font-size="12" fill="#4CAF50" font-weight="700" font-family="Arial, sans-serif">ANALYZED</text>

  <rect x="260" y="225" width="180" height="55" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
  <text x="350" y="250" text-anchor="middle" font-size="15" font-weight="bold" fill="#333" font-family="Arial, sans-serif">password.cgi</text>
  <text x="350" y="268" text-anchor="middle" font-size="12" fill="#4CAF50" font-weight="700" font-family="Arial, sans-serif">ANALYZED</text>

  <rect x="470" y="225" width="180" height="55" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
  <text x="560" y="250" text-anchor="middle" font-size="16" font-weight="bold" fill="#333" font-family="Arial, sans-serif">wan.cgi</text>
  <text x="560" y="268" text-anchor="middle" font-size="12" fill="#4CAF50" font-weight="700" font-family="Arial, sans-serif">ANALYZED</text>

  <!-- Count label -->
  <text x="770" y="256" font-size="13" fill="#4CAF50" font-weight="600" font-family="Arial, sans-serif">131 / 3,599</text>
  <text x="770" y="272" font-size="11" fill="#999" font-family="Arial, sans-serif">binaries</text>

  <!-- Skipped binaries (gray, dashed) -->
  <rect x="50" y="310" width="140" height="45" rx="6" fill="#f0f0f0" stroke="#ccc" stroke-width="1.5" stroke-dasharray="4,4"/>
  <text x="120" y="333" text-anchor="middle" font-size="15" fill="#999" font-family="Arial, sans-serif">dlnad</text>
  <text x="120" y="348" text-anchor="middle" font-size="10" fill="#bbb" font-family="Arial, sans-serif">SKIPPED</text>

  <rect x="210" y="310" width="140" height="45" rx="6" fill="#f0f0f0" stroke="#ccc" stroke-width="1.5" stroke-dasharray="4,4"/>
  <text x="280" y="333" text-anchor="middle" font-size="15" fill="#999" font-family="Arial, sans-serif">ddns</text>
  <text x="280" y="348" text-anchor="middle" font-size="10" fill="#bbb" font-family="Arial, sans-serif">SKIPPED</text>

  <rect x="370" y="310" width="140" height="45" rx="6" fill="#f0f0f0" stroke="#ccc" stroke-width="1.5" stroke-dasharray="4,4"/>
  <text x="440" y="333" text-anchor="middle" font-size="14" fill="#999" font-family="Arial, sans-serif">wandetect</text>
  <text x="440" y="348" text-anchor="middle" font-size="10" fill="#bbb" font-family="Arial, sans-serif">SKIPPED</text>

  <rect x="530" y="310" width="140" height="45" rx="6" fill="#f0f0f0" stroke="#ccc" stroke-width="1.5" stroke-dasharray="4,4"/>
  <text x="600" y="333" text-anchor="middle" font-size="15" fill="#999" font-family="Arial, sans-serif">sshd</text>
  <text x="600" y="348" text-anchor="middle" font-size="10" fill="#bbb" font-family="Arial, sans-serif">SKIPPED</text>

  <rect x="690" y="310" width="50" height="45" rx="6" fill="#f0f0f0" stroke="#ccc" stroke-width="1.5" stroke-dasharray="4,4"/>
  <text x="715" y="337" text-anchor="middle" font-size="14" fill="#ccc" font-family="Arial, sans-serif">...</text>

  <!-- Problem callout -->
  <rect x="50" y="385" width="800" height="50" rx="6" fill="#ffebee" stroke="#E53935" stroke-width="2"/>
  <text x="450" y="407" text-anchor="middle" font-size="15" font-weight="bold" fill="#C62828" font-family="Arial, sans-serif">dlnad contains CVE-2019-20215 but has no frontend keyword matches</text>
  <text x="450" y="425" text-anchor="middle" font-size="13" fill="#C62828" font-family="Arial, sans-serif">SaTC never analyzes it — the vulnerability is invisible to frontend-guided selection</text>

  <!-- Stats -->
  <text x="450" y="475" text-anchor="middle" font-size="14" fill="#666" font-family="Arial, sans-serif">3,599 binaries → 131 analyzed (3.6%) · 33 bugs found · 32.77% true positive rate</text>

  <defs>
    <marker id="arr-satc" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#FF9800"/>
    </marker>
  </defs>
</svg>

- **Key insight**: Frontends and backends share string literals that encode user input parameters
- **Trade-off**: Effective narrowing (3.6% of binaries), but misses vulnerabilities in binaries without frontend overlap

???

**Speaker Notes:**

SaTC takes a different approach from Karonte. Instead of building a dependency graph through IPC key expansion, it uses an even lighter-weight heuristic: frontends and backends share vocabulary. Extract string literals from the web interface, HTML and PHP files. Search backend binaries for those same strings. If a binary contains matching strings, analyze it. If not, skip it. [CLICK] It's remarkably effective for narrow scope. Analyzed 131 of 3,599 binaries, 3.6 percent, and found 33 bugs with a 32.77 percent true positive rate. But look at what's skipped: dlnad, ddns, wandetect, sshd. And dlnad contains CVE-2019-20215, the same command injection vulnerability from our motivating example. Why is dlnad never examined? Because it's a media server with no parameter overlap with the web interface. The vulnerability path goes through NVRAM, not through frontend keywords. Both Karonte and SaTC face the same fundamental tension: any heuristic for narrowing scope, whether BDG expansion or keyword matching, will exclude binaries that fall outside its discovery radius.
