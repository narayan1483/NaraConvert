<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NaraConvert – Upload & Convert</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&family=Space+Mono:wght@400;700&display=swap" rel="stylesheet">
<style>
/* ═══════════════════════════════════════════
   RESET & BASE
═══════════════════════════════════════════ */
*, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }

:root {
  --bg: #060d1a;
  --bg2: #0b1426;
  --card: rgba(255,255,255,0.04);
  --card2: rgba(255,255,255,0.07);
  --border: rgba(255,255,255,0.08);
  --accent: #63b3ed;
  --accent2: #76e4f7;
  --accent3: #b794f4;
  --green: #68d391;
  --yellow: #f6e05e;
  --orange: #f6ad55;
  --red: #fc8181;
  --text1: #f0f6fc;
  --text2: #8b949e;
  --text3: #484f58;
}

html, body { height: 100%; }

body {
  font-family: 'Outfit', sans-serif;
  background: var(--bg);
  color: var(--text1);
  min-height: 100vh;
  overflow-x: hidden;
}

/* Background mesh */
body::before {
  content: '';
  position: fixed; inset: 0; z-index: 0;
  background:
    radial-gradient(ellipse 70% 50% at 15% 20%, rgba(99,179,237,0.05) 0%, transparent 60%),
    radial-gradient(ellipse 60% 50% at 85% 80%, rgba(183,148,244,0.05) 0%, transparent 60%);
  pointer-events: none;
}

/* Grid lines */
body::after {
  content: '';
  position: fixed; inset: 0; z-index: 0;
  background-image:
    linear-gradient(rgba(255,255,255,0.012) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255,255,255,0.012) 1px, transparent 1px);
  background-size: 50px 50px;
  pointer-events: none;
}

/* ═══════════════════════════════════════════
   NAVBAR
═══════════════════════════════════════════ */
.navbar {
  position: sticky; top: 0; z-index: 100;
  display: flex; align-items: center; justify-content: space-between;
  padding: 0 48px; height: 64px;
  background: rgba(6,13,26,0.85);
  backdrop-filter: blur(20px);
  border-bottom: 1px solid var(--border);
}

.nav-logo {
  font-family: 'Space Mono', monospace;
  font-size: 20px; font-weight: 700;
  background: linear-gradient(135deg, var(--accent), var(--accent2));
  -webkit-background-clip: text; -webkit-text-fill-color: transparent;
  text-decoration: none;
}

.nav-links { display: flex; gap: 28px; list-style: none; }
.nav-links a {
  color: var(--text2); font-size: 14px; font-weight: 500;
  text-decoration: none; transition: color 0.2s;
}
.nav-links a:hover, .nav-links a.active { color: var(--text1); }
.nav-links a.active { color: var(--accent); }

.nav-btn {
  background: rgba(99,179,237,0.1);
  border: 1px solid rgba(99,179,237,0.25);
  color: var(--accent); padding: 8px 20px;
  border-radius: 8px; font-size: 13px; font-weight: 600;
  cursor: pointer; text-decoration: none; transition: all 0.2s;
  font-family: 'Outfit', sans-serif;
}
.nav-btn:hover { background: rgba(99,179,237,0.18); }

/* ═══════════════════════════════════════════
   MAIN LAYOUT
═══════════════════════════════════════════ */
.main {
  position: relative; z-index: 1;
  min-height: calc(100vh - 64px);
  display: flex; align-items: stretch;
  padding: 32px 48px;
  gap: 24px;
  max-width: 1400px;
  margin: 0 auto;
}

/* ═══════════════════════════════════════════
   LEFT PANEL — Upload
═══════════════════════════════════════════ */
.left-panel {
  flex: 0 0 440px;
  display: flex; flex-direction: column; gap: 16px;
}

.upload-card {
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: 20px;
  padding: 32px 28px;
  display: flex; flex-direction: column; gap: 20px;
}

.upload-title {
  text-align: center;
}
.upload-title h1 {
  font-size: 26px; font-weight: 800; letter-spacing: -0.8px;
}
.upload-title p { font-size: 14px; color: var(--text2); margin-top: 4px; }

/* Drop Zone */
.drop-zone {
  border: 2px dashed rgba(99,179,237,0.25);
  border-radius: 16px;
  padding: 36px 20px;
  text-align: center;
  cursor: pointer;
  transition: all 0.3s;
  background: rgba(99,179,237,0.02);
  position: relative;
}
.drop-zone:hover, .drop-zone.dragover {
  border-color: var(--accent);
  background: rgba(99,179,237,0.05);
}
.drop-zone.has-file {
  border-color: rgba(104,211,145,0.4);
  background: rgba(104,211,145,0.03);
}

.drop-icon-wrap {
  width: 72px; height: 72px; margin: 0 auto 14px;
  position: relative; display: flex; align-items: center; justify-content: center;
}
.drop-ring {
  position: absolute; inset: 0; border-radius: 50%;
  border: 1.5px solid rgba(99,179,237,0.2);
  animation: ringPulse 3s ease-in-out infinite;
}
.drop-ring:nth-child(2) { inset: -10px; border-color: rgba(99,179,237,0.1); animation-delay: 0.5s; }
.drop-ring:nth-child(3) { inset: -20px; border-color: rgba(99,179,237,0.05); animation-delay: 1s; }

@keyframes ringPulse {
  0%,100% { opacity:0.6; transform:scale(1); }
  50% { opacity:0.2; transform:scale(1.05); }
}

