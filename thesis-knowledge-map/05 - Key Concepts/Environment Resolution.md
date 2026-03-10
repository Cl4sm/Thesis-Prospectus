# Environment Resolution

A component of [[Operation Mango]] that tracks data flow across binary boundaries.

## The Problem
IoT firmware runs multiple binaries that communicate through NVRAM, environment variables, and IPC channels. A vulnerability might span two binaries: `httpd` writes user input to NVRAM, `dlnad` reads it and passes it to `system()`. Tools that only analyze individual binaries (like [[DTaint]]) miss these. Tools that filter to "border binaries" (like [[Karonte]], [[SaTC]]) miss the non-obvious communication paths.

## The Approach
Mango resolves:
- NVRAM getter/setter pairs across binaries
- Environment variable propagation
- IPC channels between processes

## The dlnad Example
The canonical cross-binary vulnerability: `httpd` exposes an `iserver_passcode` parameter that flows through NVRAM into `dlnad`, where it reaches a command injection sink. SaTC misses this because `dlnad` has too few frontend keyword references to be selected as a border binary.

## Related
- [[Operation Mango]]
- [[MangoDFA]]
- [[TruPoCs]]
