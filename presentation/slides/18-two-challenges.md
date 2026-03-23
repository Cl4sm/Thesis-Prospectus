---
type: content
title: "Existing Tools Miss Most Vulnerable Binaries"
---

<div id="chart-slide11" style="width:100%; margin:0 auto;"></div>
<script>
window.addEventListener("load", function() {
  const data = [
    {vendor: "Netgear", SaTC: 2, Karonte: 6, Mango: 23},
    {vendor: "Tenda", SaTC: 1, Karonte: 1, Mango: 9},
    {vendor: "D-Link", SaTC: 1, Karonte: 2, Mango: 7},
    {vendor: "TP-Link", SaTC: 1, Karonte: 4, Mango: 3}
  ];
  const tools = ["SaTC", "Karonte", "Mango"];
  const colors = {SaTC: "#ccc", Karonte: "#888", Mango: "#8C1D40"};

  const margin = {top: 40, right: 30, bottom: 45, left: 55};
  const width = 1050 - margin.left - margin.right;
  const height = 320 - margin.top - margin.bottom;

  const svg = d3.select("#chart-slide11").append("svg")
    .attr("viewBox", `0 0 1050 320`)
    .attr("width", "100%")
    .append("g").attr("transform", `translate(${margin.left},${margin.top})`);

  // Scales
  const x0 = d3.scaleBand().domain(data.map(d => d.vendor)).range([0, width]).padding(0.3);
  const x1 = d3.scaleBand().domain(tools).range([0, x0.bandwidth()]).padding(0.08);
  const y = d3.scaleLinear().domain([0, 25]).range([height, 0]);

  // Grid
  svg.selectAll(".grid").data(y.ticks(5)).enter().append("line")
    .attr("x1", 0).attr("x2", width)
    .attr("y1", d => y(d)).attr("y2", d => y(d))
    .attr("stroke", "#eee").attr("stroke-width", 1);

  // Axes
  svg.append("g").attr("transform", `translate(0,${height})`).call(d3.axisBottom(x0).tickSize(0))
    .selectAll("text").style("font-size", "13px").style("font-weight", "600").style("fill", "#333");
  svg.append("g").call(d3.axisLeft(y).ticks(5).tickSize(-4))
    .selectAll("text").style("font-size", "11px").style("fill", "#555");
  svg.select(".domain").remove();

  // Y-axis label
  svg.append("text").attr("transform", "rotate(-90)").attr("y", -42).attr("x", -height/2)
    .attr("text-anchor", "middle").style("font-size", "11px").style("fill", "#555")
    .text("Unique Vulnerable Binaries");

  // Bars
  const groups = svg.selectAll(".group").data(data).enter().append("g")
    .attr("transform", d => `translate(${x0(d.vendor)},0)`);
  tools.forEach(tool => {
    groups.append("rect")
      .attr("x", x1(tool)).attr("width", x1.bandwidth())
      .attr("y", d => y(d[tool])).attr("height", d => height - y(d[tool]))
      .attr("fill", colors[tool]).attr("rx", 2);
    groups.append("text")
      .attr("x", x1(tool) + x1.bandwidth()/2)
      .attr("y", d => y(d[tool]) - 4)
      .attr("text-anchor", "middle").style("font-size", "11px").style("font-weight", "700")
      .style("fill", tool === "Mango" ? "#8C1D40" : "#666")
      .text(d => d[tool]);
  });

  // Legend
  const legend = svg.append("g").attr("transform", `translate(${width/2 - 120}, -25)`);
  tools.forEach((t, i) => {
    legend.append("rect").attr("x", i*100).attr("y", 0).attr("width", 12).attr("height", 12)
      .attr("fill", colors[t]).attr("rx", 2);
    legend.append("text").attr("x", i*100+16).attr("y", 10)
      .style("font-size", "12px").style("fill", "#333").text(t);
  });
});
</script>

???

This chart shows the payoff. On the Karonte dataset, Mango finds vulnerabilities in 42 unique binaries. [CLICK] Prior work found 5 and 13. The gap is not a small improvement. It's the difference between missing critical infrastructure and catching it. The problem prior tools face: they must choose which binaries to analyze. Karonte's BDG expands from border binary seeds through IPC key matching, but the resulting graph captures only a fraction of the firmware. SaTC's frontend keyword matching excludes binaries without web interface overlap. Both approaches create a discovery radius that leaves vulnerable binaries outside. Mango's answer is to analyze every binary but do so efficiently.