.drop-emoji {
  font-size: 34px; position: relative; z-index: 1;
  transition: transform 0.3s;
}
.drop-zone:hover .drop-emoji { transform: scale(1.15) rotate(-8deg); }

.drop-title { font-size: 16px; font-weight: 700; color: var(--text1); }
.drop-sub { font-size: 12px; color: var(--text2); margin-top: 4px; margin-bottom: 14px; }

.browse-btn {
  display: inline-flex; align-items: center; gap: 6px;
  background: rgba(255,255,255,0.05);
  border: 1px solid rgba(255,255,255,0.1);
  color: var(--text2); font-size: 13px; font-weight: 600;
  padding: 8px 18px; border-radius: 8px; cursor: pointer;
  font-family: 'Outfit', sans-serif;
  transition: all 0.2s;
}
.browse-btn:hover { border-color: var(--accent); color: var(--accent); }

input[type="file"] { display: none !important; }

/* File info */
.file-info-box {
  display: none;
  align-items: center; gap: 12px;
  background: rgba(104,211,145,0.06);
  border: 1px solid rgba(104,211,145,0.2);
  border-radius: 12px; padding: 12px 16px;
}
.file-info-box.show { display: flex; }

.fi-icon {
  font-size: 26px; width: 42px; height: 42px;
  display: flex; align-items: center; justify-content: center;
  background: rgba(255,255,255,0.04); border-radius: 8px; flex-shrink: 0;
}
.fi-details { flex: 1; min-width: 0; }
.fi-name {
  font-size: 13px; font-weight: 700;
  white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
}
.fi-meta { font-size: 11px; color: var(--text2); margin-top: 2px; }
.fi-ext {
  font-family: 'Space Mono', monospace; font-weight: 700;
  color: var(--accent); font-size: 11px;
}
.fi-check { color: var(--green); font-size: 20px; }

/* Hint */
.hint-box {
  font-size: 12px; color: var(--text2);
  background: rgba(99,179,237,0.04);
  border: 1px solid rgba(99,179,237,0.12);
  border-radius: 10px; padding: 10px 14px;
  line-height: 1.6; display: none;
}
.hint-box.show { display: block; }
.hint-fmt {
  display: inline-block;
  background: rgba(99,179,237,0.1); color: var(--accent);
  font-family: 'Space Mono', monospace; font-weight: 700; font-size: 10px;
  padding: 1px 5px; border-radius: 4px; margin: 1px;
}

/* Progress */
.prog-wrap { display: none; }
.prog-wrap.show { display: block; }
.prog-top { display: flex; justify-content: space-between; font-size: 12px; color: var(--text2); margin-bottom: 6px; }
.prog-track { height: 5px; background: rgba(255,255,255,0.06); border-radius: 10px; overflow: hidden; }
.prog-bar {
  height: 100%; width: 0%;
  background: linear-gradient(90deg, var(--accent), var(--accent2));
  border-radius: 10px; transition: width 0.3s;
  box-shadow: 0 0 8px rgba(99,179,237,0.5);
}
.prog-steps { display: flex; justify-content: center; gap: 10px; margin-top: 10px; }
.pstep {
  font-size: 11px; color: var(--text3);
  padding: 4px 12px; border-radius: 20px;
  border: 1px solid var(--border); transition: all 0.3s;
}
.pstep.on { color: var(--accent); border-color: rgba(99,179,237,0.3); background: rgba(99,179,237,0.06); }

/* Submit */
.submit-btn {
  width: 100%; padding: 15px;
  background: linear-gradient(135deg, var(--accent), var(--accent2));
  color: #060d1a; border: none; border-radius: 12px;
  font-size: 16px; font-weight: 800; cursor: pointer;
  font-family: 'Outfit', sans-serif; letter-spacing: 0.2px;
  display: flex; align-items: center; justify-content: center; gap: 10px;
  transition: all 0.3s;
  box-shadow: 0 0 32px rgba(99,179,237,0.2);
}
.submit-btn:hover { transform: translateY(-2px); box-shadow: 0 0 48px rgba(99,179,237,0.4); }
.submit-btn:disabled { opacity: 0.6; cursor: not-allowed; transform: none; }

.spinner {
  width: 18px; height: 18px;
  border: 2px solid rgba(6,13,26,0.3);
  border-top-color: #060d1a;
  border-radius: 50%; animation: spin 0.7s linear infinite;
  display: none;
}
@keyframes spin { to { transform: rotate(360deg); } }

/* ═══════════════════════════════════════════
   RIGHT PANEL — Format Selector
═══════════════════════════════════════════ */
.right-panel {
  flex: 1;
  display: flex; flex-direction: column; gap: 0;
}

.format-panel {
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: 20px;
  display: flex; flex-direction: column;
  height: 100%; max-height: calc(100vh - 120px);
  overflow: hidden;
}

/* Panel header */
.fp-header {
  padding: 20px 24px 16px;
  border-bottom: 1px solid var(--border);
  display: flex; flex-direction: column; gap: 12px;
  flex-shrink: 0;
}

.fp-title-row {
  display: flex; align-items: center; justify-content: space-between;
}
.fp-title {
  font-size: 15px; font-weight: 700; color: var(--text1);
}
.fp-count {
  font-size: 11px; font-family: 'Space Mono', monospace;
  background: rgba(99,179,237,0.1); border: 1px solid rgba(99,179,237,0.2);
  color: var(--accent); padding: 3px 10px; border-radius: 20px;
}

