---
type: content
title: "Large-Scale Evaluation: 1,698 Firmware Images"
---

<div id="chart-slide19" style="width:100%; margin:0 auto;"></div>
<script>
window.addEventListener("load", function() {
  const data = [
    {vendor: "Netgear", alerts: 6716, bins: 182600, samples: 305},
    {vendor: "Belkin", alerts: 2102, bins: 20018, samples: 62},
    {vendor: "D-Link", alerts: 907, bins: 95788, samples: 320},
    {vendor: "Asus", alerts: 635, bins: 104422, samples: 158},
    {vendor: "Linksys", alerts: 211, bins: 46470, samples: 67},
    {vendor: "TP-Link", alerts: 166, bins: 239020, samples: 484},
    {vendor: "Tenda", alerts: 56, bins: 29650, samples: 104},
    {vendor: "Trendnet", alerts: 31, bins: 41878, samples: 178},
    {vendor: "ZyXEL", alerts: 10, bins: 10528, samples: 20}
  ];

  const margin = {top: 15, right: 80, bottom: 25, left: 80};
  const width = 1100 - margin.left - margin.right;
  const height = 310 - margin.top - margin.bottom;

  const svg = d3.select("#chart-slide19").append("svg")
    .attr("viewBox", "0 0 1100 310").attr("width", "100%")
    .append("g").attr("transform", `translate(${margin.left},${margin.top})`);

  const y = d3.scaleBand().domain(data.map(d => d.vendor)).range([0, height]).padding(0.25);
  const x = d3.scaleLinear().domain([0, 7000]).range([0, width]);

  // Grid
  svg.selectAll(".grid").data(x.ticks(4)).enter().append("line")
    .attr("y1", 0).attr("y2", height)
    .attr("x1", d => x(d)).attr("x2", d => x(d))
    .attr("stroke", "#eee").attr("stroke-width", 1);

  // Bars
  svg.selectAll(".bar").data(data).enter().append("rect")
    .attr("y", d => y(d.vendor)).attr("height", y.bandwidth())
    .attr("x", 0).attr("width", d => x(d.alerts))
    .attr("fill", "#8C1D40").attr("rx", 3);

  // Value labels
  svg.selectAll(".val").data(data).enter().append("text")
    .attr("y", d => y(d.vendor) + y.bandwidth()/2 + 4)
    .attr("x", d => x(d.alerts) + 6)
    .style("font-size", "11px").style("font-weight", "700").style("fill", "#8C1D40")
    .text(d => d.alerts.toLocaleString());

  // Y-axis (vendor names)
  svg.append("g").call(d3.axisLeft(y).tickSize(0).tickPadding(8))
    .selectAll("text").style("font-size", "12px").style("fill", "#333");
  svg.select(".domain").remove();

  // X-axis
  svg.append("g").attr("transform", `translate(0,${height})`).call(d3.axisBottom(x).ticks(4).tickFormat(d3.format(",")))
    .selectAll("text").style("font-size", "10px").style("fill", "#666");

  // X-axis label
  svg.append("text").attr("x", width/2).attr("y", height + 22)
    .attr("text-anchor", "middle").style("font-size", "10px").style("fill", "#666").text("Vulnerability Alerts");
});
</script>

???

At large scale: 770,374 binaries across nine vendors — Netgear, D-Link, Belkin, TP-Link, Asus, and others. Average 38 seconds per binary. We audited a sample of 53 alerts and confirmed 37 as real vulnerabilities, a 70 percent true positive rate. Extrapolating across all alerts, 166 exploitable vulnerabilities. These are command injections, authentication bypasses, path traversals, real security issues in deployed firmware. Each alert includes the full Rich Expression chain from source to sink and the cross-binary connections through NVRAM. That's the evidence vendors need.
