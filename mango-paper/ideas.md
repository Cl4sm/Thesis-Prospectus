# Paper

- Compare #alerts per binary vs SaTC
- Take a look at the ? in the manual eval
    - I think a lot of env variables might actually be injectable from a cgi i.e. "FIRMWARE_NAME"

# Analysis

- Filter:
    - no XREFS
        - puhttpsniff becomes a problem here
    - global variables with no writes
        - I'd like to know why this is so common in firmware but who knows??

- Generate a list of sources for the sink in mango
    - It'd be cool to see if it came from argv/nvram/read

- An analysis of process calling IPC
    - I.e. if we know that a program is vulnerable via argv can we find another program that calls it?

- Better resolution of nvram variables
    - Maybe we can include a trace of the nvram setter sinks where we see getter sinks
    - Right now I filter all NVRAM with unknown setters, but I feel like this causes a lot of false negatives