---
type: content
title: "Rich Expressions: Value-Aware Tracking"
---

<style>
  .comparison-container {
    display: flex;
    gap: 24px;
    margin: 30px auto;
    font-family: 'Courier New', monospace;
  }

  .panel {
    flex: 1;
    border: 2px solid #8C1D40;
    border-radius: 6px;
    padding: 20px;
    background-color: #f9f9f9;
  }

  .panel-header {
    color: #8C1D40;
    font-weight: bold;
    font-size: 16px;
    margin-bottom: 16px;
    text-align: center;
    border-bottom: 2px solid #8C1D40;
    padding-bottom: 12px;
  }

  .step {
    margin-bottom: 20px;
    padding: 12px;
    background-color: white;
    border-left: 3px solid #8C1D40;
  }

  .step-label {
    color: #666;
    font-size: 12px;
    text-transform: uppercase;
    margin-bottom: 6px;
  }

  .code {
    font-family: 'Courier New', monospace;
    font-size: 13px;
    margin-bottom: 8px;
    color: #333;
  }

  .tracking-label {
    font-size: 11px;
    margin-top: 6px;
    padding: 8px;
    border-radius: 3px;
    text-align: center;
  }

  .tracking-binary {
    background-color: #ffebee;
    color: #c62828;
    font-weight: bold;
  }

  .tracking-rich {
    background-color: #f1f8e9;
    color: #558b2f;
    font-family: 'Courier New', monospace;
    font-size: 11px;
  }

  .expr-source {
    color: #4CAF50;
    font-weight: bold;
  }

  .expr-op {
    color: #2196F3;
    font-weight: bold;
  }

  .expr-sink {
    color: #E53935;
    font-weight: bold;
  }

  .alert-box {
    margin-top: 16px;
    padding: 12px;
    border-radius: 4px;
    border: 1px solid;
    font-size: 12px;
  }

  .alert-binary {
    background-color: #ffcdd2;
    border-color: #E53935;
    color: #b71c1c;
  }

  .alert-rich {
    background-color: #c8e6c9;
    border-color: #4CAF50;
    color: #1b5e20;
  }
</style>

<div class="comparison-container">
  <!-- Left Panel: Traditional Taint -->
  <div class="panel">
    <div class="panel-header">Traditional Taint</div>

    <div class="step">
      <div class="step-label">Step 1: Source</div>
      <div class="code">name = fgets(stdin)</div>
      <div class="tracking-label tracking-binary">tainted = true</div>
    </div>

    <div class="step">
      <div class="step-label">Step 2: Transformation</div>
      <div class="code">cmd = snprintf("hostname %s", name)</div>
      <div class="tracking-label tracking-binary">tainted = true</div>
    </div>

    <div class="step">
      <div class="step-label">Step 3: Sink</div>
      <div class="code">system(cmd)</div>
      <div class="tracking-label tracking-binary">tainted = true</div>
    </div>

    <div class="alert-box alert-binary">
      <strong>Alert:</strong> tainted argument to system()
    </div>
  </div>

  <!-- Right Panel: Rich Expressions -->
  <div class="panel">
    <div class="panel-header">Rich Expression</div>

    <div class="step">
      <div class="step-label">Step 1: Source</div>
      <div class="code">name = fgets(stdin)</div>
      <div class="tracking-label tracking-rich">
        <span class="expr-source">STDIN</span>
      </div>
    </div>

    <div class="step">
      <div class="step-label">Step 2: Transformation</div>
      <div class="code">cmd = snprintf("hostname %s", name)</div>
      <div class="tracking-label tracking-rich">
        <span class="expr-source">STDIN</span> <span class="expr-op">→ snprintf</span>
      </div>
    </div>

    <div class="step">
      <div class="step-label">Step 3: Sink</div>
      <div class="code">system(cmd)</div>
      <div class="tracking-label tracking-rich">
        <span class="expr-source">STDIN</span> <span class="expr-op">→ snprintf</span> <span class="expr-sink">→ system()</span>
      </div>
    </div>

    <div class="alert-box alert-rich">
      <strong>Alert:</strong> <span class="expr-source">unsanitized stdin</span> reaches <span class="expr-sink">system()</span> via <span class="expr-op">snprintf</span>
    </div>
  </div>
</div>

???

Rich Expressions are the precision solution. Compare the two sides. Traditional taint analysis marks a value tainted at the source and keeps marking it tainted through every operation. By the time it reaches the sink, all you know is tainted equals true. Rich Expressions track causality. STDIN becomes the source. As the value passes through snprintf, you record that transformation. As it reaches system, you record that too. Now the alert reads: unsanitized stdin reaches system via snprintf. A human analyst would trace this exact path mentally when assessing whether the vulnerability is real. Rich Expressions encode that mental model. The full transformation history lets us reason about whether intermediate functions might have sanitized the input, whether the value went through a narrowing operation, what context it gained or lost. This is why Rich Expressions reduce false positives without sacrificing coverage.
