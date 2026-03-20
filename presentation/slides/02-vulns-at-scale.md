---
type: content
title: "Software Vulnerabilities at Scale"
footnote: "[1] <a href='https://www.cvefind.com/en/cve-statistic-date.html'>cvefind.com/en/cve-statistic-date.html</a>&emsp;[2] <a href='https://www.demandsage.com/number-of-iot-devices/'>demandsage.com/number-of-iot-devices</a>"
---

<div style="display:flex; gap:2rem; margin:0.5rem auto; align-items:stretch;">
  <div id="chart-cve" style="flex:1; min-width:0;"></div>
  <div id="chart-iot" style="flex:1; min-width:0;"></div>
</div>

<div style="text-align:center; margin-top:0.5rem; font-size:1.05rem; color:#333; font-weight:600;">
  4.8 million unfilled cybersecurity positions globally. Manual analysis cannot keep pace.
</div>


<script>
window.addEventListener("load", function() {
  // CVE data (source: CVE Find)
  const cveData = [
    {year: 2015, count: 7538}, {year: 2016, count: 7076}, {year: 2017, count: 17713},
    {year: 2018, count: 17153}, {year: 2019, count: 17813}, {year: 2020, count: 17943},
    {year: 2021, count: 21085}, {year: 2022, count: 25375}, {year: 2023, count: 31455},
    {year: 2024, count: 41166}
  ];

  // IoT data (source: DemandSage / Statista)
  const iotData = [
    {year: 2016, count: 4.6}, {year: 2017, count: 6.1}, {year: 2018, count: 8.0},
    {year: 2019, count: 10.0}, {year: 2020, count: 11.7}, {year: 2021, count: 13.8},
    {year: 2022, count: 13.8}, {year: 2023, count: 15.7}, {year: 2024, count: 17.7},
    {year: 2025, count: 19.8}
  ];

  function drawChart(containerId, data, color, darkColor, title, yLabel, formatFn) {
    const margin = {top: 38, right: 20, bottom: 38, left: 58};
    const width = 480 - margin.left - margin.right;
    const height = 280 - margin.top - margin.bottom;

    const svg = d3.select(containerId).append("svg")
      .attr("viewBox", "0 0 480 280").attr("width", "100%")
      .append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    // Title
    svg.append("text").attr("x", width/2).attr("y", -18)
      .attr("text-anchor", "middle").style("font-size", "14px")
      .style("font-weight", "700").style("fill", darkColor).text(title);

    const x = d3.scaleLinear()
      .domain(d3.extent(data, function(d) { return d.year; }))
      .range([0, width]);
    const y = d3.scaleLinear()
      .domain([0, d3.max(data, function(d) { return d.count; }) * 1.12])
      .range([height, 0]);

    // Grid lines
    svg.selectAll(".grid").data(y.ticks(5)).enter().append("line")
      .attr("x1", 0).attr("x2", width)
      .attr("y1", function(d) { return y(d); }).attr("y2", function(d) { return y(d); })
      .attr("stroke", "#eee").attr("stroke-width", 1);

    // Area fill
    var area = d3.area()
      .x(function(d) { return x(d.year); })
      .y0(height)
      .y1(function(d) { return y(d.count); })
      .curve(d3.curveMonotoneX);
    svg.append("path").datum(data).attr("d", area)
      .attr("fill", color).attr("opacity", 0.15);

    // Line
    var line = d3.line()
      .x(function(d) { return x(d.year); })
      .y(function(d) { return y(d.count); })
      .curve(d3.curveMonotoneX);
    svg.append("path").datum(data).attr("d", line)
      .attr("fill", "none").attr("stroke", color).attr("stroke-width", 3);

    // Dots
    svg.selectAll(".dot").data(data).enter().append("circle")
      .attr("cx", function(d) { return x(d.year); })
      .attr("cy", function(d) { return y(d.count); })
      .attr("r", 4).attr("fill", color).attr("stroke", "white").attr("stroke-width", 1.5);

    // Last point label
    var last = data[data.length - 1];
    svg.append("text")
      .attr("x", x(last.year)).attr("y", y(last.count) - 12)
      .attr("text-anchor", "middle").style("font-size", "13px")
      .style("font-weight", "800").style("fill", darkColor)
      .text(formatFn(last.count));

    // Axes
    svg.append("g").attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x).ticks(5).tickFormat(d3.format("d")).tickSize(-3))
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
  }

  drawChart("#chart-cve", cveData, "#E53935", "#B71C1C",
    "Published CVEs per Year", "CVEs",
    function(d) { return d >= 1000 ? (d/1000).toFixed(d >= 10000 ? 0 : 1) + "K" : d; });

  drawChart("#chart-iot", iotData, "#2196F3", "#1565C0",
    "Connected IoT Devices (Billions)", "Devices (B)",
    function(d) { return d.toFixed(1) + "B"; });
});
</script>

???

These numbers ground the problem we're addressing. Last year alone, over 40,000 new vulnerabilities were disclosed to the public. That's a 38 percent increase over the previous year, and the trend is not slowing. These vulnerabilities span 29 billion connected devices worldwide. Meanwhile, the global cybersecurity workforce has 4.8 million unfilled positions. The arithmetic is stark: there are not enough humans to find vulnerabilities faster than they appear, nor enough to validate every reported issue through manual analysis. Automated analysis is not a luxury in this space. It is a necessity. The question is how to make it both fast enough to matter at scale and rigorous enough to convince vendors and end users that a reported vulnerability is real.
