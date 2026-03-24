---
type: content
title: "Binaries are Everywhere"
---

<div style="display:flex; align-items:center; justify-content:center; height:82vh; gap:70px; padding:0 80px;">
  <img src="presentation/figures/comp/macos.png" alt="macOS" style="height:390px;"/>
  <img src="presentation/figures/comp/word.png" alt="Microsoft Word" style="height:390px;"/>
  <img src="presentation/figures/comp/ida-pro.jpg" alt="IDA Pro" style="height:585px; border-radius:12px;"/>
</div>

???

Every day we use software whose code we don't have access to. MacOS, Microsoft Word, your favorite decompiler, the routers in your home. All running proprietary code whose source is inaccessible. We have no idea if there are latent vulnerabilities in these systems. But hiding the code doesn't hide the bugs. Binary analysis is the only option when source code is unavailable. And when you combine it with the scalability properties of static analysis, you get an approach that can analyze closed-source firmware across thousands of devices. That's the foundation this dissertation builds on.
