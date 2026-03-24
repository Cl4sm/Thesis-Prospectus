---
type: content
title: "The Scaling Gap"
footnote: "[1] NVD/CVE.org&emsp;[2] FIRST Vulnerability Forecast, 2026&emsp;[3] ISC2 Workforce Study, 2024&emsp;[4] IoT Analytics / Statista, 2025"
---

<div id="gap-chart" style="width:100%; display:flex; align-items:center; justify-content:center;"></div>

<script>
window.addEventListener("load", function() {
  var container = document.getElementById('gap-chart');
  if (!container) return;

  var margin = {top: 42, right: 80, bottom: 58, left: 65};
  var width = 920 - margin.left - margin.right;
  var height = 385 - margin.top - margin.bottom;

  var svg = d3.select('#gap-chart').append('svg')
    .attr('viewBox', '0 0 920 385')
    .attr('preserveAspectRatio', 'xMidYMid meet')
    .style('width', '100%')
    .append('g')
    .attr('transform', 'translate(' + margin.left + ',' + margin.top + ')');

  // ===== RAW DATA (base year: 2018) =====
  // CVEs per year (NVD / CVE.org); 2026 = FIRST median forecast
  var cveRaw = {
    2018: 16510, 2019: 17305, 2020: 18323,
    2021: 20153, 2022: 25084, 2023: 29066, 2024: 40308, 2025: 48185
  };
  var cveProj = {2026: 59427}; // FIRST median; 90% CI: 30,012-117,673
  // Total connected devices in billions (IoT Analytics + Statista, IoT + non-IoT)
  var devRaw = {
    2018: 17.9, 2019: 20.0, 2020: 21.6,
    2021: 23.8, 2022: 26.5, 2023: 30.0, 2024: 34.6, 2025: 41.2
  };
  var devProj = {2026: 46.5}; // extrapolated ~13% CAGR
  // Cybersecurity workforce in millions (ISC2 Workforce Studies)
  // 2018: 2.93M (ISC2 2018), 2019: 2.93M (smoothed; ISC2 methodology shift),
  // 2020: 3.12M, 2021: 4.19M, 2022: 4.66M (ISC2 2022),
  // 2023: 5.45M (ISC2 2023), 2024: 5.47M (ISC2 2024, +0.1%), 2025: ~5.5M
  var wfRaw = {
    2018: 2.93, 2019: 2.93, 2020: 3.12,
    2021: 4.19, 2022: 4.66, 2023: 5.45, 2024: 5.47, 2025: 5.50
  };
  var wfProj = {2026: 5.55}; // ~0.9% growth if trend recovers slightly

  var years = [2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025];
  var projYears = [2025, 2026]; // bridge from last historical
  var baseYear = 2018;

  // Normalize all to base year = 1.0
  function normalize(raw) {
    var base = raw[baseYear];
    return years.map(function(y) { return {year: y, value: raw[y] / base}; });
  }
  function normalizeProj(raw, proj) {
    var base = raw[baseYear];
    return projYears.map(function(y) {
      var v = raw[y] !== undefined ? raw[y] : proj[y];
      return {year: y, value: v / base};
    });
  }
  var cveData = normalize(cveRaw);
  var devData = normalize(devRaw);
  var wfData = normalize(wfRaw);
  var cveProjData = normalizeProj(cveRaw, cveProj);
  var devProjData = normalizeProj(devRaw, devProj);
  var wfProjData = normalizeProj(wfRaw, wfProj);

  // ===== SCALES =====
  var x = d3.scaleLinear().domain([2018, 2026]).range([0, width]);
  var yMax = cveProjData[cveProjData.length - 1].value * 1.15;
  var y = d3.scaleLinear().domain([0, yMax]).range([height, 0]);

  // ===== GRID =====
  svg.selectAll('.grid-line').data(y.ticks(5)).enter().append('line')
    .attr('x1', 0).attr('x2', width)
    .attr('y1', function(d) { return y(d); }).attr('y2', function(d) { return y(d); })
    .attr('stroke', '#f0f0f0').attr('stroke-width', 1);

  // 1.0x baseline
  svg.append('line')
    .attr('x1', 0).attr('x2', width)
    .attr('y1', y(1)).attr('y2', y(1))
    .attr('stroke', '#ccc').attr('stroke-width', 1).attr('stroke-dasharray', '4,4');

  // ===== GAP FILL between CVEs and Workforce =====
  var gapArea = d3.area()
    .x(function(d, i) { return x(years[i]); })
    .y0(function(d, i) { return y(wfData[i].value); })
    .y1(function(d, i) { return y(cveData[i].value); })
    .curve(d3.curveMonotoneX);
  svg.append('path').datum(years)
    .attr('d', gapArea)
    .attr('fill', '#E53935').attr('opacity', 0.06);

  // ===== LINES =====
  var line = d3.line()
    .x(function(d) { return x(d.year); })
    .y(function(d) { return y(d.value); })
    .curve(d3.curveMonotoneX);

  // CVE line (red, solid)
  svg.append('path').datum(cveData).attr('d', line)
    .attr('fill', 'none').attr('stroke', '#E53935').attr('stroke-width', 3.5);
  svg.selectAll('.cve-dot').data(cveData).enter().append('circle')
    .attr('cx', function(d) { return x(d.year); })
    .attr('cy', function(d) { return y(d.value); })
    .attr('r', 4).attr('fill', '#E53935').attr('stroke', 'white').attr('stroke-width', 1.5);

  // Connected devices line (blue, solid)
  svg.append('path').datum(devData).attr('d', line)
    .attr('fill', 'none').attr('stroke', '#1565C0').attr('stroke-width', 3);
  svg.selectAll('.dev-dot').data(devData).enter().append('circle')
    .attr('cx', function(d) { return x(d.year); })
    .attr('cy', function(d) { return y(d.value); })
    .attr('r', 3.5).attr('fill', '#1565C0').attr('stroke', 'white').attr('stroke-width', 1.5);

  // Workforce line (green, dashed)
  svg.append('path').datum(wfData).attr('d', line)
    .attr('fill', 'none').attr('stroke', '#2E7D32').attr('stroke-width', 3)
    .attr('stroke-dasharray', '8,4');
  svg.selectAll('.wf-dot').data(wfData).enter().append('circle')
    .attr('cx', function(d) { return x(d.year); })
    .attr('cy', function(d) { return y(d.value); })
    .attr('r', 3.5).attr('fill', '#2E7D32').attr('stroke', 'white').attr('stroke-width', 1.5);

  // ===== PROJECTED SEGMENTS (dashed, 2025→2026) =====
  var projLine = d3.line()
    .x(function(d) { return x(d.year); })
    .y(function(d) { return y(d.value); })
    .curve(d3.curveMonotoneX);

  // CVE projection
  svg.append('path').datum(cveProjData).attr('d', projLine)
    .attr('fill', 'none').attr('stroke', '#E53935').attr('stroke-width', 3.5)
    .attr('stroke-dasharray', '6,4');
  // Device projection
  svg.append('path').datum(devProjData).attr('d', projLine)
    .attr('fill', 'none').attr('stroke', '#1565C0').attr('stroke-width', 3)
    .attr('stroke-dasharray', '6,4');
  // Workforce projection
  svg.append('path').datum(wfProjData).attr('d', projLine)
    .attr('fill', 'none').attr('stroke', '#2E7D32').attr('stroke-width', 3)
    .attr('stroke-dasharray', '6,4');

  // Projected dots (hollow)
  [[cveProjData, '#E53935'], [devProjData, '#1565C0'], [wfProjData, '#2E7D32']].forEach(function(pair) {
    var last = pair[0][pair[0].length - 1];
    svg.append('circle')
      .attr('cx', x(last.year)).attr('cy', y(last.value))
      .attr('r', 4).attr('fill', 'white').attr('stroke', pair[1]).attr('stroke-width', 2);
  });

  // Projected gap fill (2025→2026)
  svg.append('path').datum(projYears.map(function(yr) { return {year: yr}; }))
    .attr('d', d3.area()
      .x(function(d) { return x(d.year); })
      .y0(function(d) {
        var i = projYears.indexOf(d.year);
        return y(wfProjData[i].value);
      })
      .y1(function(d) {
        var i = projYears.indexOf(d.year);
        return y(cveProjData[i].value);
      })
    )
    .attr('fill', '#E53935').attr('opacity', 0.04);

  // ===== END-OF-LINE LABELS (at 2026) =====
  var lastCve = cveProjData[cveProjData.length - 1];
  var lastDev = devProjData[devProjData.length - 1];
  var lastWf = wfProjData[wfProjData.length - 1];

  svg.append('text')
    .attr('x', x(2026) + 8).attr('y', y(lastCve.value) + 4)
    .attr('font-size', 14).attr('font-weight', 700).attr('fill', '#E53935')
    .attr('font-family', 'Inter, sans-serif')
    .text(lastCve.value.toFixed(1) + '\u00d7');
  svg.append('text')
    .attr('x', x(2026) + 8).attr('y', y(lastCve.value) + 18)
    .attr('font-size', 10).attr('fill', '#E53935')
    .attr('font-family', 'Inter, sans-serif')
    .text('CVEs/yr');

  svg.append('text')
    .attr('x', x(2026) + 8).attr('y', y(lastDev.value) + 4)
    .attr('font-size', 14).attr('font-weight', 700).attr('fill', '#1565C0')
    .attr('font-family', 'Inter, sans-serif')
    .text(lastDev.value.toFixed(1) + '\u00d7');
  svg.append('text')
    .attr('x', x(2026) + 8).attr('y', y(lastDev.value) + 18)
    .attr('font-size', 10).attr('fill', '#1565C0')
    .attr('font-family', 'Inter, sans-serif')
    .text('Devices');

  svg.append('text')
    .attr('x', x(2026) + 8).attr('y', y(lastWf.value) + 4)
    .attr('font-size', 14).attr('font-weight', 700).attr('fill', '#2E7D32')
    .attr('font-family', 'Inter, sans-serif')
    .text(lastWf.value.toFixed(1) + '\u00d7');
  svg.append('text')
    .attr('x', x(2026) + 8).attr('y', y(lastWf.value) + 18)
    .attr('font-size', 10).attr('fill', '#2E7D32')
    .attr('font-family', 'Inter, sans-serif')
    .text('Workforce');

  // ===== GAP BRACKET at 2024 =====
  // var bx = x(2024);
  // var bTop = y(cveData[6].value);
  // var bBot = y(wfData[6].value);
  // svg.append('line')
  //   .attr('x1', bx - 8).attr('x2', bx - 8)
  //   .attr('y1', bTop + 4).attr('y2', bBot - 4)
  //   .attr('stroke', '#8C1D40').attr('stroke-width', 2);
  // svg.append('line')
  //   .attr('x1', bx - 14).attr('x2', bx - 2)
  //   .attr('y1', bTop + 4).attr('y2', bTop + 4)
  //   .attr('stroke', '#8C1D40').attr('stroke-width', 2);
  // svg.append('line')
  //   .attr('x1', bx - 14).attr('x2', bx - 2)
  //   .attr('y1', bBot - 4).attr('y2', bBot - 4)
  //   .attr('stroke', '#8C1D40').attr('stroke-width', 2);

  // ===== EVENT MARKERS (on timeline, not pinned to a line) =====
  // var events = [
  //   {year: 2018, label: 'Mirai (2016)', sublabel: '600K devices', color: '#E65100'},
  //   {year: 2020, label: 'SolarWinds', sublabel: '18K orgs', color: '#7B1FA2'},
  //   {year: 2021.3, label: 'Log4Shell', sublabel: '93% of cloud', color: '#C62828'}
  // ];
  // events.forEach(function(ev) {
  //   var ex = x(ev.year);
  //   // Place markers above the chart as flags
  //   svg.append('line')
  //     .attr('x1', ex).attr('x2', ex)
  //     .attr('y1', -8).attr('y2', -28)
  //     .attr('stroke', ev.color).attr('stroke-width', 2);
  //   svg.append('circle')
  //     .attr('cx', ex).attr('cy', -28)
  //     .attr('r', 3).attr('fill', ev.color);
  //   svg.append('text')
  //     .attr('x', ex).attr('y', -34)
  //     .attr('text-anchor', 'middle').attr('font-size', 11).attr('font-weight', 700)
  //     .attr('fill', ev.color).attr('font-family', 'Inter, sans-serif')
  //     .text(ev.label);
  // });

  // ===== AXES =====
  svg.append('g').attr('transform', 'translate(0,' + height + ')')
    .call(d3.axisBottom(x).ticks(8).tickFormat(d3.format('d')).tickSize(-3))
    .selectAll('text').style('font-size', '12px').style('fill', '#555');
  svg.append('g')
    .call(d3.axisLeft(y).ticks(5).tickFormat(function(d) { return d.toFixed(1) + '\u00d7'; }).tickSize(-3))
    .selectAll('text').style('font-size', '11px').style('fill', '#555');
  svg.selectAll('.domain').attr('stroke', '#ccc');

  // Y-axis label
  svg.append('text').attr('transform', 'rotate(-90)')
    .attr('y', -48).attr('x', -height / 2)
    .attr('text-anchor', 'middle').style('font-size', '12px').style('fill', '#888')
    .attr('font-family', 'Inter, sans-serif')
    .text('Growth (2018 = 1.0\u00d7)');

  // ===== BOTTOM STATS =====
  var boxY = height + 22;
  var stats = [
    {x: 0, label: '~59K CVEs forecast', sub: '2026 (FIRST median)', color: '#E53935'},
    {x: width * 0.33, label: '48,000+ CVEs', sub: 'published in 2025 alone', color: '#B71C1C'},
    {x: width * 0.66, label: '4.8M unfilled', sub: 'security positions (ISC2, 2024)', color: '#2E7D32'}
  ];
  stats.forEach(function(s) {
    svg.append('text').attr('x', s.x).attr('y', boxY + 8)
      .attr('font-size', 14).attr('font-weight', 800).attr('fill', s.color)
      .attr('font-family', 'Inter, sans-serif').text(s.label);
    svg.append('text').attr('x', s.x).attr('y', boxY + 24)
      .attr('font-size', 11).attr('fill', '#888')
      .attr('font-family', 'Inter, sans-serif').text(s.sub);
  });
});
</script>

