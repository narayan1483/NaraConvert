<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NaraConvert – All Supported Formats</title>
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&family=Space+Mono:wght@400;700&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{margin:0;padding:0;box-sizing:border-box;}
:root{
  --bg:#060d1a;--bg2:rgba(255,255,255,0.04);--border:rgba(255,255,255,0.08);
  --accent:#63b3ed;--accent2:#76e4f7;--accent3:#b794f4;
  --green:#68d391;--yellow:#f6e05e;--orange:#f6ad55;--red:#fc8181;--pink:#f687b3;
  --text1:#f0f6fc;--text2:#8b949e;--text3:#484f58;
}
html,body{height:100%;}
body{font-family:'Outfit',sans-serif;background:var(--bg);color:var(--text1);overflow-x:hidden;}
body::before{content:'';position:fixed;inset:0;z-index:0;
  background:radial-gradient(ellipse 70% 50% at 10% 20%,rgba(99,179,237,0.05) 0%,transparent 60%),
             radial-gradient(ellipse 60% 50% at 90% 80%,rgba(183,148,244,0.05) 0%,transparent 60%);pointer-events:none;}
body::after{content:'';position:fixed;inset:0;z-index:0;
  background-image:linear-gradient(rgba(255,255,255,0.012) 1px,transparent 1px),
                   linear-gradient(90deg,rgba(255,255,255,0.012) 1px,transparent 1px);
  background-size:50px 50px;pointer-events:none;}

/* NAVBAR */
.navbar{position:sticky;top:0;z-index:100;display:flex;align-items:center;justify-content:space-between;
  padding:0 48px;height:64px;background:rgba(6,13,26,0.9);backdrop-filter:blur(20px);
  border-bottom:1px solid var(--border);}
.nav-logo{font-family:'Space Mono',monospace;font-size:20px;font-weight:700;
  background:linear-gradient(135deg,var(--accent),var(--accent2));
  -webkit-background-clip:text;-webkit-text-fill-color:transparent;text-decoration:none;}
.nav-links{display:flex;gap:28px;list-style:none;}
.nav-links a{color:var(--text2);font-size:14px;font-weight:500;text-decoration:none;transition:color 0.2s;}
.nav-links a:hover{color:var(--text1);}
.nav-links a.active{color:var(--accent);}
.nav-btn{background:rgba(99,179,237,0.1);border:1px solid rgba(99,179,237,0.25);color:var(--accent);
  padding:8px 20px;border-radius:8px;font-size:13px;font-weight:600;cursor:pointer;
  text-decoration:none;transition:all 0.2s;font-family:'Outfit',sans-serif;}
.nav-btn:hover{background:rgba(99,179,237,0.2);}

/* PAGE */
.page{position:relative;z-index:1;max-width:1200px;margin:0 auto;padding:60px 48px;}

/* HERO */
.hero{text-align:center;margin-bottom:64px;}
.eyebrow{display:inline-flex;align-items:center;gap:8px;background:rgba(99,179,237,0.08);
  border:1px solid rgba(99,179,237,0.2);color:var(--accent);font-size:11px;font-weight:700;
  letter-spacing:2px;text-transform:uppercase;padding:7px 16px;border-radius:50px;margin-bottom:24px;}
.eyebrow-dot{width:6px;height:6px;background:var(--accent);border-radius:50%;animation:blink 2s infinite;}
@keyframes blink{0%,100%{opacity:1;}50%{opacity:0.3;}}
.hero h1{font-size:clamp(36px,5vw,60px);font-weight:900;letter-spacing:-2px;margin-bottom:16px;}
.hero h1 span{background:linear-gradient(135deg,var(--accent),var(--accent2),var(--accent3));
  -webkit-background-clip:text;-webkit-text-fill-color:transparent;}
.hero p{font-size:17px;color:var(--text2);max-width:520px;margin:0 auto;line-height:1.7;}