/* Search */
.fp-search {
  display: flex; align-items: center; gap: 8px;
  background: rgba(255,255,255,0.03);
  border: 1px solid var(--border);
  border-radius: 10px; padding: 8px 14px;
  transition: border-color 0.2s;
}
.fp-search:focus-within { border-color: rgba(99,179,237,0.3); }
.fp-search input {
  flex: 1; background: none; border: none; outline: none;
  color: var(--text1); font-size: 13px; font-family: 'Outfit', sans-serif;
}
.fp-search input::placeholder { color: var(--text3); }

/* Scrollable groups area */
.fp-groups {
  flex: 1; overflow-y: auto; padding: 16px;
  display: flex; flex-direction: column; gap: 12px;
  scrollbar-width: thin; scrollbar-color: rgba(99,179,237,0.2) transparent;
}
.fp-groups::-webkit-scrollbar { width: 4px; }
.fp-groups::-webkit-scrollbar-track { background: transparent; }
.fp-groups::-webkit-scrollbar-thumb { background: rgba(99,179,237,0.2); border-radius: 2px; }

/* Each group */
.fmt-group {
  border: 1px solid var(--border);
  border-radius: 14px; overflow: hidden;
  transition: border-color 0.2s;
}
.fmt-group:hover { border-color: rgba(255,255,255,0.12); }

.fmt-group-head {
  display: flex; align-items: center; gap: 8px;
  padding: 10px 14px;
  background: rgba(255,255,255,0.025);
  border-bottom: 1px solid var(--border);
  font-size: 12px; font-weight: 700;
  color: var(--text2); letter-spacing: 0.3px;
  cursor: pointer; user-select: none;
}
.fmt-group-head:hover { background: rgba(255,255,255,0.04); }

.fmt-group-head-icon { font-size: 15px; }
.fmt-group-head-count {
  margin-left: auto;
  font-size: 10px; font-family: 'Space Mono', monospace;
  color: var(--text3);
  background: rgba(255,255,255,0.04);
  padding: 2px 7px; border-radius: 10px;
}

/* Chips container */
.fmt-chips {
  padding: 12px 14px;
  display: flex; flex-wrap: wrap; gap: 8px;
}

/* Individual chip */
.fmt-chip {
  display: inline-flex; align-items: center; gap: 5px;
  padding: 7px 12px;
  border: 1.5px solid rgba(255,255,255,0.08);
  border-radius: 8px;
  background: rgba(255,255,255,0.03);
  color: var(--text2);
  font-size: 12px; font-weight: 700;
  font-family: 'Space Mono', monospace;
  cursor: pointer; user-select: none;
  transition: all 0.18s;
  white-space: nowrap;
}
.fmt-chip .ci { font-size: 13px; font-family: initial; }

/* Hover */
.fmt-chip:not(.disabled):hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 14px rgba(0,0,0,0.3);
}

