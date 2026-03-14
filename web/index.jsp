<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NaraConvert – Universal File Converter</title>
<link rel="stylesheet" href="css/style.css">
<script src="js/script.js" defer></script>
<style>
/* ═══════════════════════════════════════
   PREMIUM FOOTER
═══════════════════════════════════════ */
.footer-new {
  position: relative; z-index: 1;
  background: rgba(255,255,255,0.02);
  border-top: 1px solid rgba(255,255,255,0.07);
  padding: 0 52px;
  margin-top: 80px;
}

/* Top section */
.fn-top {
  display: flex; gap: 64px;
  padding: 56px 0 48px;
  align-items: flex-start;
}

/* Brand col */
.fn-brand { flex: 0 0 260px; }
.fn-logo {
  font-family: 'Space Mono', monospace;
  font-size: 20px; font-weight: 700;
  background: linear-gradient(135deg, #63b3ed, #76e4f7);
  -webkit-background-clip: text; -webkit-text-fill-color: transparent;
  margin-bottom: 14px;
}
.fn-tagline {
  font-size: 13px; color: #8b949e; line-height: 1.7;
  margin-bottom: 20px;
}
.fn-socials { display: flex; gap: 10px; }
.fn-social {
  width: 38px; height: 38px; border-radius: 10px;
  background: rgba(255,255,255,0.04);
  border: 1px solid rgba(255,255,255,0.08);
  display: flex; align-items: center; justify-content: center;
  font-size: 17px; text-decoration: none;
  transition: all 0.2s; cursor: pointer;
}
.fn-social { color: #8b949e; }
.fn-social:hover { transform: translateY(-3px); }
.fn-github:hover  { border-color: rgba(240,246,252,0.3); background: rgba(240,246,252,0.06); color: #f0f6fc; }
.fn-gmail:hover   { border-color: rgba(252,129,129,0.4); background: rgba(252,129,129,0.08); color: #fc8181; }
.fn-insta:hover   { border-color: rgba(246,135,179,0.4); background: rgba(246,135,179,0.08); color: #f687b3; }
.fn-fb:hover      { border-color: rgba(99,153,237,0.4);  background: rgba(99,153,237,0.08);  color: #63b3ed; }
.fn-phone:hover   { border-color: rgba(104,211,145,0.4); background: rgba(104,211,145,0.08); color: #68d391; }
.fn-ig-link:hover { color: #f687b3 !important; }
.fn-fb-link:hover { color: #63b3ed !important; }

/* Links group */
.fn-links-group { flex: 1; display: flex; gap: 48px; flex-wrap: wrap; }
.fn-links-col { display: flex; flex-direction: column; gap: 10px; min-width: 160px; }
.fn-col-title {
  font-size: 11px; font-weight: 700; color: #484f58;
  letter-spacing: 2px; text-transform: uppercase;
  margin-bottom: 4px;
}
.fn-link {
  font-size: 13px; color: #8b949e; text-decoration: none;
  transition: color 0.2s; display: flex; align-items: center; gap: 7px;
  white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
}
.fn-link:hover { color: #f0f6fc; }

/* Divider */
.fn-divider {
  height: 1px;
  background: linear-gradient(90deg, transparent, rgba(255,255,255,0.07), transparent);
}

/* Formats strip */
.fn-formats {
  padding: 18px 0;
  display: flex; flex-wrap: wrap; gap: 7px;
  justify-content: center;
}
.fn-fmt {
  font-family: 'Space Mono', monospace;
  font-size: 10px; font-weight: 700;
  color: #484f58;
  background: rgba(255,255,255,0.025);
  border: 1px solid rgba(255,255,255,0.06);
  padding: 3px 9px; border-radius: 5px;
  transition: all 0.2s; cursor: default;
}
.fn-fmt:hover {
  color: #63b3ed;
  border-color: rgba(99,179,237,0.25);
  background: rgba(99,179,237,0.05);
}

/* Bottom bar */
.fn-bottom {
  display: flex; align-items: center; justify-content: space-between;
  padding: 22px 0; flex-wrap: wrap; gap: 14px;
}
.fn-copy { font-size: 12px; color: #484f58; }
.fn-accent { color: #63b3ed; font-weight: 600; }

/* Developer credit badge */
.fn-dev {
  display: flex; align-items: center; gap: 10px; flex-wrap: wrap;
}
.fn-dev-label {
  font-size: 12px; color: #484f58;
}
.fn-dev-badge {
  display: inline-flex; align-items: center; gap: 8px;
  background: linear-gradient(135deg, rgba(99,179,237,0.08), rgba(183,148,244,0.08));
  border: 1px solid rgba(99,179,237,0.2);
  padding: 7px 16px; border-radius: 50px;
  text-decoration: none;
  transition: all 0.3s;
  position: relative; overflow: hidden;
}
.fn-dev-badge::before {
  content: '';
  position: absolute; inset: 0;
  background: linear-gradient(135deg, rgba(99,179,237,0.12), rgba(183,148,244,0.12));
  opacity: 0; transition: opacity 0.3s;
}
.fn-dev-badge:hover { border-color: rgba(99,179,237,0.5); transform: translateY(-2px);
  box-shadow: 0 6px 24px rgba(99,179,237,0.15); }
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
  font-family: 'Outfit', sans-serif;
}
.fn-dev-stack {
  display: flex; align-items: center; gap: 5px;
  position: relative; z-index: 1;
}
.fn-dev-dot {
  width: 3px; height: 3px; border-radius: 50%;
  background: rgba(99,179,237,0.3);
}
.fn-stack-item {
  font-size: 10px; font-family: 'Space Mono', monospace; font-weight: 700;
  color: #484f58; letter-spacing: 0.5px;
}
.fn-stack-item:hover { color: #8b949e; }

@media (max-width: 900px) {
  .footer-new { padding: 0 20px; }
  .fn-top { flex-direction: column; gap: 36px; padding: 40px 0 32px; }
  .fn-brand { flex: none; }
  .fn-links-group { gap: 28px; }
  .fn-bottom { flex-direction: column; align-items: flex-start; gap: 8px; }
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

<!-- Floating orbs -->
<div class="orb orb-1"></div>
<div class="orb orb-2"></div>

<div class="page-wrapper">

  <!-- NAVBAR -->
  <nav class="navbar">
<!--    <div class="nav-logo"><span>Nara</span>Convert</div>-->
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
      <li><a href="#">Home</a></li>
      <li><a href="upload.jsp">Convert</a></li>
      <li><a href="formats.jsp">Formats</a></li>
      <li><a href="about.jsp">About</a></li>
    </ul>
    <a href="upload.jsp"><button class="nav-badge">Start Converting →</button></a>
  </nav>

  <!-- HERO -->
  <section class="hero">
    <div class="hero-eyebrow">
      <span class="dot"></span>
      Universal File Converter — Free &amp; Fast
    </div>

    <h1 class="hero-title">
      <span class="line1">Convert Any</span>
      <span class="line2">File Instantly</span>
    </h1>

    <p class="hero-subtitle">
      Transform your images, documents and media into any format in seconds.
      No registration. No limits. Just pure conversion power.
    </p>

    <div class="format-row">
      <span class="format-badge">PNG</span>
      <span class="format-badge">JPG</span>
      <span class="format-badge">JPEG</span>
      <span class="format-badge">BMP</span>
      <span class="format-badge">GIF</span>
      <span class="format-badge">WEBP</span>
      <span class="format-badge">TIFF</span>
      <span class="format-badge">PDF</span>
      <span class="format-badge">ICO</span>
      <span class="format-badge">SVG</span>
    </div>

    <div class="hero-cta-group">
      <a href="upload.jsp" class="btn-primary">
        Start Converting
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
          <path d="M5 12h14M12 5l7 7-7 7"/>
        </svg>
      </a>
      <a href="#features" class="btn-secondary">
        See Features
      </a>
    </div>

    <div class="stats-row">
      <div class="stat-item">
        <div class="stat-number" data-target="10" data-suffix="+">10+</div>
        <div class="stat-label">Formats</div>
      </div>
      <div class="stat-item">
        <div class="stat-number" data-target="100" data-suffix="%">100%</div>
        <div class="stat-label">Free</div>
      </div>
      <div class="stat-item">
        <div class="stat-number" data-target="3" data-suffix="s">3s</div>
        <div class="stat-label">Avg Speed</div>
      </div>
      <div class="stat-item">
        <div class="stat-number">🔒</div>
        <div class="stat-label">Secure</div>
      </div>
    </div>
  </section>

  <!-- FEATURES -->
  <section class="features-section" id="features">
    <div class="section-header">
      <div class="section-label">Why NaraConvert</div>
      <h2 class="section-title">Everything you need</h2>
    </div>

    <div class="features-grid">
      <div class="feature-card">
        <div class="feature-icon icon-blue">⚡</div>
        <div class="feature-title">Lightning Fast</div>
        <div class="feature-desc">Server-side Java processing ensures blazing fast conversion. Most files done in under 3 seconds.</div>
      </div>

      <div class="feature-card">
        <div class="feature-icon icon-purple">🎨</div>
        <div class="feature-title">10+ Formats</div>
        <div class="feature-desc">PNG, JPG, JPEG, BMP, GIF, WEBP, TIFF, PDF, ICO and more. All common formats supported.</div>
      </div>

      <div class="feature-card">
        <div class="feature-icon icon-green">🔒</div>
        <div class="feature-title">100% Secure</div>
        <div class="feature-desc">Your files are processed locally on our server and deleted immediately after conversion.</div>
      </div>

      <div class="feature-card">
        <div class="feature-icon icon-cyan">📦</div>
        <div class="feature-title">No Size Limit</div>
        <div class="feature-desc">Upload files of any size. Our powerful server handles large files without breaking a sweat.</div>
      </div>

      <div class="feature-card">
        <div class="feature-icon icon-blue">🖱️</div>
        <div class="feature-title">Drag &amp; Drop</div>
        <div class="feature-desc">Simply drag your file onto the upload area. No complicated steps, just drop and convert.</div>
      </div>

      <div class="feature-card">
        <div class="feature-icon icon-purple">💾</div>
        <div class="feature-title">Instant Download</div>
        <div class="feature-desc">Download your converted file immediately. No waiting, no email — instant access.</div>
      </div>
    </div>
  </section>

  <!-- FOOTER -->
  <footer class="footer-new">

    <!-- Top: Logo + nav + social -->
    <div class="fn-top">
      <div class="fn-brand">
        <div class="fn-logo">⚡ NaraConvert</div>
        <p class="fn-tagline">Universal File Converter — 35+ formats, completely free.<br>No registration. No limits. Just pure conversion power.</p>
        <div class="fn-socials">
          <a href="https://github.com/narayan1483" target="_blank" class="fn-social fn-github" title="GitHub">
            <svg width="17" height="17" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0 0 24 12c0-6.63-5.37-12-12-12z"/></svg>
          </a>
          <a href="mailto:mauryanarayan649@gmail.com" class="fn-social fn-gmail" title="Gmail">
            <svg width="17" height="17" viewBox="0 0 24 24" fill="currentColor"><path d="M24 5.457v13.909c0 .904-.732 1.636-1.636 1.636h-3.819V11.73L12 16.64l-6.545-4.91v9.273H1.636A1.636 1.636 0 0 1 0 19.366V5.457c0-2.023 2.309-3.178 3.927-1.964L5.455 4.64 12 9.548l6.545-4.91 1.528-1.145C21.69 2.28 24 3.434 24 5.457z"/></svg>
          </a>
          <a href="https://www.instagram.com/npmaurya124/" target="_blank" class="fn-social fn-insta" title="Instagram">
            <svg width="17" height="17" viewBox="0 0 24 24" fill="currentColor"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/></svg>
          </a>
          <a href="https://www.facebook.com/narayanprasad.maurya.5" target="_blank" class="fn-social fn-fb" title="Facebook">
            <svg width="17" height="17" viewBox="0 0 24 24" fill="currentColor"><path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/></svg>
          </a>
          <a href="tel:+919517339347" class="fn-social fn-phone" title="Call / WhatsApp">
            <svg width="17" height="17" viewBox="0 0 24 24" fill="currentColor"><path d="M6.62 10.79c1.44 2.83 3.76 5.14 6.59 6.59l2.2-2.2c.27-.27.67-.36 1.02-.24 1.12.37 2.33.57 3.57.57.55 0 1 .45 1 1V20c0 .55-.45 1-1 1-9.39 0-17-7.61-17-17 0-.55.45-1 1-1h3.5c.55 0 1 .45 1 1 0 1.25.2 2.45.57 3.57.11.35.03.74-.25 1.02l-2.2 2.2z"/></svg>
          </a>
        </div>
      </div>

      <div class="fn-links-group">
        <div class="fn-links-col">
          <div class="fn-col-title">Pages</div>
          <a href="index.jsp" class="fn-link">🏠 Home</a>
          <a href="upload.jsp" class="fn-link">⚡ Convert</a>
          <a href="formats.jsp" class="fn-link">📋 Formats</a>
          <a href="about.jsp" class="fn-link">👤 About</a>
        </div>
        <div class="fn-links-col">
          <div class="fn-col-title">Formats</div>
          <a href="upload.jsp" class="fn-link">🖼️ Images</a>
          <a href="upload.jsp" class="fn-link">📄 Documents</a>
          <a href="upload.jsp" class="fn-link">💻 Code Files</a>
          <a href="upload.jsp" class="fn-link">📊 Spreadsheets</a>
        </div>
        <div class="fn-links-col">
          <div class="fn-col-title">Contact</div>
          <a href="https://github.com/narayan1483" target="_blank" class="fn-link">🐙 github.com/narayan1483</a>
          <a href="mailto:mauryanarayan649@gmail.com" class="fn-link">📧 mauryanarayan649@gmail.com</a>
          <a href="tel:+919517339347" class="fn-link">📞 +91 9517339347</a>
          <a href="https://www.instagram.com/npmaurya124/" target="_blank" class="fn-link fn-ig-link">📸 instagram/npmaurya124</a>
          <a href="https://www.facebook.com/narayanprasad.maurya.5" target="_blank" class="fn-link fn-fb-link">👥 facebook/narayanprasad</a>
        </div>
      </div>
    </div>

    <!-- Divider -->
    <div class="fn-divider"></div>

    <!-- Formats strip -->
    <div class="fn-formats">
      <span class="fn-fmt">PNG</span><span class="fn-fmt">JPG</span><span class="fn-fmt">JPEG</span>
      <span class="fn-fmt">BMP</span><span class="fn-fmt">GIF</span><span class="fn-fmt">WEBP</span>
      <span class="fn-fmt">TIFF</span><span class="fn-fmt">ICO</span><span class="fn-fmt">PDF</span>
      <span class="fn-fmt">DOCX</span><span class="fn-fmt">XLSX</span><span class="fn-fmt">CSV</span>
      <span class="fn-fmt">HTML</span><span class="fn-fmt">JSON</span><span class="fn-fmt">XML</span>
      <span class="fn-fmt">YAML</span><span class="fn-fmt">SQL</span><span class="fn-fmt">MD</span>
      <span class="fn-fmt">PY</span><span class="fn-fmt">JAVA</span><span class="fn-fmt">JS</span>
      <span class="fn-fmt">TS</span><span class="fn-fmt">C++</span><span class="fn-fmt">PHP</span>
      <span class="fn-fmt">GO</span><span class="fn-fmt">RUST</span><span class="fn-fmt">KT</span>
    </div>

    <!-- Divider -->
    <div class="fn-divider"></div>

    <!-- Bottom bar -->
    <div class="fn-bottom">
      <div class="fn-copy">
        © 2026 <span class="fn-accent">NaraConvert</span> — All rights reserved
      </div>
      <div class="fn-dev">
          <span class="fn-dev-label"><h3>Designed &amp; Developed by</h3></span>
        <a href="about.jsp" class="fn-dev-badge">
          <div class="fn-dev-avatar">N</div>
          <span class="fn-dev-name">Narayan Prasad Maurya</span>
          <div class="fn-dev-stack">
            <div class="fn-dev-dot"></div>
            <span class="fn-stack-item">Java</span>
            <div class="fn-dev-dot"></div>
             <span class="fn-stack-item">JavaScript</span>
            <div class="fn-dev-dot"></div>
            <span class="fn-stack-item">JSP</span>
            <div class="fn-dev-dot"></div>
            <span class="fn-stack-item">MySQL</span>
            <div class="fn-dev-dot"></div>
            <span class="fn-stack-item">Tomcat</span>
          </div>
        </a>
      </div>
    </div>

  </footer>

</div>
</body>
</html>