/* STATS ROW */
.stats{display:flex;justify-content:center;gap:48px;margin:40px 0 64px;}
.stat{text-align:center;}
.stat-num{font-size:36px;font-weight:900;background:linear-gradient(135deg,var(--accent),var(--accent2));
  -webkit-background-clip:text;-webkit-text-fill-color:transparent;}
.stat-lbl{font-size:12px;color:var(--text3);letter-spacing:1.5px;text-transform:uppercase;margin-top:4px;}

/* SECTION */
.section{margin-bottom:56px;}
.section-header{display:flex;align-items:center;gap:12px;margin-bottom:24px;padding-bottom:14px;
  border-bottom:1px solid var(--border);}
.section-icon{font-size:24px;}
.section-title{font-size:22px;font-weight:800;letter-spacing:-0.5px;}
.section-count{font-size:11px;font-family:'Space Mono',monospace;color:var(--text3);
  background:var(--bg2);border:1px solid var(--border);padding:3px 10px;border-radius:20px;margin-left:auto;}

/* FORMAT CARDS GRID */
.fmt-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(180px,1fr));gap:12px;}

.fmt-card{
  background:var(--bg2);border:1px solid var(--border);border-radius:14px;
  padding:18px 16px;cursor:pointer;transition:all 0.25s;
  display:flex;flex-direction:column;gap:8px;position:relative;overflow:hidden;
  text-decoration:none;
}
.fmt-card::before{content:'';position:absolute;top:0;left:0;right:0;height:2px;
  opacity:0;transition:opacity 0.3s;}
.fmt-card:hover{transform:translateY(-4px);border-color:rgba(255,255,255,0.15);}
.fmt-card:hover::before{opacity:1;}

