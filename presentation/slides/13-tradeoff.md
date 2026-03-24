---
type: content
title: "Soundness, Completeness, and Scalability"
---

<div style="display:flex; gap:0; align-items:center; justify-content:center; height:88vh; padding:0; margin:0;">
  <!-- LEFT: Radar chart -->
  <div id="radar-container" style="flex:1 1 auto; height:100%; min-width:0;"></div>

  <!-- RIGHT: Legend + insight -->
  <div id="radar-legend" style="flex:0 0 560px; margin-left:-80px; display:flex; flex-direction:column; justify-content:center; gap:2.2rem; opacity:0; transition: opacity 0.4s;">

    <div style="font-size:34px; font-weight:700; color:#333; font-family:Inter,sans-serif; margin-bottom:0.5rem;">Technique Profiles</div>

    <div id="legend-static" style="display:flex; align-items:center; gap:14px; opacity:0; transition: opacity 0.3s;">
      <div style="width:30px; height:30px; border-radius:4px; background:#2196F3; flex-shrink:0;"></div>
      <div>
        <div style="font-size:30px; font-weight:700; color:#1565C0; font-family:Inter,sans-serif;">Static Analysis</div>
        <div style="font-size:26px; color:#666; font-family:Inter,sans-serif;">Mostly Sound, but False Positive Heavy</div>
      </div>
    </div>

    <div id="legend-fuzz" style="display:flex; align-items:center; gap:14px; opacity:0; transition: opacity 0.3s;">
      <div style="width:30px; height:30px; border-radius:4px; background:#FF9800; flex-shrink:0;"></div>
      <div>
        <div style="font-size:30px; font-weight:700; color:#E65100; font-family:Inter,sans-serif;">Dynamic Analysis</div>
        <div style="font-size:26px; color:#666; font-family:Inter,sans-serif;">Verified inputs, but can't find everything</div>
      </div>
    </div>

    <div id="legend-symex" style="display:flex; align-items:center; gap:14px; opacity:0; transition: opacity 0.3s;">
      <div style="width:30px; height:30px; border-radius:4px; background:#7B1FA2; flex-shrink:0;"></div>
      <div>
        <div style="font-size:30px; font-weight:700; color:#7B1FA2; font-family:Inter,sans-serif;">Symbolic Execution</div>
        <div style="font-size:26px; color:#666; font-family:Inter,sans-serif;">Provable reachability, but not scalable</div>
      </div>
    </div>

    <div id="legend-ideal" style="display:flex; align-items:center; gap:14px; opacity:0; transition: opacity 0.3s; margin-top:0.5rem; padding-top:1rem; border-top:1px solid #eee;">
      <div style="width:30px; height:30px; border-radius:50%; border:2.5px dashed #8C1D40; flex-shrink:0;"></div>
      <div>
        <div style="font-size:30px; font-weight:700; color:#8C1D40; font-family:Inter,sans-serif;">Ideal Analysis</div>
        <div style="font-size:26px; color:#666; font-family:Inter,sans-serif;">Where we want to be.</div>
      </div>
    </div>

    <div id="legend-insight" style="opacity:0; transition: opacity 0.3s; margin-top:1rem; padding:16px 18px; background:#fafafa; border-left:3px solid #8C1D40; border-radius:0 6px 6px 0;">
      <div style="font-size:28px; color:#333; font-family:Inter,sans-serif; font-style:italic; line-height:1.5;">No single tool fills all three axes.</div>
    </div>
  </div>
</div>

