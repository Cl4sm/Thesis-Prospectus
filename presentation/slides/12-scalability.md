---
type: content
title: "Defining Scalability"
---

<svg viewBox="0 0 1000 400" style="width:100%; margin:0.5rem auto; display:block;" xmlns="http://www.w3.org/2000/svg">

  <!-- Left Card: Volume Scalability -->
  <g>
    <rect x="30" y="20" width="440" height="360" rx="8" fill="#fafafa" stroke="#ddd" stroke-width="1.5"/>

    <!-- Header -->
    <rect x="30" y="20" width="440" height="52" rx="8" fill="#8C1D40"/>
    <rect x="30" y="52" width="440" height="20" fill="#8C1D40"/>
    <text x="250" y="50" text-anchor="middle" font-size="20.5" font-weight="700" fill="white" font-family="Inter, sans-serif">Volume Scalability</text>
    <text x="250" y="67" text-anchor="middle" font-size="15.1" fill="#e0b0c0" font-family="Inter, sans-serif">(Scope)</text>

    <!-- Definition -->
    <text x="250" y="110" text-anchor="middle" font-size="15.1" fill="#333" font-family="Inter, sans-serif">Analyze thousands of binaries or repositories,</text>
    <text x="250" y="130" text-anchor="middle" font-size="15.1" fill="#333" font-family="Inter, sans-serif">not a handful. Cover entire firmware images.</text>

    <!-- Visual: growing bar chart -->
    <g transform="translate(250, 220)">
      <rect x="-60" y="10" width="25" height="25" fill="#8C1D40" opacity="0.4" rx="3"/>
      <rect x="-25" y="-5" width="25" height="40" fill="#8C1D40" opacity="0.6" rx="3"/>
      <rect x="10" y="-25" width="25" height="60" fill="#8C1D40" opacity="0.8" rx="3"/>
      <rect x="45" y="-50" width="25" height="85" fill="#8C1D40" rx="3"/>
      <!-- Labels -->
      <text x="-48" y="55" text-anchor="middle" font-size="14" fill="#888" font-family="Inter, sans-serif">10</text>
      <text x="-13" y="55" text-anchor="middle" font-size="14" fill="#888" font-family="Inter, sans-serif">100</text>
      <text x="22" y="55" text-anchor="middle" font-size="14" fill="#888" font-family="Inter, sans-serif">1K</text>
      <text x="57" y="55" text-anchor="middle" font-size="14" fill="#888" font-family="Inter, sans-serif">10K</text>
      <text x="5" y="75" text-anchor="middle" font-size="14" fill="#888" font-family="Inter, sans-serif">targets analyzed</text>
    </g>

    <!-- Bottom text -->
    <text x="250" y="330" text-anchor="middle" font-size="15.1" font-weight="700" fill="#8C1D40" font-family="Inter, sans-serif">Every binary, every repo, every target</text>
  </g>

  <!-- Right Card: Cost Scalability -->
  <g>
    <rect x="530" y="20" width="440" height="360" rx="8" fill="#fafafa" stroke="#ddd" stroke-width="1.5"/>

    <!-- Header -->
    <rect x="530" y="20" width="440" height="52" rx="8" fill="#333"/>
    <rect x="530" y="52" width="440" height="20" fill="#333"/>
    <text x="750" y="50" text-anchor="middle" font-size="20.5" font-weight="700" fill="white" font-family="Inter, sans-serif">Cost Scalability</text>
    <text x="750" y="67" text-anchor="middle" font-size="15.1" fill="#aaa" font-family="Inter, sans-serif">(Economics)</text>

    <!-- Definition -->
    <text x="750" y="110" text-anchor="middle" font-size="15.1" fill="#333" font-family="Inter, sans-serif">Achieve broad coverage at tractable expense.</text>
    <text x="750" y="130" text-anchor="middle" font-size="15.1" fill="#333" font-family="Inter, sans-serif">Sustainable economics for repeated use.</text>

    <!-- Visual: cost comparison -->
    <g transform="translate(750, 215)">
      <!-- Expensive bar -->
      <rect x="-70" y="-40" width="60" height="75" fill="#c62828" opacity="0.2" rx="4"/>
      <text x="-40" y="-48" text-anchor="middle" font-size="15.1" font-weight="600" fill="#c62828" font-family="Inter, sans-serif">$2K</text>
      <text x="-40" y="52" text-anchor="middle" font-size="14" fill="#888" font-family="Inter, sans-serif">per run</text>
      <!-- Arrow -->
      <text x="5" y="5" text-anchor="middle" font-size="19.4" fill="#888" font-family="Inter, sans-serif">→</text>
      <!-- Cheap bar -->
      <rect x="30" y="15" width="60" height="20" fill="#2e7d32" opacity="0.2" rx="4"/>
      <text x="60" y="7" text-anchor="middle" font-size="15.1" font-weight="600" fill="#2e7d32" font-family="Inter, sans-serif">$X</text>
      <text x="60" y="52" text-anchor="middle" font-size="14" fill="#888" font-family="Inter, sans-serif">per run</text>
    </g>

    <!-- Bottom text -->
    <text x="750" y="330" text-anchor="middle" font-size="15.1" font-weight="700" fill="#333" font-family="Inter, sans-serif">Sustainable without a budget crisis</text>
  </g>

</svg>

???

Scalability has two faces. Volume scalability means analyzing every binary in a firmware image, every repo in a competition, not cherry-picking the easy ones. Prior work analyzed 131 out of 3,699 binaries. Mango analyzed all of them. Cost scalability means doing so at tractable expense. Artiphishell consumed $50,000 in LLM credits and $80,000 in Azure compute for a single 143-hour competition run. Effective, but not sustainable. A scalable system must handle both dimensions: broad coverage at reasonable cost.
