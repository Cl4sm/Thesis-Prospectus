---
type: content
title: "Evaluation: Karonte Dataset"
---

<div id="chart-slide18" style="width:100%; margin:0 auto;"></div>
<script>
window.addEventListener("load", function() {
  const metrics = [
    {label: "Binaries Analyzed", satc: 131, mango: 3599, mult: "27x"},
    {label: "Alerted Binaries", satc: 52, mango: 174, mult: "3.3x"},
    {label: "Total Alerts", satc: 144, mango: 2310, mult: "16x"}
  ];

  const margin = {top: 25, right: 100, bottom: 20, left: 150};
  const width = 1100 - margin.left - margin.right;
  const height = 240 - margin.top - margin.bottom;
  const barH = 28;
  const groupH = 75;

  const svg = d3.select("#chart-slide18").append("svg")
    .attr("viewBox", "0 0 1100 240").attr("width", "100%")
    .append("g").attr("transform", `translate(${margin.left},${margin.top})`);

  metrics.forEach((m, i) => {
    const gy = i * groupH;
    const maxVal = m.mango;
    const scale = d3.scaleLinear().domain([0, maxVal]).range([0, width]);

    // Metric label
    svg.append("text").attr("x", -10).attr("y", gy + barH)
      .attr("text-anchor", "end").style("font-size", "13px").style("font-weight", "600").style("fill", "#333")
      .text(m.label);

    // SaTC bar
    svg.append("rect").attr("x", 0).attr("y", gy + 4)
      .attr("width", Math.max(scale(m.satc), 3)).attr("height", barH)
      .attr("fill", "#ccc").attr("rx", 3);
    svg.append("text").attr("x", scale(m.satc) + 8).attr("y", gy + barH - 5)
      .style("font-size", "12px").style("fill", "#666").text(m.satc.toLocaleString());

    // Mango bar
    svg.append("rect").attr("x", 0).attr("y", gy + barH + 8)
      .attr("width", scale(m.mango)).attr("height", barH)
      .attr("fill", "#8C1D40").attr("rx", 3);
    svg.append("text").attr("x", scale(m.mango) + 8).attr("y", gy + barH*2 + 3)
      .style("font-size", "12px").style("font-weight", "700").style("fill", "#8C1D40")
      .text(m.mango.toLocaleString());

    // Multiplier badge
    svg.append("text").attr("x", width + 50).attr("y", gy + barH + 10)
      .attr("text-anchor", "middle")
      .style("font-size", "16px").style("font-weight", "800").style("fill", "#8C1D40")
      .text(m.mult);

    // Tool labels (only on first group)
    if (i === 0) {
      svg.append("text").attr("x", scale(m.satc) + 40).attr("y", gy + barH - 5)
        .style("font-size", "10px").style("fill", "#999").text("SaTC");
      svg.append("text").attr("x", scale(m.mango) + 50).attr("y", gy + barH*2 + 3)
        .style("font-size", "10px").style("fill", "#8C1D40").text("Mango");
    }
  });
});
</script>

???

We evaluated Mango on the same dataset prior work used. [CLICK] Mango analyzed 27 times more binaries than SaTC in comparable wall-clock time. SaTC analyzed 131 binaries in 861 hours. Mango analyzed 3,599 binaries in 946 hours. That's 49 times faster per binary, eight minutes average. [CLICK] Not just faster coverage, but higher quality. Mango found bugs in 3.3 times more binaries. SaTC found bugs in 52 binaries, Mango in 174. The algorithm works: Rich Expressions improve precision, sink-to-source and Assumed Nonimpact deliver scalability, and the combination finds vulnerabilities prior work completely missed.
