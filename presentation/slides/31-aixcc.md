---
type: content
title: "The AI Cyber Challenge"
---

<div style="display:flex; gap:32px; align-items:center; padding:0 16px; height:82vh;">
  <!-- Left: AIxCC Finals Image -->
  <div style="flex:0 0 32%; display:flex; align-items:center; justify-content:center;">
    <img src="AIxCC_Finals_dark.png" alt="DARPA AIxCC Finals" style="width:100%; border-radius:10px; box-shadow:0 4px 16px rgba(0,0,0,0.15);"/>
  </div>

  <!-- Right: Stat Grid -->
  <div style="flex:1; display:flex; flex-direction:column; justify-content:center; gap:16px;">
    <!-- Row 1: Competition scope -->
    <div style="display:flex; gap:16px;">
      <div style="flex:1; background:rgba(33,150,243,0.08); border:2px solid #2196F3; border-radius:10px; padding:22px 14px; text-align:center;">
        <div style="font-size:64px; font-weight:800; color:#2196F3; font-family:Inter,sans-serif; line-height:1;">28</div>
        <div style="font-size:22px; color:#333; font-family:Inter,sans-serif; margin-top:8px;">Repositories</div>
      </div>
      <div style="flex:1; background:rgba(33,150,243,0.08); border:2px solid #2196F3; border-radius:10px; padding:22px 14px; text-align:center;">
        <div style="font-size:64px; font-weight:800; color:#2196F3; font-family:Inter,sans-serif; line-height:1;">53</div>
        <div style="font-size:22px; color:#333; font-family:Inter,sans-serif; margin-top:8px;">Challenge Projects</div>
      </div>
      <div style="flex:1; background:rgba(33,150,243,0.08); border:2px solid #2196F3; border-radius:10px; padding:22px 14px; text-align:center;">
        <div style="font-size:64px; font-weight:800; color:#2196F3; font-family:Inter,sans-serif; line-height:1;">63</div>
        <div style="font-size:22px; color:#333; font-family:Inter,sans-serif; margin-top:8px;">Injected Vulns</div>
      </div>
    </div>

    <!-- Row 2: Teams -->
    <div style="display:flex; gap:16px;">
      <div style="flex:2; background:rgba(33,150,243,0.08); border:2px solid #2196F3; border-radius:10px; padding:22px 14px; text-align:center;">
        <div style="font-size:64px; font-weight:800; color:#2196F3; font-family:Inter,sans-serif; line-height:1;">42</div>
        <div style="font-size:22px; color:#333; font-family:Inter,sans-serif; margin-top:8px;">Initial Competitors</div>
      </div>
      <div style="flex:1; background:rgba(33,150,243,0.08); border:2px solid #2196F3; border-radius:10px; padding:22px 14px; text-align:center;">
        <div style="font-size:64px; font-weight:800; color:#2196F3; font-family:Inter,sans-serif; line-height:1;">7</div>
        <div style="font-size:22px; color:#333; font-family:Inter,sans-serif; margin-top:8px;">Finalist CRS Teams</div>
      </div>
    </div>

    <!-- Row 3: Key metrics -->
    <div style="display:flex; gap:16px;">
      <div style="flex:1; background:rgba(255,152,0,0.08); border:2px solid #FF9800; border-radius:10px; padding:22px 14px; text-align:center;">
        <div style="font-size:64px; font-weight:800; color:#FF9800; font-family:Inter,sans-serif; line-height:1;">143</div>
        <div style="font-size:22px; color:#333; font-family:Inter,sans-serif; margin-top:8px;">Hours Autonomous</div>
      </div>
      <div style="flex:1; background:rgba(76,175,80,0.08); border:2px solid #4CAF50; border-radius:10px; padding:22px 14px; text-align:center;">
        <div style="font-size:64px; font-weight:800; color:#4CAF50; font-family:Inter,sans-serif; line-height:1;">$29.5M</div>
        <div style="font-size:22px; color:#333; font-family:Inter,sans-serif; margin-top:8px;">DARPA Investment</div>
      </div>
      <div style="flex:1; background:rgba(156,39,176,0.08); border:2px solid #9C27B0; border-radius:10px; padding:22px 14px; text-align:center;">
        <div style="font-size:64px; font-weight:800; color:#9C27B0; font-family:Inter,sans-serif; line-height:1;">Zero</div>
        <div style="font-size:22px; color:#333; font-family:Inter,sans-serif; margin-top:8px;">Human Intervention</div>
      </div>
    </div>
  </div>
</div>

???

DARPA's Autonomous Cyber Reasoning System competition. The challenge: build a fully autonomous system that discovers zero-day vulnerabilities, analyzes root causes, and patches them without human intervention. Forty-two teams entered, seven reached the finals. The targets are real open-source projects: Linux Kernel, NGINX, Tika, Jenkins, SQLite, CPython. Sixty-three vulnerabilities were injected across fifty-three challenge projects spanning twenty-eight repositories covering both C and Java. The competition ran for 143 hours with zero human intervention. Every Cyber Reasoning System operated fully autonomously for nearly a week straight. The scale matters because it forced every team to build systems that generalize across multiple languages, vulnerability classes, and project architectures. No single technique handles that breadth. That constraint shaped our entire architectural approach. Team Shellphish competed in both semifinals and finals, running Artiphishell as the core validation and patching engine.