<script>
window._animQueue.push(function() {
  var container = document.getElementById('radar-container');
  if (!container) return;

  var slideEl = container.closest('.slide');
  var slides = document.querySelectorAll('.slide');
  var slideIdx = Array.from(slides).indexOf(slideEl);
  if (slideIdx < 0) return;

  // --- Radar chart setup ---
  var size = 600;
  var cx = size / 2, cy = size / 2 + 15;
  var maxR = 260;
  var levels = 5;
  var axes = [
    { key: 'completeness', label: 'Completeness', angle: -Math.PI / 2 },
    { key: 'soundness',    label: 'Soundness',    angle: -Math.PI / 2 + (2 * Math.PI / 3) },
    { key: 'scalability',  label: 'Scalability',  angle: -Math.PI / 2 + (4 * Math.PI / 3) }
  ];

  // Order: static, fuzzing, symex (animation order)
  var tools = [
    { id: 'static', label: 'Static Analysis',    color: '#2196F3', fillColor: 'rgba(33,150,243,0.12)',
      completeness: 0.15, soundness: 0.85, scalability: 0.9 },
    { id: 'fuzz',   label: 'Dynamic Analysis',            color: '#FF9800', fillColor: 'rgba(255,152,0,0.12)',
      completeness: 0.55, soundness: 0.5, scalability: 0.5 },
    { id: 'symex',  label: 'Symbolic Execution', color: '#7B1FA2', fillColor: 'rgba(123,31,162,0.12)',
      completeness: 0.9, soundness: 0.25, scalability: 0.15 }
  ];
  var ideal = { completeness: 0.9, soundness: 0.9, scalability: 0.9 };

  var svg = d3.select('#radar-container')
    .append('svg')
    .attr('viewBox', '-60 -20 720 650')
    .attr('preserveAspectRatio', 'xMidYMid meet')
    .style('width', '100%')
    .style('height', '100%');

  // Grid rings
  for (var lvl = 1; lvl <= levels; lvl++) {
    var r = (maxR / levels) * lvl;
    var pts = axes.map(function(a) {
      return (cx + r * Math.cos(a.angle)) + ',' + (cy + r * Math.sin(a.angle));
    }).join(' ');
    svg.append('polygon')
      .attr('points', pts)
      .attr('fill', 'none')
      .attr('stroke', '#e0e0e0')
      .attr('stroke-width', lvl === levels ? 1.5 : 0.8);
  }

  // Axis lines + labels
  axes.forEach(function(a) {
    var ex = cx + maxR * Math.cos(a.angle);
    var ey = cy + maxR * Math.sin(a.angle);
    svg.append('line')
      .attr('x1', cx).attr('y1', cy)
      .attr('x2', ex).attr('y2', ey)
      .attr('stroke', '#ccc')
      .attr('stroke-width', 1.5);

    // Label
    var lx = cx + (maxR + 40) * Math.cos(a.angle);
    var ly = cy + (maxR + 40) * Math.sin(a.angle);
    svg.append('text')
      .attr('x', lx).attr('y', ly + 7)
      .attr('text-anchor', 'middle')
      .attr('font-size', 26)
      .attr('font-weight', 700)
      .attr('fill', '#333')
      .attr('font-family', 'Inter, sans-serif')
      .text(a.label);
  });

  // Helper: get polygon points for a data object
  function getPoints(d) {
    return axes.map(function(a) {
      var val = d[a.key];
      var r = val * maxR;
      return (cx + r * Math.cos(a.angle)) + ',' + (cy + r * Math.sin(a.angle));
    }).join(' ');
  }

  // Create tool polygons (hidden initially)
  var toolPolygons = [];
  tools.forEach(function(t) {
    var g = svg.append('g').attr('id', 'radar-' + t.id).attr('opacity', 0);
    g.append('polygon')
      .attr('points', getPoints({ completeness:0, soundness:0, scalability:0 }))
      .attr('fill', t.fillColor)
      .attr('stroke', t.color)
      .attr('stroke-width', 2.5);

    // Vertex dots
    axes.forEach(function(a) {
      g.append('circle')
        .attr('class', 'vertex-dot')
        .attr('cx', cx).attr('cy', cy)
        .attr('r', 6)
        .attr('fill', t.color);
    });

    toolPolygons.push(g);
  });

  // Ideal polygon (hidden)
  var idealGroup = svg.append('g').attr('id', 'radar-ideal').attr('opacity', 0);
  idealGroup.append('polygon')
    .attr('points', getPoints({ completeness:0, soundness:0, scalability:0 }))
    .attr('fill', 'none')
    .attr('stroke', '#8C1D40')
    .attr('stroke-width', 2.5)
    .attr('stroke-dasharray', '8,4');

  // Animation functions
  function animatePolygonIn(group, data, color, duration) {
    duration = duration || 600;
    group.attr('opacity', 1);
    group.select('polygon')
      .transition()
      .duration(duration)
      .ease(d3.easeCubicOut)
      .attr('points', getPoints(data));

    // Animate vertex dots
    var dots = group.selectAll('.vertex-dot');
    dots.each(function(d, i) {
      var a = axes[i];
      var val = data[a.key];
      d3.select(this)
        .transition()
        .duration(duration)
        .ease(d3.easeCubicOut)
        .attr('cx', cx + val * maxR * Math.cos(a.angle))
        .attr('cy', cy + val * maxR * Math.sin(a.angle));
    });
  }

  // Register step animations
  window.registerSlideAnimation(slideIdx, {
    mode: 'step',
    steps: [
      // Step 1: Show legend + Static Analysis
      {
        show: function(instant) {
          document.getElementById('radar-legend').style.opacity = '1';
          document.getElementById('legend-static').style.opacity = '1';
          var dur = instant ? 0 : 600;
          animatePolygonIn(toolPolygons[0], tools[0], tools[0].color, dur);
        },
        hide: function() {
          toolPolygons[0].attr('opacity', 0)
            .select('polygon').attr('points', getPoints({completeness:0,soundness:0,scalability:0}));
          toolPolygons[0].selectAll('.vertex-dot').attr('cx', cx).attr('cy', cy);
          document.getElementById('legend-static').style.opacity = '0';
        }
      },
      // Step 2: Fuzzing
      {
        show: function(instant) {
          document.getElementById('legend-fuzz').style.opacity = '1';
          var dur = instant ? 0 : 600;
          animatePolygonIn(toolPolygons[1], tools[1], tools[1].color, dur);
        },
        hide: function() {
          toolPolygons[1].attr('opacity', 0)
            .select('polygon').attr('points', getPoints({completeness:0,soundness:0,scalability:0}));
          toolPolygons[1].selectAll('.vertex-dot').attr('cx', cx).attr('cy', cy);
          document.getElementById('legend-fuzz').style.opacity = '0';
        }
      },
      // Step 3: Symbolic Execution
      {
        show: function(instant) {
          document.getElementById('legend-symex').style.opacity = '1';
          var dur = instant ? 0 : 600;
          animatePolygonIn(toolPolygons[2], tools[2], tools[2].color, dur);
        },
        hide: function() {
          toolPolygons[2].attr('opacity', 0)
            .select('polygon').attr('points', getPoints({completeness:0,soundness:0,scalability:0}));
          toolPolygons[2].selectAll('.vertex-dot').attr('cx', cx).attr('cy', cy);
          document.getElementById('legend-symex').style.opacity = '0';
        }
      },
      // Step 4: Ideal + insight
      {
        show: function(instant) {
          document.getElementById('legend-ideal').style.opacity = '1';
          document.getElementById('legend-insight').style.opacity = '1';
          var dur = instant ? 0 : 600;
          idealGroup.attr('opacity', 1);
          idealGroup.select('polygon')
            .transition()
            .duration(dur)
            .ease(d3.easeCubicOut)
            .attr('points', getPoints(ideal));
        },
        hide: function() {
          idealGroup.attr('opacity', 0)
            .select('polygon').attr('points', getPoints({completeness:0,soundness:0,scalability:0}));
          document.getElementById('legend-ideal').style.opacity = '0';
          document.getElementById('legend-insight').style.opacity = '0';
        }
      }
    ]
  });
});
</script>

???

Three properties matter for vulnerability discovery at scale: soundness, completeness, and scalability.
[CLICK] Starting with static analysis, it fans wide across soundness and scalability.
Static analyzers sweep entire codebases cheaply and flag every suspicious data flow, but without running the program they cannot prove the veracity of their reports.

[CLICK] Dynamic Analysis produces a balanced triangle.
It finds real crashes with decent accuracy, explores some paths, and runs at scale.
However, fuzzers scale by adding cores, but increased compute does not produce proportionally more findings after long periods, just look at OSS-Fuzz whose coverage has stagnated despite the amount of resources thrown at it.
Coverage is opportunistic, driven by mutation luck rather than systematic exploration. P.S. What about Directed fuzzers?????

[CLICK] Symbolic execution is incredibly accurate, the result is a proof of reachability.
But completeness and scalability collapse, path explosion makes running it on an entire program intractable.

[CLICK] The dashed triangle is where we want to be: high on all three axes simultaneously. No single tool fills that shape. But by composing tools, It's possible to approach a reasonable solution.