???

This chart compares three growth rates, all normalized to 2018 as the baseline year. Everything starts at 1.0×, so the comparison is rate of change, same units, same scale. The dashed segment at the end is 2026 projected data.

The red line is CVE publications per year. Since 2018, that number has grown 2.9× to over 48,000 in 2025. FIRST's median forecast for 2026 is roughly 59,000, which would push the multiplier to 3.6×. Their 90% confidence interval runs from 30,000 to 117,000, so even the conservative bound exceeds 2024. The blue line is total connected devices worldwide (IoT sensors, smartphones, laptops, servers, network infrastructure), which has grown 2.3× to 41 billion. The green dashed line is the cybersecurity workforce, per ISC2's annual workforce studies. It has grown 1.9× from 2.93 million to 5.5 million, but that growth flatlined in 2024 (0.1% year-over-year), and there are still 4.8 million unfilled positions.

The shaded region between CVEs and workforce is the gap: vulnerability production outpacing the analysts available to address them. The gap widens sharply from 2023 onward as CVEs accelerate while workforce growth stalls. By 2026, the CVE multiplier will be nearly double the workforce multiplier.

Three events illustrate the breadth of the problem. Mirai in 2016 conscripted 600,000 IoT devices running the same class of firmware vulnerability. SolarWinds in 2020 backdoored 18,000 organizations through a supply chain compromise in enterprise network management software. Log4Shell in 2021 exposed 93% of cloud environments through a single Java library dependency. These span IoT firmware, enterprise infrastructure, and open-source libraries: the vulnerability problem cuts across every class of software.

The bottom line: demand-side growth (vulnerabilities and devices) consistently outpaces supply-side growth (analysts). Manual analysis cannot close this gap. The dissertation argues that automated, scalable systems are the only viable path, and those systems must produce results that are both complete and accurate.