/* Group-specific hover colors */
.g-img  .fmt-chip:not(.disabled):hover { border-color:#63b3ed; color:#63b3ed; background:rgba(99,179,237,0.08); }
.g-doc  .fmt-chip:not(.disabled):hover { border-color:#b794f4; color:#b794f4; background:rgba(183,148,244,0.08); }
.g-code .fmt-chip:not(.disabled):hover { border-color:#76e4f7; color:#76e4f7; background:rgba(118,228,247,0.08); }

/* Selected states */
.g-img  .fmt-chip.sel { border-color:#63b3ed; color:#63b3ed; background:rgba(99,179,237,0.12); box-shadow:0 0 16px rgba(99,179,237,0.15); }
.g-doc  .fmt-chip.sel { border-color:#b794f4; color:#b794f4; background:rgba(183,148,244,0.12); box-shadow:0 0 16px rgba(183,148,244,0.15); }
.g-code .fmt-chip.sel { border-color:#76e4f7; color:#76e4f7; background:rgba(118,228,247,0.12); box-shadow:0 0 16px rgba(118,228,247,0.15); }

/* Disabled */
.fmt-chip.disabled {
  opacity: 0.2; cursor: not-allowed;
  pointer-events: none;
}

/* Selected format bar */
.fp-footer {
  padding: 14px 20px;
  border-top: 1px solid var(--border);
  display: flex; align-items: center; gap: 10px;
  background: rgba(255,255,255,0.015);
  flex-shrink: 0;
}
.fp-footer-label { font-size: 12px; color: var(--text2); }
.sel-badge {
  font-family: 'Space Mono', monospace; font-weight: 700; font-size: 12px;
  background: linear-gradient(135deg, var(--accent), var(--accent2));
  color: #060d1a; padding: 4px 12px; border-radius: 6px;
}
.sel-arrow { font-size: 12px; color: var(--text2); margin-left: 4px; }

/* ═══════════════════════════════════════════
   FOOTER
═══════════════════════════════════════════ */
.footer {
  position: relative; z-index: 1;
  padding: 20px 48px;
  border-top: 1px solid var(--border);
  display: flex; justify-content: space-between; align-items: center;
  flex-wrap: wrap; gap: 12px;
  background: rgba(255,255,255,0.01);
}
.footer-text { font-size: 12px; color: var(--text3); }
.footer-text span { color: var(--accent); font-weight: 600; }
.footer-fmts { display: flex; gap: 6px; }
.footer-fmt {
  font-size: 10px; font-family: 'Space Mono', monospace;
  color: var(--text3); background: var(--card);
  border: 1px solid var(--border); padding: 3px 8px; border-radius: 4px;
}

/* Developer credit badge */
.fn-dev { display: flex; align-items: center; gap: 10px; flex-wrap: wrap; }
.fn-dev-label { font-size: 12px; color: var(--text3); }
.fn-dev-badge {
  display: inline-flex; align-items: center; gap: 8px;
  background: linear-gradient(135deg, rgba(99,179,237,0.08), rgba(183,148,244,0.08));
  border: 1px solid rgba(99,179,237,0.2);
  padding: 7px 16px; border-radius: 50px;
  text-decoration: none; transition: all 0.3s;
  position: relative; overflow: hidden;
}
.fn-dev-badge::before {
  content: ''; position: absolute; inset: 0;
  background: linear-gradient(135deg, rgba(99,179,237,0.12), rgba(183,148,244,0.12));
  opacity: 0; transition: opacity 0.3s;
}
.fn-dev-badge:hover {
  border-color: rgba(99,179,237,0.5); transform: translateY(-2px);
  box-shadow: 0 6px 24px rgba(99,179,237,0.15);
}
.fn-dev-badge:hover::before { opacity: 1; }
.fn-dev-avatar {
  width: 22px; height: 22px; border-radius: 6px;
  background: linear-gradient(135deg, #63b3ed, #b794f4);
  display: flex; align-items: center; justify-content: center;
  font-size: 12px; font-weight: 900; color: #060d1a;
  font-family: 'Space Mono', monospace;
  flex-shrink: 0; position: relative; z-index: 1;
}
.fn-dev-name {
  font-size: 13px; font-weight: 800;
  background: linear-gradient(135deg, #63b3ed, #76e4f7, #b794f4);
  -webkit-background-clip: text; -webkit-text-fill-color: transparent;
  letter-spacing: 0.2px; position: relative; z-index: 1;
}
.fn-dev-stack { display: flex; align-items: center; gap: 5px; position: relative; z-index: 1; }
.fn-dev-dot { width: 3px; height: 3px; border-radius: 50%; background: rgba(99,179,237,0.3); }
.fn-stack-item { font-size: 10px; font-family: 'Space Mono', monospace; font-weight: 700; color: var(--text3); }

/* ═══════════════════════════════════════════
   RESPONSIVE
═══════════════════════════════════════════ */
@media (max-width: 960px) {
  .main { flex-direction: column; padding: 20px; }
  .left-panel { flex: none; width: 100%; }
  .format-panel { max-height: none; }
}
@media (max-width: 600px) {
  .navbar { padding: 0 20px; }
  .nav-links { display: none; }
}


.nav-logo-text {
  font-size: 18px;
  font-weight: 700;
  background: linear-gradient(90deg, #63b3ed, #b794f4, #FC8181);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  letter-spacing: -0.3px;
}
.nav-logo {
  display: flex !important;
  align-items: center;
  gap: 10px;
  text-decoration: none;
}

</style>
</head>
<body>

<nav class="navbar">
  <a href="index.jsp" class="nav-logo">
  <svg width="36" height="36" viewBox="0 0 56 56" style="flex-shrink:0;">
    <defs>
      <linearGradient id="nlogoG" x1="0%" y1="0%" x2="100%" y2="100%">
        <stop offset="0%" stop-color="#63b3ed"/>
        <stop offset="50%" stop-color="#b794f4"/>
        <stop offset="100%" stop-color="#FC8181"/>
      </linearGradient>
    </defs>
    <rect x="2" y="2" width="52" height="52" rx="14" fill="#161b22"/>
    <rect x="2" y="2" width="52" height="52" rx="14" fill="none" stroke="url(#nlogoG)" stroke-width="2"/>
    <text x="28" y="39" text-anchor="middle" font-family="Courier New,monospace" font-size="30" font-weight="700" fill="url(#nlogoG)">N</text>
  </svg>
  <span class="nav-logo-text">NaraConvert</span>
</a>
  <ul class="nav-links">
    <li><a href="index.jsp">Home</a></li>
    <li><a href="upload.jsp" class="active">Convert</a></li>
    <li><a href="formats.jsp">Formats</a></li>
    <li><a href="about.jsp">About</a></li>
  </ul>
  <a href="index.jsp" class="nav-btn">← Home</a>
</nav>

<div class="main">

  <!-- ══ LEFT: Upload ══ -->
  <div class="left-panel">
    <div class="upload-card">

      <div class="upload-title">
        <h1>Upload &amp; Convert</h1>
        <p>Images · Docs · Spreadsheets · Code · and more</p>
      </div>

      <form action="UploadServlet" method="post" enctype="multipart/form-data" onsubmit="return doSubmit()">

        <input type="file" id="fileInput" name="file" onchange="onFileChange()"
          accept="image/*,.pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx,.txt,.csv,.html,.htm,.md,.json,.xml,.yaml,.yml,.sql,.py,.java,.js,.ts,.cpp,.c,.cs,.php,.rb,.go,.rs,.kt,.swift,.sh,.r,.scala" required>

        <!-- Drop Zone -->
        <div class="drop-zone" id="dropZone"
          onclick="document.getElementById('fileInput').click()"
          ondragover="ev.preventDefault();this.classList.add('dragover')"
          ondragleave="this.classList.remove('dragover')"
          ondrop="onDrop(event)">
          <div class="drop-icon-wrap">
            <div class="drop-ring"></div>
            <div class="drop-ring"></div>
            <div class="drop-ring"></div>
            <span class="drop-emoji" id="dropEmoji">📂</span>
          </div>
          <div class="drop-title">Drop your file here</div>
          <div class="drop-sub">or click to browse from your device</div>
          <button type="button" class="browse-btn" onclick="event.stopPropagation();document.getElementById('fileInput').click()">
            ↑ &nbsp;Browse File
          </button>
        </div>

        <!-- File info -->
        <div class="file-info-box" id="fileInfoBox">
          <div class="fi-icon" id="fiIcon">📄</div>
          <div class="fi-details">
            <div class="fi-name" id="fiName">—</div>
            <div class="fi-meta">
              <span id="fiSize">—</span> &nbsp;·&nbsp;
              <span class="fi-ext" id="fiExt">—</span>
            </div>
          </div>
          <span class="fi-check">✓</span>
        </div>

        <!-- Hint -->
        <div class="hint-box" id="hintBox">
          <strong>💡 Detected:</strong> <span id="hintText">—</span>
        </div>

        <!-- Progress -->
        <div class="prog-wrap" id="progWrap">
          <div class="prog-top">
            <span id="progStatus">Uploading...</span>
            <span id="progPct">0%</span>
          </div>
          <div class="prog-track"><div class="prog-bar" id="progBar"></div></div>
          <div class="prog-steps">
            <span class="pstep on" id="ps1">📤 Upload</span>
            <span class="pstep" id="ps2">⚙️ Convert</span>
            <span class="pstep" id="ps3">✅ Done</span>
          </div>
        </div>

        <input type="hidden" name="format" id="selFmt" value="png">

        <button type="submit" class="submit-btn" id="submitBtn">
          <div class="spinner" id="spinner"></div>
          <span id="btnTxt">⚡ Upload &amp; Convert Now</span>
        </button>

      </form>
    </div>
  </div>

  <!-- ══ RIGHT: Format panel ══ -->
  <div class="right-panel">
    <div class="format-panel">

      <div class="fp-header">
        <div class="fp-title-row">
          <span class="fp-title">Select Output Format</span>
          <span class="fp-count" id="fmtCount">36 formats</span>
        </div>
        <div class="fp-search">
          <span>🔍</span>
          <input type="text" id="searchInput" placeholder="Search format... e.g. pdf, python, jpg" oninput="searchFmt(this.value)">
        </div>
      </div>

      <div class="fp-groups" id="fmtGroups">

        <!-- IMAGE -->
        <div class="fmt-group g-img" id="grp-img">
          <div class="fmt-group-head" onclick="toggleGroup('grp-img')">
            <span class="fmt-group-head-icon">🖼️</span>
            <span>Image Formats</span>
            <span class="fmt-group-head-count">8</span>
          </div>
          <div class="fmt-chips" id="chips-grp-img">
            <div class="fmt-chip sel" data-fmt="png"  onclick="pickFmt(this)"><span class="ci">🖼️</span>PNG</div>
            <div class="fmt-chip"     data-fmt="jpg"  onclick="pickFmt(this)"><span class="ci">📷</span>JPG</div>
            <div class="fmt-chip"     data-fmt="jpeg" onclick="pickFmt(this)"><span class="ci">📷</span>JPEG</div>
            <div class="fmt-chip"     data-fmt="bmp"  onclick="pickFmt(this)"><span class="ci">🖌️</span>BMP</div>
            <div class="fmt-chip"     data-fmt="gif"  onclick="pickFmt(this)"><span class="ci">🎞️</span>GIF</div>
            <div class="fmt-chip"     data-fmt="webp" onclick="pickFmt(this)"><span class="ci">🌐</span>WEBP</div>
            <div class="fmt-chip"     data-fmt="tiff" onclick="pickFmt(this)"><span class="ci">🗂️</span>TIFF</div>
            <div class="fmt-chip"     data-fmt="ico"  onclick="pickFmt(this)"><span class="ci">🔖</span>ICO</div>
          </div>
        </div>

        <!-- DOCUMENT -->
        <div class="fmt-group g-doc" id="grp-doc">
          <div class="fmt-group-head" onclick="toggleGroup('grp-doc')">
            <span class="fmt-group-head-icon">📄</span>
            <span>Document &amp; Data Formats</span>
            <span class="fmt-group-head-count">11</span>
          </div>
          <div class="fmt-chips" id="chips-grp-doc">
            <div class="fmt-chip" data-fmt="pdf"  onclick="pickFmt(this)"><span class="ci">📕</span>PDF</div>
            <div class="fmt-chip" data-fmt="word" onclick="pickFmt(this)"><span class="ci">📝</span>WORD</div>
            <div class="fmt-chip" data-fmt="docx" onclick="pickFmt(this)"><span class="ci">📘</span>DOCX</div>
            <div class="fmt-chip" data-fmt="xlsx" onclick="pickFmt(this)"><span class="ci">📗</span>XLSX</div>
            <div class="fmt-chip" data-fmt="txt"  onclick="pickFmt(this)"><span class="ci">📝</span>TXT</div>
            <div class="fmt-chip" data-fmt="csv"  onclick="pickFmt(this)"><span class="ci">📊</span>CSV</div>
            <div class="fmt-chip" data-fmt="html" onclick="pickFmt(this)"><span class="ci">🌍</span>HTML</div>
            <div class="fmt-chip" data-fmt="md"   onclick="pickFmt(this)"><span class="ci">📋</span>MD</div>
            <div class="fmt-chip" data-fmt="json" onclick="pickFmt(this)"><span class="ci">🔧</span>JSON</div>
            <div class="fmt-chip" data-fmt="xml"  onclick="pickFmt(this)"><span class="ci">🔠</span>XML</div>
            <div class="fmt-chip" data-fmt="yaml" onclick="pickFmt(this)"><span class="ci">⚙️</span>YAML</div>
            <div class="fmt-chip" data-fmt="sql"  onclick="pickFmt(this)"><span class="ci">🗄️</span>SQL</div>
          </div>
        </div>

        <!-- CODE -->
        <div class="fmt-group g-code" id="grp-code">
          <div class="fmt-group-head" onclick="toggleGroup('grp-code')">
            <span class="fmt-group-head-icon">💻</span>
            <span>Programming Formats</span>
            <span class="fmt-group-head-count">16</span>
          </div>
          <div class="fmt-chips" id="chips-grp-code">
            <div class="fmt-chip" data-fmt="py"    onclick="pickFmt(this)"><span class="ci">🐍</span>Python</div>
            <div class="fmt-chip" data-fmt="java"  onclick="pickFmt(this)"><span class="ci">☕</span>Java</div>
            <div class="fmt-chip" data-fmt="js"    onclick="pickFmt(this)"><span class="ci">🟨</span>JavaScript</div>
            <div class="fmt-chip" data-fmt="ts"    onclick="pickFmt(this)"><span class="ci">🔷</span>TypeScript</div>
            <div class="fmt-chip" data-fmt="cpp"   onclick="pickFmt(this)"><span class="ci">⚡</span>C++</div>
            <div class="fmt-chip" data-fmt="c"     onclick="pickFmt(this)"><span class="ci">🔵</span>C</div>
            <div class="fmt-chip" data-fmt="cs"    onclick="pickFmt(this)"><span class="ci">🟣</span>C#</div>
            <div class="fmt-chip" data-fmt="php"   onclick="pickFmt(this)"><span class="ci">🐘</span>PHP</div>
            <div class="fmt-chip" data-fmt="rb"    onclick="pickFmt(this)"><span class="ci">💎</span>Ruby</div>
            <div class="fmt-chip" data-fmt="go"    onclick="pickFmt(this)"><span class="ci">🐹</span>Go</div>
            <div class="fmt-chip" data-fmt="rs"    onclick="pickFmt(this)"><span class="ci">🦀</span>Rust</div>
            <div class="fmt-chip" data-fmt="kt"    onclick="pickFmt(this)"><span class="ci">🎯</span>Kotlin</div>
            <div class="fmt-chip" data-fmt="swift" onclick="pickFmt(this)"><span class="ci">🍎</span>Swift</div>
            <div class="fmt-chip" data-fmt="sh"    onclick="pickFmt(this)"><span class="ci">🖥️</span>Shell</div>
            <div class="fmt-chip" data-fmt="r"     onclick="pickFmt(this)"><span class="ci">📈</span>R</div>
            <div class="fmt-chip" data-fmt="scala" onclick="pickFmt(this)"><span class="ci">🔴</span>Scala</div>
          </div>
        </div>

      </div><!-- /fp-groups -->

      <!-- Footer: selected format -->
      <div class="fp-footer">
        <span class="fp-footer-label">Output format:</span>
        <span class="sel-badge" id="selBadge">PNG</span>
        <span class="sel-arrow">→ file will be <strong id="selExt">.png</strong></span>
      </div>

    </div>
  </div>

</div><!-- /main -->

<footer class="footer">
  <div class="footer-text">© 2026 <span>NaraConvert</span> — Universal File Converter</div>

  <div class="fn-dev">
    <span class="fn-dev-label">Designed &amp; Developed by</span>
    <a href="about.jsp" class="fn-dev-badge">
      <div class="fn-dev-avatar">N</div>
      <span class="fn-dev-name">Narayan Prasad Maurya</span>
      <div class="fn-dev-stack">
        <div class="fn-dev-dot"></div>
        <span class="fn-stack-item">Java</span>
        <div class="fn-dev-dot"></div>
        <span class="fn-stack-item">JSP</span>
        <div class="fn-dev-dot"></div>
        <span class="fn-stack-item">MySQL</span>
        <div class="fn-dev-dot"></div>
        <span class="fn-stack-item">Tomcat</span>
      </div>
    </a>
  </div>

  <div class="footer-fmts">
    <span class="footer-fmt">PNG</span><span class="footer-fmt">PDF</span>
    <span class="footer-fmt">DOCX</span><span class="footer-fmt">CODE</span><span class="footer-fmt">+31</span>
  </div>
</footer>

<script>
// ═══════════════════════════════════
// SUPPORT MAP
// ═══════════════════════════════════
const SUPPORT = {
  png:["jpg","jpeg","bmp","gif","webp","tiff","ico","pdf","word","docx","txt","html"],
  jpg:["png","jpeg","bmp","gif","webp","tiff","ico","pdf","word","docx","txt","html"],
  jpeg:["png","jpg","bmp","gif","webp","tiff","ico","pdf","word","docx","txt","html"],
  bmp:["png","jpg","jpeg","gif","webp","tiff","ico","pdf","word","docx","txt","html"],
  gif:["png","jpg","jpeg","bmp","webp","tiff","ico","pdf","word","docx","txt","html"],
  webp:["png","jpg","jpeg","bmp","gif","tiff","ico","pdf","word","docx","txt","html"],
  tiff:["png","jpg","jpeg","bmp","gif","webp","ico","pdf","word","docx","txt","html"],
  tif:["png","jpg","jpeg","bmp","gif","webp","ico","pdf","word","docx","txt","html"],
  ico:["png","jpg","jpeg","bmp","gif","webp","tiff","pdf","word","docx","txt","html"],
  pdf:["png","jpg","jpeg","txt","html","md"],
  docx:["pdf","txt","html","png","jpg","md","csv"],
  doc:["pdf","txt","html","png","jpg","md"],
  xlsx:["csv","txt","html","pdf","png","jpg","json","xml"],
  xls:["csv","txt","html","pdf","png","jpg"],
  pptx:["txt","html","pdf","png","jpg","md"],
  ppt:["txt","html","pdf","png","jpg"],
  txt:["pdf","word","html","png","jpg","md","csv","json","xml","yaml"],
  csv:["txt","html","pdf","word","png","jpg","json","xml"],
  html:["pdf","word","txt","png","jpg","md"],
  htm:["pdf","txt","png","jpg"],
  md:["html","pdf","word","txt","png","jpg"],
  json:["txt","html","word","xml","yaml","csv","md"],
  xml:["txt","html","json","csv","md"],
  yaml:["json","txt","html","md"],
  yml:["json","txt","html","md"],
  sql:["txt","html","md"],
  py:["txt","html","pdf","word","md","js","ts"],
  java:["txt","html","pdf","word","md","kt","cs"],
  js:["txt","html","pdf","md","ts","py"],
  ts:["txt","html","pdf","md","js"],
  cpp:["txt","html","pdf","md","c"],
  c:["txt","html","pdf","md","cpp"],
  cs:["txt","html","pdf","md","java","kt"],
  php:["txt","html","pdf","md"],
  rb:["txt","html","pdf","md","py"],
  go:["txt","html","pdf","md"],
  rs:["txt","html","pdf","md"],
  kt:["txt","html","pdf","md","java"],
  swift:["txt","html","pdf","md"],
  sh:["txt","html","pdf","md"],
  r:["txt","html","pdf","md"],
  scala:["txt","html","pdf","md"],
};

const ICONS = {
  png:"🖼️",jpg:"📷",jpeg:"📷",bmp:"🖌️",gif:"🎞️",webp:"🌐",tiff:"🗂️",ico:"🔖",
  pdf:"📕",word:"📝",docx:"📘",doc:"📘",xlsx:"📗",xls:"📗",pptx:"📊",ppt:"📊",
  txt:"📝",csv:"📊",html:"🌍",htm:"🌍",md:"📋",json:"🔧",xml:"🔠",yaml:"⚙️",sql:"🗄️",
  py:"🐍",java:"☕",js:"🟨",ts:"🔷",cpp:"⚡",c:"🔵",cs:"🟣",php:"🐘",
  rb:"💎",go:"🐹",rs:"🦀",kt:"🎯",swift:"🍎",sh:"🖥️",r:"📈",scala:"🔴",
};

const LABEL = {
  png:"Image",jpg:"Image",jpeg:"Image",bmp:"Image",gif:"Image",webp:"Image",tiff:"Image",tif:"Image",ico:"Image",
  pdf:"PDF Document",word:"Word Document",docx:"Word Document (.docx)",doc:"Word Document",xlsx:"Excel Spreadsheet",
  xls:"Excel Spreadsheet",pptx:"PowerPoint",ppt:"PowerPoint",txt:"Text File",
  csv:"CSV Spreadsheet",html:"HTML File",htm:"HTML File",md:"Markdown",
  json:"JSON Data",xml:"XML File",yaml:"YAML Config",yml:"YAML Config",sql:"SQL File",
  py:"Python Script",java:"Java Source",js:"JavaScript",ts:"TypeScript",
  cpp:"C++ Source",c:"C Source",cs:"C# Source",php:"PHP Script",
  rb:"Ruby Script",go:"Go Source",rs:"Rust Source",kt:"Kotlin Source",
  swift:"Swift Source",sh:"Shell Script",r:"R Script",scala:"Scala Source",
};

// ═══════════════════════════════════
// FORMAT PICK
// ═══════════════════════════════════
function pickFmt(el) {
  if (el.classList.contains('disabled')) return;
  document.querySelectorAll('.fmt-chip').forEach(c => c.classList.remove('sel'));
  el.classList.add('sel');
  const fmt = el.dataset.fmt;
  document.getElementById('selFmt').value  = fmt;
  document.getElementById('selBadge').textContent = fmt.toUpperCase();
  document.getElementById('selExt').textContent   = '.' + fmt;

  // pop animation
  el.style.transform = 'scale(0.88)';
  setTimeout(() => el.style.transform = '', 150);
}

// ═══════════════════════════════════
// FILE CHANGE
// ═══════════════════════════════════
function onFileChange() {
  const fi  = document.getElementById('fileInput');
  if (!fi.files.length) return;
  const file = fi.files[0];
  const ext  = file.name.split('.').pop().toLowerCase();

  document.getElementById('fiIcon').textContent = ICONS[ext] || '📄';
  document.getElementById('fiName').textContent = file.name;
  document.getElementById('fiSize').textContent = fmtSize(file.size);
  document.getElementById('fiExt').textContent  = ext.toUpperCase();
  document.getElementById('fileInfoBox').classList.add('show');
  document.getElementById('dropEmoji').textContent = ICONS[ext] || '📄';
  document.getElementById('dropZone').classList.add('has-file');

  showHint(ext);
  filterChips(ext);
}

function fmtSize(b) {
  if (b < 1024) return b + ' B';
  if (b < 1048576) return (b/1024).toFixed(1) + ' KB';
  return (b/1048576).toFixed(2) + ' MB';
}

function showHint(ext) {
  const box   = document.getElementById('hintBox');
  const text  = document.getElementById('hintText');
  const valid = SUPPORT[ext];
  const lbl   = LABEL[ext] || ext.toUpperCase();
  if (!valid) {
    text.textContent = 'Unsupported format: .' + ext;
    box.classList.add('show'); return;
  }
  text.innerHTML = `<strong style="color:#f0f6fc">${lbl}</strong> — output options: `
    + valid.slice(0,10).map(f => `<span class="hint-fmt">${f.toUpperCase()}</span>`).join('')
    + (valid.length>10 ? ` <em style="color:#484f58">+${valid.length-10} more</em>` : '');
  box.classList.add('show');
}

function filterChips(ext) {
  const valid = SUPPORT[ext] || [];
  let autoSelected = false;

  document.querySelectorAll('.fmt-chip').forEach(chip => {
    const fmt = chip.dataset.fmt;
    const ok  = valid.includes(fmt);
    chip.classList.toggle('disabled', !ok);

    // if current selected is now disabled → auto-pick first valid
    if (chip.classList.contains('sel') && !ok) {
      chip.classList.remove('sel');
    }
  });

  // auto-select first valid chip
  const currentSel = document.querySelector('.fmt-chip.sel:not(.disabled)');
  if (!currentSel) {
    const firstValid = document.querySelector(`.fmt-chip[data-fmt="${valid[0]}"]`);
    if (firstValid) pickFmt(firstValid);
  }
}

// ═══════════════════════════════════
// DRAG & DROP
// ═══════════════════════════════════
function onDrop(ev) {
  ev.preventDefault();
  document.getElementById('dropZone').classList.remove('dragover');
  const fi = document.getElementById('fileInput');
  if (ev.dataTransfer.files.length > 0) {
    // We can't directly assign to fi.files cross-browser without a DataTransfer trick
    // Use DataTransfer
    const dt = new DataTransfer();
    dt.items.add(ev.dataTransfer.files[0]);
    fi.files = dt.files;
    onFileChange();
  }
}

// ═══════════════════════════════════
// SEARCH
// ═══════════════════════════════════
function searchFmt(q) {
  q = q.toLowerCase().trim();
  document.querySelectorAll('.fmt-chip').forEach(chip => {
    const txt = chip.textContent.toLowerCase();
    const fmt = chip.dataset.fmt.toLowerCase();
    chip.style.display = (!q || txt.includes(q) || fmt.includes(q)) ? '' : 'none';
  });
}

// ═══════════════════════════════════
// TOGGLE GROUP
// ═══════════════════════════════════
function toggleGroup(id) {
  const chips = document.getElementById('chips-' + id);
  if (!chips) return;
  chips.style.display = chips.style.display === 'none' ? '' : 'none';
}

// ═══════════════════════════════════
// SUBMIT
// ═══════════════════════════════════
function doSubmit() {
  const fi  = document.getElementById('fileInput');
  const fmt = document.getElementById('selFmt').value;
  if (!fi.files.length) { alert('Please select a file first.'); return false; }
  if (!fmt) { alert('Please select an output format.'); return false; }

  const progWrap = document.getElementById('progWrap');
  const progBar  = document.getElementById('progBar');
  const progPct  = document.getElementById('progPct');
  const progStatus = document.getElementById('progStatus');
  const spinner  = document.getElementById('spinner');
  const btnTxt   = document.getElementById('btnTxt');
  const submitBtn = document.getElementById('submitBtn');
  const ps2 = document.getElementById('ps2');

  progWrap.classList.add('show');
  submitBtn.disabled = true;
  spinner.style.display = 'block';
  btnTxt.textContent = 'Converting...';

  let w = 0;
  const iv = setInterval(() => {
    w += Math.random() * 2.2 + 0.4;
    w = Math.min(w, 93);
    progBar.style.width = w + '%';
    progPct.textContent = Math.round(w) + '%';
    if (w > 35) { progStatus.textContent = 'Uploading...'; ps2.classList.add('on'); }
    if (w > 70) progStatus.textContent = 'Converting...';
    if (w >= 93) clearInterval(iv);
  }, 80);

  return true;
}

// ═══════════════════════════════════
// INIT
// ═══════════════════════════════════
window.addEventListener('DOMContentLoaded', () => {
  // Count all chips
  const n = document.querySelectorAll('.fmt-chip').length;
  const fc = document.getElementById('fmtCount');
  if (fc) fc.textContent = n + ' formats';
});
</script>
</body>
</html>
