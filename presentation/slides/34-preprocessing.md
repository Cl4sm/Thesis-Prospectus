---
type: content
title: "Target Preparation"
---

<svg viewBox="0 0 1050 340" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="prep-arr" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#333"/>
    </marker>
  </defs>

  <!-- Title band -->
  <rect x="30" y="10" width="990" height="45" rx="6" fill="#E8F5E9" stroke="#4CAF50" stroke-width="2"/>
  <text x="525" y="42" font-size="21" font-weight="bold" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Target Preparation: Four-Stage Pipeline</text>

  <!-- Stage 1: Builder -->
  <rect x="50" y="80" width="210" height="35" rx="8" fill="#e8f5e9"/>
  <rect x="50" y="80" width="210" height="120" rx="8" fill="#fafafa00" stroke="#4CAF50" stroke-width="2"/>
  <text x="155" y="103" font-size="18.7" font-weight="bold" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Builder</text>
  <line x1="50" x2="260" y1="115" y2="115" stroke="#4CAF50" stroke-width="1"/>
  <text x="155" y="138" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Compiles with instrumentation:</text>
  <text x="155" y="155" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Address Sanitizer, Memory</text>
  <text x="155" y="172" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Sanitizer, coverage tracking</text>

  <!-- Arrow 1 -->
  <path d="M 260 140 L 290 140" stroke="#333" stroke-width="2.5" fill="none" marker-end="url(#prep-arr)"/>

  <!-- Stage 2: Analyzer -->
  <rect x="295" y="80" width="220" height="35" rx="8" fill="#fff3e0"/>
  <rect x="295" y="80" width="220" height="120" rx="8" fill="#fafafa00" stroke="#FF9800" stroke-width="2"/>
  <text x="400" y="103" font-size="18.7" font-weight="bold" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Analyzer</text>
  <line x1="295" x2="515" y1="115" y2="115" stroke="#FF9800" stroke-width="1"/>
  <text x="405" y="138" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Extracts structural information:</text>
  <text x="405" y="155" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Control flow graphs, call graphs,</text>
  <text x="405" y="172" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">type hierarchies, data flow</text>

  <!-- Arrow 2 -->
  <path d="M 515 140 L 540 140" stroke="#333" stroke-width="2.5" fill="none" marker-end="url(#prep-arr)"/>

  <!-- Stage 3: Indexer -->
  <rect x="550" y="80" width="200" height="35" rx="8" fill="#e3f2fd"/>
  <rect x="550" y="80" width="200" height="120" rx="8" fill="#fafafa00" stroke="#2196F3" stroke-width="2"/>
  <text x="650" y="103" font-size="18.7" font-weight="bold" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Indexer</text>
  <line x1="550" x2="750" y1="115" y2="115" stroke="#2196F3" stroke-width="1"/>
  <text x="650" y="138" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Builds searchable indices:</text>
  <text x="650" y="155" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">AST-based code search,</text>
  <text x="650" y="172" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">semantic symbol queries</text>

  <!-- Arrow 3 -->
  <path d="M 750 140 L 790 140" stroke="#333" stroke-width="2.5" fill="none" marker-end="url(#prep-arr)"/>

  <!-- Stage 4: DiffGuy -->
  <rect x="800" y="80" width="220" height="35" rx="8" fill="#f3e5f5"/>
  <rect x="800" y="80" width="220" height="120" rx="8" fill="#fafafa00" stroke="#9C27B0" stroke-width="2"/>
  <text x="910" y="103" font-size="18.7" font-weight="bold" text-anchor="middle" fill="#7B1FA2" font-family="Inter, sans-serif">DiffGuy</text>
  <line x1="800" x2="1020" y1="115" y2="115" stroke="#9C27B0" stroke-width="1"/>
  <text x="910" y="138" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Tracks code changes:</text>
  <text x="910" y="155" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Diffs between versions,</text>
  <text x="910" y="172" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">delta analysis foundation</text>

  <!-- Bottom insight -->
  <rect x="50" y="240" width="970" height="80" rx="6" fill="#f5f5f5" stroke="#666" stroke-width="1"/>
  <text x="525" y="270" font-size="16.3" font-weight="bold" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Output: Instrumented binaries, normalized code graphs, searchable indices</text>
  <text x="275" y="290" font-size="15.2" text-anchor="start" fill="#666" font-family="Inter, sans-serif">These foundations enable all downstream agents:</text>
  <text x="275" y="310" font-size="14" text-anchor="start" fill="#666" font-family="Inter, sans-serif">Fuzzers get coverage signals. LLMs get semantic understanding. Root-cause analysis gets debug symbols.</text>
</svg>

???

Target preparation runs once at the start of analysis. The Builder compiles the target software with instrumentation enabled: Address Sanitizer to detect memory errors at runtime, Memory Sanitizer to detect uninitialized memory access, coverage tracking to monitor code path exploration. The Analyzer extracts structural information: control flow graphs showing program logic, call graphs showing function relationships, type hierarchies, and data flow. The Indexer builds searchable code indices so that LLM agents can efficiently query the codebase by semantic meaning, not just text search. DiffGuy tracks code changes between versions to enable delta scanning in later rounds. This preparation phase creates the foundation that all downstream agents depend on. Fuzzers get coverage signals. LLMs get semantic code understanding. Root-cause analysis gets debug symbols. The cost is paid once; the benefit scales across 143 hours of autonomous operation.
