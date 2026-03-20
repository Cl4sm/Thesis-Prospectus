---
type: content
title: "Why Conventional Symbolic Execution Fails"
---

<svg viewBox="0 0 1050 460" style="width:100%; display:block; margin: 0 auto;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="ws-arr" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#999"/>
    </marker>
  </defs>

  <!-- ===== LEFT SIDE: Path explosion tree ===== -->

  <!-- Entry point -->
  <circle cx="120" cy="40" r="16" fill="#2196F3" stroke="#1565C0" stroke-width="2"/>
  <text x="120" y="45" font-size="11" font-weight="700" text-anchor="middle" fill="#fff" font-family="Inter, sans-serif">EP</text>
  <text x="180" y="44" font-size="11" fill="#666" font-family="Inter, sans-serif">Entry point</text>

  <!-- Level 1 branches -->
  <line x1="120" y1="56" x2="70" y2="95" stroke="#999" stroke-width="1.5"/>
  <line x1="120" y1="56" x2="170" y2="95" stroke="#999" stroke-width="1.5"/>
  <circle cx="70" cy="100" r="10" fill="#42A5F5"/>
  <circle cx="170" cy="100" r="10" fill="#42A5F5"/>

  <!-- Level 2 branches (4 nodes) -->
  <line x1="70" y1="110" x2="40" y2="145" stroke="#bbb" stroke-width="1.2"/>
  <line x1="70" y1="110" x2="100" y2="145" stroke="#bbb" stroke-width="1.2"/>
  <line x1="170" y1="110" x2="140" y2="145" stroke="#bbb" stroke-width="1.2"/>
  <line x1="170" y1="110" x2="200" y2="145" stroke="#bbb" stroke-width="1.2"/>
  <circle cx="40" cy="150" r="8" fill="#64B5F6"/>
  <circle cx="100" cy="150" r="8" fill="#64B5F6"/>
  <circle cx="140" cy="150" r="8" fill="#64B5F6"/>
  <circle cx="200" cy="150" r="8" fill="#64B5F6"/>

  <!-- Level 3 branches (8 nodes) -->
  <line x1="40" y1="158" x2="25" y2="190" stroke="#ccc" stroke-width="1"/>
  <line x1="40" y1="158" x2="55" y2="190" stroke="#ccc" stroke-width="1"/>
  <line x1="100" y1="158" x2="85" y2="190" stroke="#ccc" stroke-width="1"/>
  <line x1="100" y1="158" x2="115" y2="190" stroke="#ccc" stroke-width="1"/>
  <line x1="140" y1="158" x2="125" y2="190" stroke="#ccc" stroke-width="1"/>
  <line x1="140" y1="158" x2="155" y2="190" stroke="#ccc" stroke-width="1"/>
  <line x1="200" y1="158" x2="185" y2="190" stroke="#ccc" stroke-width="1"/>
  <line x1="200" y1="158" x2="215" y2="190" stroke="#ccc" stroke-width="1"/>
  <circle cx="25" cy="194" r="5" fill="#90CAF9"/>
  <circle cx="55" cy="194" r="5" fill="#90CAF9"/>
  <circle cx="85" cy="194" r="5" fill="#90CAF9"/>
  <circle cx="115" cy="194" r="5" fill="#90CAF9"/>
  <circle cx="125" cy="194" r="5" fill="#90CAF9"/>
  <circle cx="155" cy="194" r="5" fill="#90CAF9"/>
  <circle cx="185" cy="194" r="5" fill="#90CAF9"/>
  <circle cx="215" cy="194" r="5" fill="#90CAF9"/>

  <!-- Level 4: explosion dots -->
  <text x="25" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>
  <text x="55" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>
  <text x="85" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>
  <text x="115" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>
  <text x="125" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>
  <text x="155" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>
  <text x="185" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>
  <text x="215" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>

  <!-- Explosion indicator -->
  <text x="120" y="255" font-size="22" font-weight="800" text-anchor="middle" fill="#E53935" font-family="Inter, sans-serif">2<tspan font-size="14" baseline-shift="super">n</tspan></text>
  <text x="120" y="278" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">states at depth n</text>

  <!-- Sink buried deep -->
  <rect x="85" y="300" width="70" height="28" rx="4" fill="#ffebee" stroke="#8C1D40" stroke-width="1.5"/>
  <text x="120" y="319" font-size="10" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">SINK</text>
  <text x="120" y="345" font-size="10" text-anchor="middle" fill="#C62828" font-family="Inter, sans-serif">unreachable</text>
  <text x="120" y="360" font-size="10" text-anchor="middle" fill="#C62828" font-family="Inter, sans-serif">in practice</text>

  <!-- ===== RIGHT SIDE: Five problem cards ===== -->

  <!-- Problem 1 -->
  <rect x="310" y="20" width="700" height="70" rx="8" fill="#fafafa" stroke="#E53935" stroke-width="2"/>
  <rect x="310" y="20" width="50" height="70" rx="8" fill="#ffebee"/>
  <rect x="352" y="20" width="8" height="70" fill="#ffebee"/>
  <text x="335" y="62" font-size="22" font-weight="800" text-anchor="middle" fill="#E53935" font-family="Inter, sans-serif">1</text>
  <text x="380" y="48" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Path Explosion</text>
  <text x="380" y="70" font-size="12" fill="#666" font-family="Inter, sans-serif">Network daemons processing arbitrary input produce exponential branch states</text>

  <!-- Problem 2 -->
  <rect x="310" y="105" width="700" height="70" rx="8" fill="#fafafa" stroke="#FF9800" stroke-width="2"/>
  <rect x="310" y="105" width="50" height="70" rx="8" fill="#fff3e0"/>
  <rect x="352" y="105" width="8" height="70" fill="#fff3e0"/>
  <text x="335" y="147" font-size="22" font-weight="800" text-anchor="middle" fill="#FF9800" font-family="Inter, sans-serif">2</text>
  <text x="380" y="133" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Constraint Verbosity</text>
  <text x="380" y="155" font-size="12" fill="#666" font-family="Inter, sans-serif">Low-level VEX IR produces verbose SMT constraints that overwhelm the solver</text>

  <!-- Problem 3 -->
  <rect x="310" y="190" width="700" height="70" rx="8" fill="#fafafa" stroke="#9C27B0" stroke-width="2"/>
  <rect x="310" y="190" width="50" height="70" rx="8" fill="#f3e5f5"/>
  <rect x="352" y="190" width="8" height="70" fill="#f3e5f5"/>
  <text x="335" y="232" font-size="22" font-weight="800" text-anchor="middle" fill="#9C27B0" font-family="Inter, sans-serif">3</text>
  <text x="380" y="218" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Environmental Modeling</text>
  <text x="380" y="240" font-size="12" fill="#666" font-family="Inter, sans-serif">Firmware reads NVRAM, HTTP APIs, and kernel interfaces that cannot be modeled fully</text>

  <!-- Problem 4 -->
  <rect x="310" y="275" width="700" height="70" rx="8" fill="#fafafa" stroke="#2196F3" stroke-width="2"/>
  <rect x="310" y="275" width="50" height="70" rx="8" fill="#e3f2fd"/>
  <rect x="352" y="275" width="8" height="70" fill="#e3f2fd"/>
  <text x="335" y="317" font-size="22" font-weight="800" text-anchor="middle" fill="#2196F3" font-family="Inter, sans-serif">4</text>
  <text x="380" y="303" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Cross-Binary Dependencies</text>
  <text x="380" y="325" font-size="12" fill="#666" font-family="Inter, sans-serif">Vulnerability paths traverse multiple binaries through IPC, requiring cross-process reasoning</text>

  <!-- Problem 5 -->
  <rect x="310" y="360" width="700" height="70" rx="8" fill="#fafafa" stroke="#4CAF50" stroke-width="2"/>
  <rect x="310" y="360" width="50" height="70" rx="8" fill="#e8f5e9"/>
  <rect x="352" y="360" width="8" height="70" fill="#e8f5e9"/>
  <text x="335" y="402" font-size="22" font-weight="800" text-anchor="middle" fill="#4CAF50" font-family="Inter, sans-serif">5</text>
  <text x="380" y="388" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Entry-Point Preconditions</text>
  <text x="380" y="410" font-size="12" fill="#666" font-family="Inter, sans-serif">Authentication, format parsing, and permission checks must all be satisfied symbolically</text>

  <!-- Connecting annotation -->
  <line x1="240" y1="150" x2="305" y2="140" stroke="#E53935" stroke-width="1.5" stroke-dasharray="4,3"/>

</svg>

???

Now, you might ask: why not just use conventional symbolic execution? The answer is practical. Whole-program symbolic execution on firmware hits multiple hard problems simultaneously.

First, path explosion. A complete SymEx of a network daemon that processes arbitrary input quickly becomes intractable; the number of branches multiplies exponentially.

Second, constraint complexity. If you work at the low level, like VEX (angr's low-level IR), you get extremely verbose constraints. Every memory read, every arithmetic operation, every instruction side effect becomes a constraint. The solver struggles with these, and you get false negatives.

Third, environmental modeling. Firmware doesn't live in isolation. It reads and writes persistent state: NVRAM settings, configuration flags. It interfaces with HTTP APIs, other daemons, the kernel. Modeling all of that is not feasible.

Fourth, cross-binary dependencies. The vulnerability path might start in one binary, trigger a check in a second, and reach the sink in a third. Symbolic execution has to reason across these boundaries.

Finally, you have all the entry-point preconditions. Before you reach the vulnerability site, the input may need to clear authentication, format parsing, permission checks. All of that has to be satisfied symbolically.

This is why conventional SymEx doesn't work for real firmware validation.
