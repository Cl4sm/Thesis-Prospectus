# [Karonte](https://escholarship.org/content/qt53p09210/qt53p09210.pdf)
 
### __Overview__
- capable of analyzing embedded-device firmware by modeling and tracking multi-binary interactions
- We first evaluated KARONTE on 53 firmware samples from various
vendors, showing that our prototype tool can successfully track
and constrain multi-binary interactions, this led to the discovery of 46 zero-day bugs 
-  Then, we performed a large-scale experiment
on 899 different samples
- In our comparison between KARONTE’s multi-binary
analysis approach and the same analysis run in single-binary
mode (i.e., with inter-binary data flow tracking disabled), the
number of produced alerts increased from an average of 2 to
an average of 722 per sample: KARONTE provided an alert
reduction of two orders of magnitude and a resulting low
false-positive rate
- focuses on attacks that can be carried out by input from the network
- CWEs
    - Memory Corruption
    - DoS

### __Listed Contributions__
- We introduce novel combinations of static analysis
techniques to perform multi-binary taint analysis. To do
so, we design a novel technique to precisely apply and
propagate taint information across multiple binaries.
- We propose KARONTE, a novel static analysis approach to
identify insecure interactions between binaries. KARONTE
radically reduces the number of false positives, making
real-world firmware analysis practical.
- We implement and evaluate our prototype of KARONTE
on 53 real-world firmware samples, showing that our
tool can successfully propagate taint information across
multiple binaries, resulting in the discovery of 46
unknown (zero-day) bugs, and producing few false
positives. Then, we leverage a bigger dataset of 899
firmware samples to assess the performance of our tool.
- The results obtained by our tool were thoroughly verified
by an independent researcher at another university.

### __IPC Paradigms__
- Files
- Shared Memory
- Environment Variables
- Sockets
- Command Line Arguments


### __Run Procedure__
- Firmware Pre-processing: input is entire firmware image, KARONTE unpacks the firmware with binwalk
- Border Binaries Discovery: Binaries that can accept external user requests, i.e. network. Karonte then identifies program points that reference attacker-controlled data
- Binary Dependency Graph (BDG) Recovery: Digraph that Models communications among border binaries. Iteratively recovered by leveraging a collection of Communication Paradigm Finder moduels
- Multi-binary Data-flow Analysis: propagate constraints to binaries that have incoming edges from border binaries
- Insecure Interactions Detection: Identifies insecure attacker-controlled data flows

### __Border Binaries Discovery__
- Five features to identify functions in embedded systems that implement network communication parsers
    - #bb
    - #br
    - #cmp
    - #net
    - #conn
-  #net incremented for every comparison of a network-encoded string
- #conn indicates if any data read from a network socket is used in a memory comparison
- Uses parsing score that was found emperically to cluster binaries and select a cluster with the binary that has the single highest score as the network facing binaries

### __Static Taint Analysis__
- based on BootStomp
- performs symbolic path exploration from program point tainting any source hit
- untaints overwritten or constrained data

### __Evaluation__
- Datasets
    - Recent Linux Based Firmwares: NETGEAR, TP-Link, D-Link, and Tenda
    - Firmware Blobs
- Analyzed 53 different samples in A total average? time of 33 hours
- Total # of alerts is 87
    - 51 were true positives (34 multi-binary 17 single-binary)
    - ~58.62% TP to FP Ratio
- True Positive if the bug can be exploited
- Acquired two devices and crafted PoCs for three vulnerabilities
- 20 were duplicate codebase bugs, 12 confirmed statically, and the rest via vendors

### __Limitations__
- Karonte argues that adding IPC reduced their alerts by 2 orders of magnitude creating a low false positive rate. However, I think this might be a logic flaw as a relatively low number of reports would inherently reduce the FP from the much larger set.
- Taint Analysis starts from program start and not source
- Very slow, can take hours to run on a single firmware

### __Strengths__
- showing that KARONTE scales well with firmware samples of different size and complexity by running on 899 different samples
- Can model border binaries and external data-flow limiting necessary binaries to look through
- Low number of alerts is manageable

---

## Comparison to Operation Mango
- Karonte posits that focusing on all binaries in isolation would produce an unacceptable amount of false alerts
- Mango does not model border binaries and only models stand alone binaries along with some IPC such as ENV and NVRAM variables
- Karonte must explore all program paths for sources, Mango has no need to do this
- Karonte needs special logic for pointer aliasing, but that's of no consequence for Mango as our memory model handles this
- Mango does not unpack firmware and will not work on firmware blobs
- Mango is much faster, what takes Karonte 49 hours takes Mango 17 hours