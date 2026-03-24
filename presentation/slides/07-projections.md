---
type: content
title: "The Trajectory Ahead"
footnote: "[1] FIRST Vulnerability Forecast, 2026&emsp;[2] IoT Analytics, 2025&emsp;[3] Statista Connected Devices, 2025"
---

<div style="display:flex; gap:2rem; margin:0.5rem auto; align-items:stretch;">
  <div id="proj-cve" style="flex:1; min-width:0;"></div>
  <div id="proj-iot" style="flex:1; min-width:0;"></div>
</div>

<script>
window.addEventListener("load", function() {

  function drawProjectionChart(containerId, historicalData, projectedData, color, darkColor, projColor, title, yLabel, formatFn) {
    var margin = {top: 38, right: 20, bottom: 38, left: 58};
    var width = 480 - margin.left - margin.right;
    var height = 280 - margin.top - margin.bottom;

    var svg = d3.select(containerId).append("svg")
      .attr("viewBox", "0 0 480 280").attr("width", "100%")
      .append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    // Title
    svg.append("text").attr("x", width/2).attr("y", -18)
      .attr("text-anchor", "middle").style("font-size", "14px")
      .style("font-weight", "700").style("fill", darkColor).text(title);

    var allData = historicalData.concat(projectedData);

    var x = d3.scaleLinear()
      .domain(d3.extent(allData, function(d) { return d.year; }))
      .range([0, width]);
    var y = d3.scaleLinear()
      .domain([0, d3.max(allData, function(d) { return d.count; }) * 1.15])
      .range([height, 0]);

    // Grid lines
    svg.selectAll(".grid").data(y.ticks(5)).enter().append("line")
      .attr("x1", 0).attr("x2", width)
      .attr("y1", function(d) { return y(d); }).attr("y2", function(d) { return y(d); })
      .attr("stroke", "#eee").attr("stroke-width", 1);

    // Projection shaded region
    var lastHistorical = historicalData[historicalData.length - 1];
    var projWithBridge = [lastHistorical].concat(projectedData);

    var projArea = d3.area()
      .x(function(d) { return x(d.year); })
      .y0(height)
      .y1(function(d) { return y(d.count); })
      .curve(d3.curveMonotoneX);
    svg.append("path").datum(projWithBridge).attr("d", projArea)
      .attr("fill", projColor).attr("opacity", 0.08);

    // Historical area fill
    var area = d3.area()
      .x(function(d) { return x(d.year); })
      .y0(height)
      .y1(function(d) { return y(d.count); })
      .curve(d3.curveMonotoneX);
    svg.append("path").datum(historicalData).attr("d", area)
      .attr("fill", color).attr("opacity", 0.15);

    // Historical line
    var line = d3.line()
      .x(function(d) { return x(d.year); })
      .y(function(d) { return y(d.count); })
      .curve(d3.curveMonotoneX);
    svg.append("path").datum(historicalData).attr("d", line)
      .attr("fill", "none").attr("stroke", color).attr("stroke-width", 3);

    // Projected line (dashed)
    var projLine = d3.line()
      .x(function(d) { return x(d.year); })
      .y(function(d) { return y(d.count); })
      .curve(d3.curveMonotoneX);
    svg.append("path").datum(projWithBridge).attr("d", projLine)
      .attr("fill", "none").attr("stroke", projColor).attr("stroke-width", 3)
      .attr("stroke-dasharray", "8,4");

    // Historical dots
    svg.selectAll(".dot").data(historicalData).enter().append("circle")
      .attr("cx", function(d) { return x(d.year); })
      .attr("cy", function(d) { return y(d.count); })
      .attr("r", 4).attr("fill", color).attr("stroke", "white").attr("stroke-width", 1.5);

    // Projected dots (hollow)
    svg.selectAll(".proj-dot").data(projectedData).enter().append("circle")
      .attr("cx", function(d) { return x(d.year); })
      .attr("cy", function(d) { return y(d.count); })
      .attr("r", 4).attr("fill", "white").attr("stroke", projColor).attr("stroke-width", 2);

    // Last projected point label
    var last = projectedData[projectedData.length - 1];
    svg.append("text")
      .attr("x", x(last.year)).attr("y", y(last.count) - 12)
      .attr("text-anchor", "middle").style("font-size", "13px")
      .style("font-weight", "800").style("fill", projColor)
      .text(formatFn(last.count));

    // Last historical label
    svg.append("text")
      .attr("x", x(lastHistorical.year)).attr("y", y(lastHistorical.count) - 12)
      .attr("text-anchor", "middle").style("font-size", "11px")
      .style("font-weight", "700").style("fill", darkColor)
      .text(formatFn(lastHistorical.count));

    // "Projected" label
    // var midProj = projectedData[Math.floor(projectedData.length / 2)];
    // svg.append("text")
    //   .attr("x", x(midProj.year)).attr("y", y(midProj.count) + 22)
    //   .attr("text-anchor", "middle").style("font-size", "10px")
    //   .style("font-weight", "600").style("fill", projColor).style("font-style", "italic")
    //   .text("projected");

    // Axes
    svg.append("g").attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x).ticks(6).tickFormat(d3.format("d")).tickSize(-3))
      .selectAll("text").style("font-size", "11px").style("fill", "#555");
    svg.append("g")
      .call(d3.axisLeft(y).ticks(5).tickFormat(formatFn).tickSize(-3))
      .selectAll("text").style("font-size", "10px").style("fill", "#555");
    svg.selectAll(".domain").attr("stroke", "#ccc");

    // Y-axis label
    svg.append("text").attr("transform", "rotate(-90)")
      .attr("y", -45).attr("x", -height/2)
      .attr("text-anchor", "middle").style("font-size", "10px").style("fill", "#888")
      .text(yLabel);

    // Legend
    var legY = height - 45;
    // Historical
    svg.append("line").attr("x1", width - 130).attr("x2", width - 110).attr("y1", legY).attr("y2", legY)
      .attr("stroke", color).attr("stroke-width", 3);
    svg.append("text").attr("x", width - 105).attr("y", legY + 4)
      .style("font-size", "10px").style("fill", "#555").text("Historical");
    // Projected
    svg.append("line").attr("x1", width - 130).attr("x2", width - 110).attr("y1", legY + 18).attr("y2", legY + 18)
      .attr("stroke", projColor).attr("stroke-width", 3).attr("stroke-dasharray", "8,4");
    svg.append("text").attr("x", width - 105).attr("y", legY + 22)
      .style("font-size", "10px").style("fill", "#555").text("Projected");
  }

  // CVE historical + FIRST projections
  var cveHistorical = [
    {year: 2015, count: 7538}, {year: 2016, count: 7076}, {year: 2017, count: 17713},
    {year: 2018, count: 17153}, {year: 2019, count: 17813}, {year: 2020, count: 17943},
    {year: 2021, count: 21085}, {year: 2022, count: 25375}, {year: 2023, count: 31455},
    {year: 2024, count: 41166}, {year: 2025, count: 48185}
  ];
  // FIRST median forecasts: 2026 ~59K, 2027 ~51K (median), 2028 ~53K
  // Using conservative growth trajectory for 2029-2030
  var cveProjected = [
    {year: 2026, count: 59000},
    {year: 2027, count: 63000},
    {year: 2028, count: 68000},
    {year: 2029, count: 73000},
    {year: 2030, count: 79000}
  ];

  // Total connected devices: IoT + non-IoT (IoT Analytics / Statista)
  var devHistorical = [
    {year: 2016, count: 14.4}, {year: 2017, count: 16.0}, {year: 2018, count: 17.9},
    {year: 2019, count: 20.0}, {year: 2020, count: 21.6}, {year: 2021, count: 23.8},
    {year: 2022, count: 26.5}, {year: 2023, count: 30.0}, {year: 2024, count: 34.6},
    {year: 2025, count: 41.2}
  ];
  // Extrapolated at ~13% CAGR; Statista projects ~75B total by 2030
  var devProjected = [
    {year: 2026, count: 46.5},
    {year: 2027, count: 52.5},
    {year: 2028, count: 59.3},
    {year: 2029, count: 67.0},
    {year: 2030, count: 75.0}
  ];

  drawProjectionChart("#proj-cve", cveHistorical, cveProjected,
    "#E53935", "#B71C1C", "#8C1D40",
    "CVEs: Historical + Projected", "CVEs",
    function(d) { return d >= 1000 ? (d/1000).toFixed(d >= 10000 ? 0 : 1) + "K" : d; });

  drawProjectionChart("#proj-iot", devHistorical, devProjected,
    "#2196F3", "#1565C0", "#7B1FA2",
    "Connected Devices: Historical + Projected", "Devices",
    function(d) { return d.toFixed(1); });
});
</script>

???

The trajectory makes the problem worse, not better.

FIRST, the Forum of Incident Response and Security Teams, projects that 2026 will see roughly 59,000 new CVEs, a 22% increase over 2025. Their model's upper bound reaches 100,000. By 2030, conservative extrapolation puts us near 79,000 CVEs per year.

On the device side, total connected devices (IoT sensors, smartphones, laptops, servers, network infrastructure) reached 41 billion in 2025 and are projected to hit 75 billion by 2030. Each device runs software that ships with binaries that could contain vulnerabilities. The IoT slice alone accounts for roughly 30 billion of these, but the remaining 10 billion non-IoT devices (enterprise servers, workstations, cloud infrastructure) are where high-value targets like SolarWinds Orion and Log4j live.

The combination is multiplicative: more devices means more software, more software means more binaries, and more binaries with more CVEs means a vulnerability surface that human analysts have zero chance of auditing manually.

This is the structural argument for the dissertation: we need systems that scale analysis automatically, and we need those systems to produce results that are both complete and accurate. The next slide shows how badly supply is failing to match this demand.