/* Color variants */
.fmt-card.c-blue::before{background:linear-gradient(90deg,var(--accent),var(--accent2));}
.fmt-card.c-blue:hover{box-shadow:0 8px 32px rgba(99,179,237,0.12);border-color:rgba(99,179,237,0.25);}
.fmt-card.c-purple::before{background:linear-gradient(90deg,var(--accent3),#d6bcfa);}
.fmt-card.c-purple:hover{box-shadow:0 8px 32px rgba(183,148,244,0.12);border-color:rgba(183,148,244,0.25);}
.fmt-card.c-green::before{background:linear-gradient(90deg,var(--green),#9ae6b4);}
.fmt-card.c-green:hover{box-shadow:0 8px 32px rgba(104,211,145,0.12);border-color:rgba(104,211,145,0.25);}
.fmt-card.c-cyan::before{background:linear-gradient(90deg,var(--accent2),#c4f1f9);}
.fmt-card.c-cyan:hover{box-shadow:0 8px 32px rgba(118,228,247,0.12);border-color:rgba(118,228,247,0.25);}
.fmt-card.c-orange::before{background:linear-gradient(90deg,var(--orange),#fbd38d);}
.fmt-card.c-orange:hover{box-shadow:0 8px 32px rgba(246,173,85,0.12);border-color:rgba(246,173,85,0.25);}
.fmt-card.c-red::before{background:linear-gradient(90deg,var(--red),#feb2b2);}
.fmt-card.c-red:hover{box-shadow:0 8px 32px rgba(252,129,129,0.12);border-color:rgba(252,129,129,0.25);}
.fmt-card.c-pink::before{background:linear-gradient(90deg,var(--pink),#fbb6ce);}
.fmt-card.c-pink:hover{box-shadow:0 8px 32px rgba(246,135,179,0.12);border-color:rgba(246,135,179,0.25);}

.fmt-card-top{display:flex;align-items:center;justify-content:space-between;}
.fmt-emoji{font-size:26px;}
.fmt-ext{font-family:'Space Mono',monospace;font-size:11px;font-weight:700;
  background:rgba(255,255,255,0.05);border:1px solid rgba(255,255,255,0.08);
  padding:2px 8px;border-radius:5px;color:var(--text3);}
.fmt-name{font-size:15px;font-weight:700;color:var(--text1);}
.fmt-desc{font-size:12px;color:var(--text2);line-height:1.5;}
.fmt-tags{display:flex;gap:4px;flex-wrap:wrap;margin-top:4px;}
.fmt-tag{font-size:10px;font-family:'Space Mono',monospace;font-weight:700;
  padding:2px 6px;border-radius:4px;color:var(--text3);}

/* CTA */
.cta-bar{background:linear-gradient(135deg,rgba(99,179,237,0.08),rgba(183,148,244,0.08));
  border:1px solid rgba(99,179,237,0.15);border-radius:20px;padding:48px;
  text-align:center;margin-top:64px;}
.cta-bar h2{font-size:32px;font-weight:900;letter-spacing:-1px;margin-bottom:12px;}
.cta-bar p{font-size:15px;color:var(--text2);margin-bottom:28px;}
.cta-btn{display:inline-flex;align-items:center;gap:10px;
  background:linear-gradient(135deg,var(--accent),var(--accent2));
  color:#060d1a;padding:16px 36px;border-radius:12px;font-size:16px;font-weight:800;
  text-decoration:none;transition:all 0.3s;box-shadow:0 0 32px rgba(99,179,237,0.2);}
.cta-btn:hover{transform:translateY(-2px);box-shadow:0 0 48px rgba(99,179,237,0.4);}

/* FOOTER */
.footer{position:relative;z-index:1;padding:20px 48px;border-top:1px solid var(--border);
  display:flex;justify-content:space-between;align-items:center;}
.footer-text{font-size:12px;color:var(--text3);}
.footer-text span{color:var(--accent);}

@media(max-width:768px){.page{padding:40px 20px;}.navbar{padding:0 20px;}.nav-links{display:none;}
  .stats{gap:24px;}.fmt-grid{grid-template-columns:repeat(auto-fill,minmax(140px,1fr));}}


/* ── Developer Badge ── */
.fn-dev{display:flex;justify-content:center;padding:24px 0 32px;background:transparent;}
.fn-dev-badge{display:inline-flex;align-items:center;gap:14px;background:linear-gradient(135deg,#1a1a2e,#16213e);border:1px solid rgba(99,179,237,0.25);border-radius:50px;padding:10px 24px 10px 10px;text-decoration:none;transition:all .3s;box-shadow:0 4px 24px rgba(0,0,0,.4);}
.fn-dev-badge:hover{border-color:rgba(99,179,237,0.6);box-shadow:0 6px 32px rgba(99,179,237,.2);transform:translateY(-2px);}
.fn-dev-avatar{width:40px;height:40px;border-radius:50%;background:linear-gradient(135deg,#4299e1,#9f7aea);display:flex;align-items:center;justify-content:center;font-weight:800;font-size:17px;color:#fff;flex-shrink:0;}
.fn-dev-info{display:flex;flex-direction:column;gap:2px;}
.fn-dev-label{font-size:10px;color:#718096;text-transform:uppercase;letter-spacing:1.5px;font-weight:600;}
.fn-dev-name{font-size:14px;font-weight:700;background:linear-gradient(90deg,#63b3ed,#76e4f7,#b794f4);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;}
.fn-dev-stack{display:flex;align-items:center;gap:6px;margin-top:2px;}
.fn-dev-dot{width:3px;height:3px;border-radius:50%;background:#4a5568;}
.fn-stack-item{font-size:10px;color:#63b3ed;font-weight:600;letter-spacing:.5px;}

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
    <li><a href="upload.jsp">Convert</a></li>
    <li><a href="formats.jsp" class="active">Formats</a></li>
    <li><a href="about.jsp">About</a></li>
  </ul>
  <a href="upload.jsp" class="nav-btn">Start Converting →</a>
</nav>

<div class="page">

  <div class="hero">
    <div class="eyebrow"><span class="eyebrow-dot"></span>All Supported Formats</div>
    <h1>Every Format<br><span>You'll Ever Need</span></h1>
    <p>35+ input and output formats — images, documents, spreadsheets, code and more.</p>
  </div>

  <div class="stats">
    <div class="stat"><div class="stat-num">35+</div><div class="stat-lbl">Formats</div></div>
    <div class="stat"><div class="stat-num">3</div><div class="stat-lbl">Categories</div></div>
    <div class="stat"><div class="stat-num">100%</div><div class="stat-lbl">Free</div></div>
    <div class="stat"><div class="stat-num">0</div><div class="stat-lbl">Registration</div></div>
  </div>

  <!-- IMAGE FORMATS -->
  <div class="section">
    <div class="section-header">
      <span class="section-icon">🖼️</span>
      <span class="section-title">Image Formats</span>
      <span class="section-count">8 formats</span>
    </div>
    <div class="fmt-grid">
      <div class="fmt-card c-blue">
        <div class="fmt-card-top"><span class="fmt-emoji">🖼️</span><span class="fmt-ext">.png</span></div>
        <div class="fmt-name">PNG</div>
        <div class="fmt-desc">Lossless compression with transparency support. Best for web graphics.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(99,179,237,0.1);color:#63b3ed;">Lossless</span><span class="fmt-tag" style="background:rgba(104,211,145,0.1);color:#68d391;">Transparency</span></div>
      </div>
      <div class="fmt-card c-blue">
        <div class="fmt-card-top"><span class="fmt-emoji">📷</span><span class="fmt-ext">.jpg</span></div>
        <div class="fmt-name">JPG / JPEG</div>
        <div class="fmt-desc">Lossy compression. Great for photos and realistic images.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(99,179,237,0.1);color:#63b3ed;">Compressed</span><span class="fmt-tag" style="background:rgba(246,173,85,0.1);color:#f6ad55;">Photos</span></div>
      </div>
      <div class="fmt-card c-blue">
        <div class="fmt-card-top"><span class="fmt-emoji">🖌️</span><span class="fmt-ext">.bmp</span></div>
        <div class="fmt-name">BMP</div>
        <div class="fmt-desc">Uncompressed bitmap. Maximum quality, large file size.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(246,173,85,0.1);color:#f6ad55;">Uncompressed</span></div>
      </div>
      <div class="fmt-card c-blue">
        <div class="fmt-card-top"><span class="fmt-emoji">🎞️</span><span class="fmt-ext">.gif</span></div>
        <div class="fmt-name">GIF</div>
        <div class="fmt-desc">256 colors with animation support. Classic web format.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(183,148,244,0.1);color:#b794f4;">Animation</span></div>
      </div>
      <div class="fmt-card c-cyan">
        <div class="fmt-card-top"><span class="fmt-emoji">🌐</span><span class="fmt-ext">.webp</span></div>
        <div class="fmt-name">WEBP</div>
        <div class="fmt-desc">Modern web format by Google. Better compression than PNG/JPG.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(118,228,247,0.1);color:#76e4f7;">Modern</span><span class="fmt-tag" style="background:rgba(104,211,145,0.1);color:#68d391;">Web</span></div>
      </div>
      <div class="fmt-card c-blue">
        <div class="fmt-card-top"><span class="fmt-emoji">🗂️</span><span class="fmt-ext">.tiff</span></div>
        <div class="fmt-name">TIFF</div>
        <div class="fmt-desc">Professional quality for print and publishing workflows.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(99,179,237,0.1);color:#63b3ed;">Print</span><span class="fmt-tag" style="background:rgba(99,179,237,0.1);color:#63b3ed;">Lossless</span></div>
      </div>
      <div class="fmt-card c-blue">
        <div class="fmt-card-top"><span class="fmt-emoji">🔖</span><span class="fmt-ext">.ico</span></div>
        <div class="fmt-name">ICO</div>
        <div class="fmt-desc">Windows icon format. Used for app and browser favicons.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(246,173,85,0.1);color:#f6ad55;">Icons</span><span class="fmt-tag" style="background:rgba(246,173,85,0.1);color:#f6ad55;">Favicon</span></div>
      </div>
      <div class="fmt-card c-cyan">
        <div class="fmt-card-top"><span class="fmt-emoji">🎨</span><span class="fmt-ext">.svg</span></div>
        <div class="fmt-name">SVG</div>
        <div class="fmt-desc">Scalable vector graphics. Perfect for logos and icons at any size.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(118,228,247,0.1);color:#76e4f7;">Vector</span><span class="fmt-tag" style="background:rgba(104,211,145,0.1);color:#68d391;">Scalable</span></div>
      </div>
    </div>
  </div>

  <!-- DOCUMENT FORMATS -->
  <div class="section">
    <div class="section-header">
      <span class="section-icon">📄</span>
      <span class="section-title">Document &amp; Data Formats</span>
      <span class="section-count">11 formats</span>
    </div>
    <div class="fmt-grid">
      <div class="fmt-card c-red">
        <div class="fmt-card-top"><span class="fmt-emoji">📕</span><span class="fmt-ext">.pdf</span></div>
        <div class="fmt-name">PDF</div>
        <div class="fmt-desc">Portable Document Format. Universal standard for sharing documents.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(252,129,129,0.1);color:#fc8181;">Universal</span><span class="fmt-tag" style="background:rgba(252,129,129,0.1);color:#fc8181;">Print</span></div>
      </div>
      <div class="fmt-card c-blue">
        <div class="fmt-card-top"><span class="fmt-emoji">📘</span><span class="fmt-ext">.docx</span></div>
        <div class="fmt-name">DOCX</div>
        <div class="fmt-desc">Microsoft Word document. Most used office format worldwide.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(99,179,237,0.1);color:#63b3ed;">MS Word</span><span class="fmt-tag" style="background:rgba(99,179,237,0.1);color:#63b3ed;">Office</span></div>
      </div>
      <div class="fmt-card c-green">
        <div class="fmt-card-top"><span class="fmt-emoji">📗</span><span class="fmt-ext">.xlsx</span></div>
        <div class="fmt-name">XLSX</div>
        <div class="fmt-desc">Microsoft Excel spreadsheet with formulas, charts and data.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(104,211,145,0.1);color:#68d391;">Excel</span><span class="fmt-tag" style="background:rgba(104,211,145,0.1);color:#68d391;">Spreadsheet</span></div>
      </div>
      <div class="fmt-card c-purple">
        <div class="fmt-card-top"><span class="fmt-emoji">📝</span><span class="fmt-ext">.txt</span></div>
        <div class="fmt-name">TXT</div>
        <div class="fmt-desc">Plain text file. Simple, universal, readable everywhere.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(183,148,244,0.1);color:#b794f4;">Plain</span><span class="fmt-tag" style="background:rgba(183,148,244,0.1);color:#b794f4;">Universal</span></div>
      </div>
      <div class="fmt-card c-green">
        <div class="fmt-card-top"><span class="fmt-emoji">📊</span><span class="fmt-ext">.csv</span></div>
        <div class="fmt-name">CSV</div>
        <div class="fmt-desc">Comma-separated values. Standard for tabular data exchange.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(104,211,145,0.1);color:#68d391;">Data</span><span class="fmt-tag" style="background:rgba(104,211,145,0.1);color:#68d391;">Tables</span></div>
      </div>
      <div class="fmt-card c-orange">
        <div class="fmt-card-top"><span class="fmt-emoji">🌍</span><span class="fmt-ext">.html</span></div>
        <div class="fmt-name">HTML</div>
        <div class="fmt-desc">HyperText Markup Language. The language of the web.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(246,173,85,0.1);color:#f6ad55;">Web</span><span class="fmt-tag" style="background:rgba(246,173,85,0.1);color:#f6ad55;">Markup</span></div>
      </div>
      <div class="fmt-card c-purple">
        <div class="fmt-card-top"><span class="fmt-emoji">📋</span><span class="fmt-ext">.md</span></div>
        <div class="fmt-name">Markdown</div>
        <div class="fmt-desc">Lightweight markup for README files, docs and blogs.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(183,148,244,0.1);color:#b794f4;">Docs</span><span class="fmt-tag" style="background:rgba(183,148,244,0.1);color:#b794f4;">GitHub</span></div>
      </div>
      <div class="fmt-card c-orange">
        <div class="fmt-card-top"><span class="fmt-emoji">🔧</span><span class="fmt-ext">.json</span></div>
        <div class="fmt-name">JSON</div>
        <div class="fmt-desc">JavaScript Object Notation. Standard API and config format.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(246,173,85,0.1);color:#f6ad55;">API</span><span class="fmt-tag" style="background:rgba(246,173,85,0.1);color:#f6ad55;">Config</span></div>
      </div>
      <div class="fmt-card c-orange">
        <div class="fmt-card-top"><span class="fmt-emoji">🔠</span><span class="fmt-ext">.xml</span></div>
        <div class="fmt-name">XML</div>
        <div class="fmt-desc">Extensible Markup Language. Widely used in enterprise systems.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(246,173,85,0.1);color:#f6ad55;">Data</span><span class="fmt-tag" style="background:rgba(246,173,85,0.1);color:#f6ad55;">Enterprise</span></div>
      </div>
      <div class="fmt-card c-purple">
        <div class="fmt-card-top"><span class="fmt-emoji">⚙️</span><span class="fmt-ext">.yaml</span></div>
        <div class="fmt-name">YAML</div>
        <div class="fmt-desc">Human-readable config format used in DevOps and CI/CD.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(183,148,244,0.1);color:#b794f4;">DevOps</span><span class="fmt-tag" style="background:rgba(183,148,244,0.1);color:#b794f4;">Config</span></div>
      </div>
      <div class="fmt-card c-blue">
        <div class="fmt-card-top"><span class="fmt-emoji">🗄️</span><span class="fmt-ext">.sql</span></div>
        <div class="fmt-name">SQL</div>
        <div class="fmt-desc">Structured Query Language scripts for databases.</div>
        <div class="fmt-tags"><span class="fmt-tag" style="background:rgba(99,179,237,0.1);color:#63b3ed;">Database</span><span class="fmt-tag" style="background:rgba(99,179,237,0.1);color:#63b3ed;">Queries</span></div>
      </div>
    </div>
  </div>

  <!-- PROGRAMMING -->
  <div class="section">
    <div class="section-header">
      <span class="section-icon">💻</span>
      <span class="section-title">Programming &amp; Script Formats</span>
      <span class="section-count">16 formats</span>
    </div>
    <div class="fmt-grid">
      <div class="fmt-card c-green"><div class="fmt-card-top"><span class="fmt-emoji">🐍</span><span class="fmt-ext">.py</span></div><div class="fmt-name">Python</div><div class="fmt-desc">The #1 language for AI, data science and automation.</div></div>
      <div class="fmt-card c-orange"><div class="fmt-card-top"><span class="fmt-emoji">☕</span><span class="fmt-ext">.java</span></div><div class="fmt-name">Java</div><div class="fmt-desc">Enterprise backend, Android development and more.</div></div>
      <div class="fmt-card c-yellow" style="--yc:rgba(246,224,94,0.12);"><div class="fmt-card-top"><span class="fmt-emoji">🟨</span><span class="fmt-ext">.js</span></div><div class="fmt-name">JavaScript</div><div class="fmt-desc">The language of the web. Runs in every browser.</div></div>
      <div class="fmt-card c-blue"><div class="fmt-card-top"><span class="fmt-emoji">🔷</span><span class="fmt-ext">.ts</span></div><div class="fmt-name">TypeScript</div><div class="fmt-desc">JavaScript with types. Safer and more scalable.</div></div>
      <div class="fmt-card c-cyan"><div class="fmt-card-top"><span class="fmt-emoji">⚡</span><span class="fmt-ext">.cpp</span></div><div class="fmt-name">C++</div><div class="fmt-desc">High performance. Used in games, systems and engines.</div></div>
      <div class="fmt-card c-blue"><div class="fmt-card-top"><span class="fmt-emoji">🔵</span><span class="fmt-ext">.c</span></div><div class="fmt-name">C</div><div class="fmt-desc">The foundation of modern computing and OS development.</div></div>
      <div class="fmt-card c-purple"><div class="fmt-card-top"><span class="fmt-emoji">🟣</span><span class="fmt-ext">.cs</span></div><div class="fmt-name">C#</div><div class="fmt-desc">Microsoft's language for .NET and Unity game dev.</div></div>
      <div class="fmt-card c-purple"><div class="fmt-card-top"><span class="fmt-emoji">🐘</span><span class="fmt-ext">.php</span></div><div class="fmt-name">PHP</div><div class="fmt-desc">Powers 80% of the web including WordPress.</div></div>
      <div class="fmt-card c-red"><div class="fmt-card-top"><span class="fmt-emoji">💎</span><span class="fmt-ext">.rb</span></div><div class="fmt-name">Ruby</div><div class="fmt-desc">Elegant scripting language. Ruby on Rails framework.</div></div>
      <div class="fmt-card c-cyan"><div class="fmt-card-top"><span class="fmt-emoji">🐹</span><span class="fmt-ext">.go</span></div><div class="fmt-name">Go</div><div class="fmt-desc">Google's fast, concurrent language for cloud backends.</div></div>
      <div class="fmt-card c-orange"><div class="fmt-card-top"><span class="fmt-emoji">🦀</span><span class="fmt-ext">.rs</span></div><div class="fmt-name">Rust</div><div class="fmt-desc">Memory-safe systems programming. Fastest growing language.</div></div>
      <div class="fmt-card c-purple"><div class="fmt-card-top"><span class="fmt-emoji">🎯</span><span class="fmt-ext">.kt</span></div><div class="fmt-name">Kotlin</div><div class="fmt-desc">Modern Android development. Official Google language.</div></div>
      <div class="fmt-card c-orange"><div class="fmt-card-top"><span class="fmt-emoji">🍎</span><span class="fmt-ext">.swift</span></div><div class="fmt-name">Swift</div><div class="fmt-desc">Apple's language for iOS and macOS apps.</div></div>
      <div class="fmt-card c-green"><div class="fmt-card-top"><span class="fmt-emoji">🖥️</span><span class="fmt-ext">.sh</span></div><div class="fmt-name">Shell</div><div class="fmt-desc">Unix shell scripts for automation and DevOps.</div></div>
      <div class="fmt-card c-blue"><div class="fmt-card-top"><span class="fmt-emoji">📈</span><span class="fmt-ext">.r</span></div><div class="fmt-name">R</div><div class="fmt-desc">Statistical computing and data visualization.</div></div>
      <div class="fmt-card c-red"><div class="fmt-card-top"><span class="fmt-emoji">🔴</span><span class="fmt-ext">.scala</span></div><div class="fmt-name">Scala</div><div class="fmt-desc">JVM language for big data and functional programming.</div></div>
    </div>
  </div>

  <div class="cta-bar">
    <h2>Ready to Convert?</h2>
    <p>Upload any file and convert it to your desired format in seconds — completely free.</p>
    <a href="upload.jsp" class="cta-btn">⚡ Start Converting Now →</a>
  </div>

</div>

<footer class="footer">
    <div class="footer-text"><h3>© 2026 <span>NaraConvert</span> by Nara — All rights reserved</h3></div>
</footer>
 
<div class="fn-dev">
    <a href="about.jsp" class="fn-dev-badge">
        <div class="fn-dev-avatar">N</div>
        <div class="fn-dev-info">
            <span class="fn-dev-label">Designed &amp; Developed by</span>
            <span class="fn-dev-name">Narayan Prasad Maurya</span>
            <div class="fn-dev-stack">
                <span class="fn-stack-item">Java</span>
                <div class="fn-dev-dot"></div>
                <span class="fn-stack-item">JSP</span>
                <div class="fn-dev-dot"></div>
                <span class="fn-stack-item">MySQL</span>
                <div class="fn-dev-dot"></div>
                <span class="fn-stack-item">Tomcat</span>
            </div>
        </div>
    </a>
</div>
    
</body>
</html>
