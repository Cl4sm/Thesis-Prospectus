---
type: content
title: "Firmware in Embedded Devices"
---

<div style="display:flex; justify-content:center; gap:4rem; margin:0.5rem 0 1.5rem 0;">
  <div style="text-align:center;">
    <svg width="300" height="250" viewBox="0 0 120 100">
      <!-- Router body -->
      <rect x="15" y="45" width="90" height="35" rx="5" fill="#555" stroke="#333" stroke-width="1.5"/>
      <!-- Top panel/ventilation -->
      <rect x="18" y="48" width="84" height="12" rx="2" fill="#444"/>
      <line x1="30" y1="48" x2="30" y2="60" stroke="#666" stroke-width="0.8"/>
      <line x1="45" y1="48" x2="45" y2="60" stroke="#666" stroke-width="0.8"/>
      <line x1="60" y1="48" x2="60" y2="60" stroke="#666" stroke-width="0.8"/>
      <line x1="75" y1="48" x2="75" y2="60" stroke="#666" stroke-width="0.8"/>
      <line x1="90" y1="48" x2="90" y2="60" stroke="#666" stroke-width="0.8"/>
      <!-- Left antenna -->
      <line x1="22" y1="45" x2="12" y2="15" stroke="#555" stroke-width="3" stroke-linecap="round"/>
      <circle cx="12" cy="15" r="2.5" fill="#4CAF50"/>
      <!-- Right antenna -->
      <line x1="98" y1="45" x2="108" y2="15" stroke="#555" stroke-width="3" stroke-linecap="round"/>
      <circle cx="108" cy="15" r="2.5" fill="#4CAF50"/>
      <!-- Status LEDs -->
      <circle cx="35" cy="70" r="2.5" fill="#4CAF50"/>
      <circle cx="50" cy="70" r="2.5" fill="#E53935"/>
      <circle cx="65" cy="70" r="2.5" fill="#4CAF50"/>
      <circle cx="80" cy="70" r="2.5" fill="#4CAF50"/>
      <!-- Bottom accent -->
      <rect x="15" y="77" width="90" height="3" rx="1" fill="#444"/>
    </svg>
    <div style="font-size:1.8rem; color:#333; margin-top:0.5rem;"><strong>Router</strong></div>
  </div>
  <div style="text-align:center;">
    <svg width="200" height="250" viewBox="0 0 80 100">
      <!-- NAS body -->
      <rect x="15" y="8" width="50" height="85" rx="4" fill="#555" stroke="#333" stroke-width="1.5"/>
      <!-- Drive bay 1 -->
      <rect x="20" y="15" width="40" height="12" rx="1" fill="#666" stroke="#444" stroke-width="1"/>
      <rect x="23" y="17" width="6" height="8" rx="0.5" fill="#444"/>
      <line x1="31" y1="19" x2="55" y2="19" stroke="#777" stroke-width="0.8"/>
      <!-- Drive bay 2 -->
      <rect x="20" y="30" width="40" height="12" rx="1" fill="#666" stroke="#444" stroke-width="1"/>
      <rect x="23" y="32" width="6" height="8" rx="0.5" fill="#444"/>
      <line x1="31" y1="34" x2="55" y2="34" stroke="#777" stroke-width="0.8"/>
      <!-- Drive bay 3 -->
      <rect x="20" y="45" width="40" height="12" rx="1" fill="#666" stroke="#444" stroke-width="1"/>
      <rect x="23" y="47" width="6" height="8" rx="0.5" fill="#444"/>
      <line x1="31" y1="49" x2="55" y2="49" stroke="#777" stroke-width="0.8"/>
      <!-- Drive bay 4 -->
      <rect x="20" y="60" width="40" height="12" rx="1" fill="#666" stroke="#444" stroke-width="1"/>
      <rect x="23" y="62" width="6" height="8" rx="0.5" fill="#444"/>
      <line x1="31" y1="64" x2="55" y2="64" stroke="#777" stroke-width="0.8"/>
      <!-- Power/status LEDs -->
      <circle cx="60" cy="20" r="2" fill="#4CAF50"/>
      <circle cx="60" cy="37" r="2" fill="#4CAF50"/>
      <circle cx="60" cy="52" r="2" fill="#E53935"/>
      <circle cx="60" cy="67" r="2" fill="#4CAF50"/>
      <!-- Bottom port area -->
      <rect x="18" y="77" width="44" height="10" rx="1" fill="#444"/>
      <circle cx="40" cy="82" r="2" fill="#4CAF50"/>
    </svg>
    <div style="font-size:1.8rem; color:#333; margin-top:0.5rem;"><strong>NAS</strong></div>
  </div>
  <div style="text-align:center;">
    <svg width="300" height="250" viewBox="0 0 120 100">
      <!-- Mounting bracket -->
      <rect x="50" y="65" width="20" height="18" rx="2" fill="#555" stroke="#333" stroke-width="1"/>
      <!-- Camera dome/body -->
      <circle cx="60" cy="38" r="22" fill="#555" stroke="#333" stroke-width="1.5"/>
      <!-- Lens ring -->
      <circle cx="60" cy="38" r="16" fill="#666" stroke="#444" stroke-width="1"/>
      <!-- Glass dome highlight -->
      <circle cx="60" cy="38" r="13" fill="none" stroke="#777" stroke-width="1" opacity="0.6"/>
      <!-- Lens center -->
      <circle cx="60" cy="38" r="8" fill="#333" stroke="#444" stroke-width="0.8"/>
      <!-- Lens reflection -->
      <circle cx="58" cy="36" r="3" fill="#888" opacity="0.7"/>
      <!-- Status LED -->
      <circle cx="60" cy="58" r="2" fill="#E53935"/>
      <!-- Connector base -->
      <rect x="55" y="58" width="10" height="6" rx="1" fill="#444"/>
    </svg>
    <div style="font-size:1.8rem; color:#333; margin-top:0.5rem;"><strong>Camera</strong></div>
  </div>
</div>

???

Most firmware uses Type I architecture: embedded Linux with user-space ELF binaries. Over 86 percent of images we see follow this pattern. The binaries expose network services, things like web interfaces, UPnP protocols, custom daemons. What matters for vulnerability analysis is how they communicate with each other. They don't use conventional IPC. Instead they share state through NVRAM, persistent key-value storage; through files in shared directories; through sockets. This shared-state model is what makes single-binary analysis fail.
