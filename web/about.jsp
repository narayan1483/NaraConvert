<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NaraConvert – About Narayan Prasad Maurya</title>
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&family=Space+Mono:wght@400;700&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{margin:0;padding:0;box-sizing:border-box;}
:root{
  --bg:#060d1a;--bg2:rgba(255,255,255,0.04);--border:rgba(255,255,255,0.08);
  --accent:#63b3ed;--accent2:#76e4f7;--accent3:#b794f4;
  --green:#68d391;--orange:#f6ad55;--red:#fc8181;
  --text1:#f0f6fc;--text2:#8b949e;--text3:#484f58;
}
html,body{min-height:100%;}
body{font-family:'Outfit',sans-serif;background:var(--bg);color:var(--text1);overflow-x:hidden;}

/* Background */
body::before{content:'';position:fixed;inset:0;z-index:0;pointer-events:none;
  background:
    radial-gradient(ellipse 80% 60% at 15% 20%,rgba(99,179,237,0.07) 0%,transparent 55%),
    radial-gradient(ellipse 60% 50% at 85% 75%,rgba(183,148,244,0.07) 0%,transparent 55%),
    radial-gradient(ellipse 40% 40% at 50% 50%,rgba(118,228,247,0.03) 0%,transparent 60%);}
body::after{content:'';position:fixed;inset:0;z-index:0;pointer-events:none;
  background-image:linear-gradient(rgba(255,255,255,0.013) 1px,transparent 1px),
                   linear-gradient(90deg,rgba(255,255,255,0.013) 1px,transparent 1px);
  background-size:48px 48px;}

/* ── NAVBAR ── */
.navbar{position:sticky;top:0;z-index:100;display:flex;align-items:center;justify-content:space-between;
  padding:0 52px;height:66px;background:rgba(6,13,26,0.9);backdrop-filter:blur(24px);
  border-bottom:1px solid var(--border);}
.nav-logo{font-family:'Space Mono',monospace;font-size:20px;font-weight:700;
  background:linear-gradient(135deg,var(--accent),var(--accent2));
  -webkit-background-clip:text;-webkit-text-fill-color:transparent;text-decoration:none;}
.nav-links{display:flex;gap:30px;list-style:none;}
.nav-links a{color:var(--text2);font-size:14px;font-weight:500;text-decoration:none;transition:color 0.2s;}
.nav-links a:hover{color:var(--text1);}
.nav-links a.active{color:var(--accent);}
.nav-cta{background:linear-gradient(135deg,var(--accent),var(--accent2));color:#060d1a;
  padding:9px 22px;border-radius:9px;font-size:13px;font-weight:700;
  text-decoration:none;transition:all 0.25s;box-shadow:0 0 20px rgba(99,179,237,0.15);}
.nav-cta:hover{transform:translateY(-1px);box-shadow:0 0 32px rgba(99,179,237,0.3);}

/* ── PAGE ── */
.page{position:relative;z-index:1;max-width:1140px;margin:0 auto;padding:72px 52px 80px;}

/* ══════════════════════════════════════
   HERO — Profile + Skills
══════════════════════════════════════ */
.hero-grid{display:grid;grid-template-columns:1.1fr 0.9fr;gap:72px;align-items:start;margin-bottom:96px;}

/* Left: Profile */
.profile-col{}

.avatar-section{display:flex;align-items:center;gap:28px;margin-bottom:32px;}

.avatar-box{position:relative;flex-shrink:0;}
.avatar{width:110px;height:110px;border-radius:28px;
  background:linear-gradient(135deg,#1a3a5c,#2d5986);
  display:flex;align-items:center;justify-content:center;font-size:48px;
  position:relative;z-index:1;
  box-shadow:0 0 0 1px rgba(99,179,237,0.15), 0 16px 48px rgba(0,0,0,0.4);}
.avatar-glow{position:absolute;inset:-12px;border-radius:40px;
  background:linear-gradient(135deg,rgba(99,179,237,0.15),rgba(183,148,244,0.1));
  filter:blur(16px);z-index:0;animation:glowPulse 4s ease-in-out infinite;}
@keyframes glowPulse{0%,100%{opacity:0.5;}50%{opacity:1;}}


.avatar-photo{width:110px;height:110px;border-radius:28px;object-fit:cover;
  position:relative;z-index:1;
  box-shadow:0 0 0 3px rgba(99,179,237,0.25), 0 16px 48px rgba(0,0,0,0.5);}

.avatar-online{position:absolute;bottom:6px;right:6px;
  width:18px;height:18px;border-radius:50%;background:var(--green);
  border:3px solid var(--bg);z-index:2;animation:blink 2s infinite;}
@keyframes blink{0%,100%{box-shadow:0 0 0 0 rgba(104,211,145,0.4);}70%{box-shadow:0 0 0 8px rgba(104,211,145,0);}}

.avatar-info{}
.avatar-name{font-size:13px;font-weight:700;color:var(--text3);
  letter-spacing:2px;text-transform:uppercase;margin-bottom:6px;}
.avatar-role{display:inline-flex;align-items:center;gap:6px;
  background:rgba(99,179,237,0.08);border:1px solid rgba(99,179,237,0.2);
  color:var(--accent);font-size:11px;font-weight:700;
  padding:5px 12px;border-radius:20px;letter-spacing:0.5px;}
.role-dot{width:5px;height:5px;background:var(--accent);border-radius:50%;animation:blink 2s infinite;}

.dev-name{font-size:clamp(36px,4.5vw,54px);font-weight:900;letter-spacing:-2.5px;
  line-height:1.0;margin-bottom:14px;}
.dev-name .first{color:var(--text1);}
.dev-name .last{background:linear-gradient(135deg,var(--accent) 0%,var(--accent2) 50%,var(--accent3) 100%);
  -webkit-background-clip:text;-webkit-text-fill-color:transparent;}

.dev-tagline{font-size:15px;color:var(--text2);line-height:1.75;margin-bottom:28px;max-width:440px;}

/* Info chips */
.info-chips{display:flex;flex-wrap:wrap;gap:10px;margin-bottom:28px;}
.chip{display:inline-flex;align-items:center;gap:7px;
  background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);
  color:var(--text2);font-size:12px;font-weight:600;
  padding:7px 14px;border-radius:8px;}
.chip-icon{font-size:14px;}

/* Social links */
.social-row{display:flex;gap:10px;flex-wrap:wrap;}
.slink{display:inline-flex;align-items:center;gap:7px;
  background:var(--bg2);border:1px solid var(--border);
  color:var(--text2);font-size:13px;font-weight:600;
  padding:10px 18px;border-radius:10px;text-decoration:none;transition:all 0.22s;}
.slink:hover{border-color:var(--accent);color:var(--accent);background:rgba(99,179,237,0.06);transform:translateY(-2px);}
.slink.primary{background:rgba(99,179,237,0.08);border-color:rgba(99,179,237,0.3);color:var(--accent);}
.slink.primary:hover{background:rgba(99,179,237,0.15);}

/* Right: Skills */
.skills-col{}
.skills-heading{font-size:13px;font-weight:700;color:var(--text3);
  letter-spacing:2.5px;text-transform:uppercase;margin-bottom:24px;}

.skill-item{margin-bottom:20px;}
.skill-row{display:flex;justify-content:space-between;align-items:center;margin-bottom:7px;}
.skill-left{display:flex;align-items:center;gap:9px;}
.skill-emoji{font-size:15px;}
.skill-label{font-size:14px;font-weight:700;color:var(--text1);}
.skill-sub{font-size:11px;color:var(--text3);margin-top:1px;}
.skill-pct{font-family:'Space Mono',monospace;font-size:12px;font-weight:700;color:var(--text3);}
.skill-track{height:6px;background:rgba(255,255,255,0.05);border-radius:10px;overflow:hidden;position:relative;}
.skill-fill{height:100%;border-radius:10px;width:0%;transition:width 1.4s cubic-bezier(0.05,0.85,0.3,1);}
.fill-java  {background:linear-gradient(90deg,#f6ad55,#fbd38d);}
.fill-jsp   {background:linear-gradient(90deg,#63b3ed,#76e4f7);}
.fill-db    {background:linear-gradient(90deg,#68d391,#9ae6b4);}
.fill-js    {background:linear-gradient(90deg,#f6e05e,#faf089);}
.fill-ui    {background:linear-gradient(90deg,#b794f4,#d6bcfa);}
.fill-tools {background:linear-gradient(90deg,#fc8181,#feb2b2);}

/* Tech stack badges */
.tech-stack{margin-top:28px;}
.tech-stack-title{font-size:11px;font-weight:700;color:var(--text3);
  letter-spacing:2px;text-transform:uppercase;margin-bottom:12px;}
.tech-badges{display:flex;flex-wrap:wrap;gap:7px;}
.tbadge{font-size:11px;font-family:'Space Mono',monospace;font-weight:700;
  padding:5px 10px;border-radius:6px;border:1px solid;}

/* ══════════════════════════════════════
   PROJECT SECTION
══════════════════════════════════════ */
.sec-eyebrow{font-size:11px;font-weight:700;color:var(--text3);
  letter-spacing:3px;text-transform:uppercase;margin-bottom:10px;}
.sec-heading{font-size:clamp(28px,4vw,40px);font-weight:900;letter-spacing:-1.5px;margin-bottom:36px;}
.sec-heading span{background:linear-gradient(135deg,var(--accent),var(--accent2));
  -webkit-background-clip:text;-webkit-text-fill-color:transparent;}

/* Project card */
.project-card{background:var(--bg2);border:1px solid var(--border);border-radius:22px;
  padding:44px;margin-bottom:28px;position:relative;overflow:hidden;transition:all 0.3s;}
.project-card::before{content:'';position:absolute;top:0;left:0;right:0;height:3px;
  background:linear-gradient(90deg,var(--accent),var(--accent2),var(--accent3));}
.project-card:hover{border-color:rgba(99,179,237,0.2);box-shadow:0 16px 60px rgba(0,0,0,0.35);}

.pc-top{display:flex;align-items:center;justify-content:space-between;margin-bottom:20px;flex-wrap:wrap;gap:12px;}
.pc-logo{display:flex;align-items:center;gap:14px;}
.pc-logo-icon{font-size:44px;}
.pc-logo-text{}
.pc-logo-name{font-size:26px;font-weight:900;letter-spacing:-1px;}
.pc-logo-sub{font-size:13px;color:var(--text2);margin-top:2px;}
.pc-status-badges{display:flex;gap:8px;flex-wrap:wrap;}
.sbadge{font-size:11px;font-family:'Space Mono',monospace;font-weight:700;
  padding:5px 12px;border-radius:20px;border:1px solid;}
.sb-live{background:rgba(104,211,145,0.1);border-color:rgba(104,211,145,0.3);color:#68d391;}
.sb-java{background:rgba(246,173,85,0.1);border-color:rgba(246,173,85,0.3);color:#f6ad55;}
.sb-jsp{background:rgba(99,179,237,0.1);border-color:rgba(99,179,237,0.3);color:#63b3ed;}
.sb-db{background:rgba(183,148,244,0.1);border-color:rgba(183,148,244,0.3);color:#b794f4;}

.pc-desc{font-size:15px;color:var(--text2);line-height:1.8;margin-bottom:28px;}

/* Feature grid */
.feat-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(190px,1fr));gap:10px;margin-bottom:28px;}
.feat-item{display:flex;align-items:center;gap:9px;
  background:rgba(255,255,255,0.025);border:1px solid var(--border);
  border-radius:10px;padding:11px 14px;font-size:13px;font-weight:600;color:var(--text2);
  transition:all 0.2s;}
.feat-item:hover{border-color:rgba(99,179,237,0.2);color:var(--text1);}
.fi{font-size:16px;}

.pc-tech{display:flex;gap:7px;flex-wrap:wrap;}
.ptag{font-size:11px;font-family:'Space Mono',monospace;font-weight:700;
  background:rgba(255,255,255,0.04);border:1px solid rgba(255,255,255,0.07);
  color:var(--text3);padding:4px 10px;border-radius:6px;}

/* ══════════════════════════════════════
   STATS
══════════════════════════════════════ */
.stats-row{display:grid;grid-template-columns:repeat(4,1fr);gap:16px;margin-bottom:80px;}
.stat-box{background:var(--bg2);border:1px solid var(--border);border-radius:16px;
  padding:28px 20px;text-align:center;transition:all 0.25s;}
.stat-box:hover{border-color:rgba(99,179,237,0.2);transform:translateY(-4px);box-shadow:0 12px 40px rgba(0,0,0,0.3);}
.stat-val{font-size:42px;font-weight:900;letter-spacing:-2px;
  background:linear-gradient(135deg,var(--accent),var(--accent2));
  -webkit-background-clip:text;-webkit-text-fill-color:transparent;line-height:1;}
.stat-lbl{font-size:11px;color:var(--text3);text-transform:uppercase;letter-spacing:2px;margin-top:8px;}

/* ══════════════════════════════════════
   TIMELINE
══════════════════════════════════════ */
.timeline{margin-bottom:80px;}
.tl-list{display:flex;flex-direction:column;gap:0;}
.tl-item{display:flex;gap:20px;position:relative;}
.tl-item:not(:last-child){padding-bottom:36px;}
.tl-item:not(:last-child)::after{content:'';position:absolute;left:19px;top:44px;
  bottom:0;width:1px;background:linear-gradient(to bottom,var(--border),transparent);}

.tl-dot{width:40px;height:40px;border-radius:50%;display:flex;align-items:center;
  justify-content:center;font-size:16px;flex-shrink:0;border:1.5px solid;position:relative;z-index:1;}
.d1{background:rgba(99,179,237,0.1);border-color:rgba(99,179,237,0.3);}
.d2{background:rgba(246,173,85,0.1);border-color:rgba(246,173,85,0.3);}
.d3{background:rgba(183,148,244,0.1);border-color:rgba(183,148,244,0.3);}
.d4{background:rgba(104,211,145,0.1);border-color:rgba(104,211,145,0.3);}

.tl-body{padding-top:8px;}
.tl-phase{font-size:10px;font-weight:700;color:var(--text3);letter-spacing:2px;text-transform:uppercase;margin-bottom:4px;}
.tl-title{font-size:18px;font-weight:800;letter-spacing:-0.5px;margin-bottom:6px;}
.tl-desc{font-size:13px;color:var(--text2);line-height:1.6;}

/* ══════════════════════════════════════
   CTA
══════════════════════════════════════ */
.cta-section{background:linear-gradient(135deg,rgba(99,179,237,0.07),rgba(183,148,244,0.07));
  border:1px solid rgba(99,179,237,0.15);border-radius:22px;
  padding:60px 48px;text-align:center;position:relative;overflow:hidden;}
.cta-section::before{content:'';position:absolute;top:-60px;right:-60px;
  width:240px;height:240px;border-radius:50%;
  background:radial-gradient(circle,rgba(99,179,237,0.08) 0%,transparent 70%);}
.cta-section::after{content:'';position:absolute;bottom:-60px;left:-60px;
  width:200px;height:200px;border-radius:50%;
  background:radial-gradient(circle,rgba(183,148,244,0.08) 0%,transparent 70%);}
.cta-title{font-size:36px;font-weight:900;letter-spacing:-1.5px;margin-bottom:12px;position:relative;z-index:1;}
.cta-sub{font-size:15px;color:var(--text2);margin-bottom:32px;position:relative;z-index:1;}
.cta-btns{display:flex;gap:14px;justify-content:center;flex-wrap:wrap;position:relative;z-index:1;}
.btn-a{display:inline-flex;align-items:center;gap:8px;
  background:linear-gradient(135deg,var(--accent),var(--accent2));
  color:#060d1a;padding:15px 34px;border-radius:11px;font-size:15px;font-weight:800;
  text-decoration:none;transition:all 0.3s;box-shadow:0 0 32px rgba(99,179,237,0.2);}
.btn-a:hover{transform:translateY(-2px);box-shadow:0 0 48px rgba(99,179,237,0.4);}
.btn-b{display:inline-flex;align-items:center;gap:8px;
  background:transparent;color:var(--text2);padding:15px 34px;border-radius:11px;
  font-size:15px;font-weight:600;text-decoration:none;border:1px solid var(--border);transition:all 0.3s;}
.btn-b:hover{border-color:var(--accent);color:var(--text1);}


/* ── CONTACT CARDS ── */
.contact-card{display:flex;align-items:center;gap:16px;
  background:var(--bg2);border:1px solid var(--border);border-radius:16px;
  padding:22px 24px;text-decoration:none;transition:all 0.25s;position:relative;overflow:hidden;}
.contact-card::before{content:'';position:absolute;top:0;left:0;right:0;height:2px;
  background:var(--cc);opacity:0;transition:opacity 0.3s;}
.contact-card:hover{border-color:var(--cc);transform:translateY(-3px);
  box-shadow:0 12px 40px rgba(0,0,0,0.3);}
.contact-card:hover::before{opacity:1;}
.cc-icon{font-size:28px;width:52px;height:52px;border-radius:14px;
  background:rgba(255,255,255,0.04);border:1px solid var(--border);
  display:flex;align-items:center;justify-content:center;flex-shrink:0;}
.cc-content{flex:1;min-width:0;}
.cc-label{font-size:10px;font-weight:700;color:var(--text3);letter-spacing:2px;text-transform:uppercase;margin-bottom:3px;}
.cc-value{font-size:14px;font-weight:700;color:var(--text1);font-family:'Space Mono',monospace;
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.cc-sub{font-size:12px;color:var(--text2);margin-top:2px;}
.cc-arrow{font-size:18px;color:var(--text3);transition:all 0.2s;flex-shrink:0;}
.contact-card:hover .cc-arrow{color:var(--cc);transform:translateX(4px);}

/* FOOTER */
.footer{position:relative;z-index:1;padding:22px 52px;border-top:1px solid var(--border);
  display:flex;justify-content:space-between;align-items:center;}
.footer-left{font-size:12px;color:var(--text3);}
.footer-left span{color:var(--accent);font-weight:600;}
.footer-right{font-size:12px;color:var(--text3);}

@keyframes fadeUp{from{opacity:0;transform:translateY(24px);}to{opacity:1;transform:translateY(0);}}
.fade-up{animation:fadeUp 0.7s ease both;}
.delay-1{animation-delay:0.1s;}
.delay-2{animation-delay:0.2s;}
.delay-3{animation-delay:0.3s;}

@media(max-width:960px){.hero-grid{grid-template-columns:1fr;gap:48px;}.stats-row{grid-template-columns:repeat(2,1fr);}}
@media(max-width:640px){.page{padding:40px 20px;}.navbar{padding:0 20px;}.nav-links{display:none;}.cta-section{padding:40px 24px;}}

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
    <li><a href="formats.jsp">Formats</a></li>
    <li><a href="about.jsp" class="active">About</a></li>
  </ul>
  <a href="upload.jsp" class="nav-cta">⚡ Convert Now</a>
</nav>

<div class="page">

  <!-- ══ HERO ══ -->
  <div class="hero-grid">

    <!-- Left: Profile -->
    <div class="profile-col fade-up">

      <div class="avatar-section">
        <div class="avatar-box">
          <div class="avatar-glow"></div>
          <img src="images/narayan.jpg" alt="Narayan Prasad Maurya" class="avatar-photo" onerror="this.style.display='none';document.getElementById('avatarFallback').style.display='flex'">
          <div class="avatar" id="avatarFallback" style="display:none;font-size:28px;font-weight:900;letter-spacing:-1px;font-family:'Space Mono',monospace;">NP</div>
          <div class="avatar-online"></div>
        </div>
        <div class="avatar-info">
          <div class="avatar-name">Developer</div>
          <div class="avatar-role"><span class="role-dot"></span>Open to work &amp; projects</div>
        </div>
      </div>

      <div class="dev-name">
        <span class="first">Narayan<br>Prasad<br></span>
        <span class="last">Maurya</span>
      </div>

      <p class="dev-tagline">
        Full Stack Engineer &amp; Game Developer passionate about building real-world applications.
        Creator of <strong style="color:var(--accent)">NaraConvert</strong> —
        a universal file converter handling 35+ formats completely free.
        Expert in <strong style="color:var(--accent2)">Java · Node.js · React · Express.js</strong>,
        with hands-on experience in
        <strong style="color:var(--accent3)">AI/ML</strong> and
        <strong style="color:#68d391">Game Development</strong>.
        I turn ideas into clean, working solutions.
      </p>

      <div class="info-chips">
        <div class="chip"><span class="chip-icon">📍</span>India</div>
        <div class="chip"><span class="chip-icon">☕</span>Java Developer</div>
        <div class="chip"><span class="chip-icon">🎓</span>Computer Science</div>
        <div class="chip"><span class="chip-icon">🚀</span>Full Stack</div>
      </div>

      <div class="social-row">
        <a href="upload.jsp" class="slink primary">⚡ Try NaraConvert</a>
        <a href="https://github.com/narayan1483" target="_blank" class="slink">🐙 GitHub</a>
        <a href="mailto:mauryanarayan649@gmail.com" class="slink">📧 Gmail</a>
        <a href="tel:+919517339347" class="slink">📞 Call</a>
      </div>

    </div>

    <!-- Right: Skills -->
    <div class="skills-col fade-up delay-1">
      <div class="skills-heading">Tech Stack &amp; Skills</div>

      <div class="skill-item">
        <div class="skill-row">
          <div class="skill-left">
            <span class="skill-emoji">☕</span>
            <div><div class="skill-label">Java</div><div class="skill-sub">Core Java, OOP, Collections</div></div>
          </div>
          <span class="skill-pct">90%</span>
        </div>
        <div class="skill-track"><div class="skill-fill fill-java" data-w="90"></div></div>
      </div>

      <div class="skill-item">
        <div class="skill-row">
          <div class="skill-left">
            <span class="skill-emoji">🌐</span>
            <div><div class="skill-label">JSP &amp; Servlets</div><div class="skill-sub">Jakarta EE, MVC Pattern</div></div>
          </div>
          <span class="skill-pct">88%</span>
        </div>
        <div class="skill-track"><div class="skill-fill fill-jsp" data-w="88"></div></div>
      </div>

      <div class="skill-item">
        <div class="skill-row">
          <div class="skill-left">
            <span class="skill-emoji">🗄️</span>
            <div><div class="skill-label">MySQL &amp; JDBC</div><div class="skill-sub">Database Design, SQL Queries</div></div>
          </div>
          <span class="skill-pct">83%</span>
        </div>
        <div class="skill-track"><div class="skill-fill fill-db" data-w="83"></div></div>
      </div>

      <div class="skill-item">
        <div class="skill-row">
          <div class="skill-left">
            <span class="skill-emoji">🟨</span>
            <div><div class="skill-label">JavaScript</div><div class="skill-sub">DOM, Events, Animations</div></div>
          </div>
          <span class="skill-pct">76%</span>
        </div>
        <div class="skill-track"><div class="skill-fill fill-js" data-w="76"></div></div>
      </div>

      <div class="skill-item">
        <div class="skill-row">
          <div class="skill-left">
            <span class="skill-emoji">🎨</span>
            <div><div class="skill-label">HTML &amp; CSS</div><div class="skill-sub">Responsive, Animations, Flex/Grid</div></div>
          </div>
          <span class="skill-pct">84%</span>
        </div>
        <div class="skill-track"><div class="skill-fill fill-ui" data-w="84"></div></div>
      </div>

      <div class="skill-item">
        <div class="skill-row">
          <div class="skill-left">
            <span class="skill-emoji">🔧</span>
            <div><div class="skill-label">Tools &amp; IDE</div><div class="skill-sub">NetBeans, Git, Tomcat, Maven</div></div>
          </div>
          <span class="skill-pct">78%</span>
        </div>
        <div class="skill-track"><div class="skill-fill fill-tools" data-w="78"></div></div>
      </div>

      <div class="tech-stack">
        <div class="tech-stack-title">Currently Using</div>
        <div class="tech-badges">
          <span class="tbadge" style="background:rgba(246,173,85,0.08);border-color:rgba(246,173,85,0.25);color:#f6ad55;">Java 21</span>
          <span class="tbadge" style="background:rgba(99,179,237,0.08);border-color:rgba(99,179,237,0.25);color:#63b3ed;">Apache Tomcat</span>
          <span class="tbadge" style="background:rgba(104,211,145,0.08);border-color:rgba(104,211,145,0.25);color:#68d391;">MySQL 9.5</span>
          <span class="tbadge" style="background:rgba(183,148,244,0.08);border-color:rgba(183,148,244,0.25);color:#b794f4;">NetBeans 28</span>
          <span class="tbadge" style="background:rgba(118,228,247,0.08);border-color:rgba(118,228,247,0.25);color:#76e4f7;">Jakarta EE</span>
          <span class="tbadge" style="background:rgba(246,224,94,0.08);border-color:rgba(246,224,94,0.25);color:#f6e05e;">Git</span>
        </div>
      </div>
    </div>
  </div>

  <!-- ══ PROJECT ══ -->
  <div style="margin-bottom:72px;" class="fade-up delay-2">
    <div class="sec-eyebrow">Featured Project</div>
    <div class="sec-heading">Built with <span>Hard Work &amp; Code</span></div>

    <div class="project-card">
      <div class="pc-top">
        <div class="pc-logo">
          <span class="pc-logo-icon">⚡</span>
          <div class="pc-logo-text">
            <div class="pc-logo-name">NaraConvert</div>
            <div class="pc-logo-sub">Universal File Converter — by Narayan Prasad Maurya</div>
          </div>
        </div>
        <div class="pc-status-badges">
          <span class="sbadge sb-live">● Live</span>
          <span class="sbadge sb-java">Java 21</span>
          <span class="sbadge sb-jsp">JSP</span>
          <span class="sbadge sb-db">MySQL</span>
        </div>
      </div>

      <p class="pc-desc">
        A full-stack web application built entirely from scratch using Java Servlets, JSP, JDBC and MySQL.
        NaraConvert handles 35+ file formats — images, Word documents, Excel spreadsheets,
        presentations, code files and data formats — all with a single upload.
        No registration, no payments, no limits. Pure conversion power built with pure Java.
      </p>

      <div class="feat-grid">
        <div class="feat-item"><span class="fi">🖼️</span>8 Image Formats</div>
        <div class="feat-item"><span class="fi">📄</span>11 Document Formats</div>
        <div class="feat-item"><span class="fi">💻</span>16 Code Formats</div>
        <div class="feat-item"><span class="fi">🖱️</span>Drag &amp; Drop Upload</div>
        <div class="feat-item"><span class="fi">⚡</span>Instant Conversion</div>
        <div class="feat-item"><span class="fi">📥</span>One-Click Download</div>
        <div class="feat-item"><span class="fi">🔍</span>Smart Format Filter</div>
        <div class="feat-item"><span class="fi">🗄️</span>MySQL File Logging</div>
        <div class="feat-item"><span class="fi">📱</span>Fully Responsive</div>
        <div class="feat-item"><span class="fi">🔒</span>Secure Processing</div>
        <div class="feat-item"><span class="fi">💡</span>Syntax Highlighting</div>
        <div class="feat-item"><span class="fi">🎨</span>Dark Theme UI</div>
      </div>

      <div class="pc-tech">
        <span class="ptag">Java 21</span><span class="ptag">JSP 4.0</span>
        <span class="ptag">Jakarta Servlet</span><span class="ptag">Apache Tomcat</span>
        <span class="ptag">MySQL 9.5</span><span class="ptag">JDBC</span>
        <span class="ptag">Java ImageIO</span><span class="ptag">CSS3 Animations</span>
        <span class="ptag">Vanilla JS</span><span class="ptag">NetBeans IDE 28</span>
        <span class="ptag">MVC Pattern</span><span class="ptag">DAO Layer</span>
      </div>
    </div>
  </div>

  <!-- ══ STATS ══ -->
  <div class="stats-row fade-up delay-2">
    <div class="stat-box"><div class="stat-val" data-target="35">0+</div><div class="stat-lbl">Formats Supported</div></div>
    <div class="stat-box"><div class="stat-val" data-target="100">0%</div><div class="stat-lbl">Free Forever</div></div>
    <div class="stat-box"><div class="stat-val" data-target="0" data-suf="">0</div><div class="stat-lbl">Registration Needed</div></div>
    <div class="stat-box"><div class="stat-val">3s</div><div class="stat-lbl">Avg Conversion Time</div></div>
  </div>

  <!-- ══ TIMELINE ══ -->
  <div class="timeline fade-up delay-3">
    <div class="sec-eyebrow">Development Journey</div>
    <div class="sec-heading" style="margin-bottom:36px;">How NaraConvert was <span>Built</span></div>

    <div class="tl-list">
      <div class="tl-item">
        <div class="tl-dot d1">💡</div>
        <div class="tl-body">
          <div class="tl-phase">Phase 1 — Concept</div>
          <div class="tl-title">Idea &amp; Architecture Planning</div>
          <div class="tl-desc">Designed the complete MVC architecture — Controller (Servlets), View (JSP), Model + DAO, and MySQL schema. Chose Apache Tomcat as the server.</div>
        </div>
      </div>
      <div class="tl-item">
        <div class="tl-dot d2">⚙️</div>
        <div class="tl-body">
          <div class="tl-phase">Phase 2 — Backend</div>
          <div class="tl-title">Java Conversion Engine</div>
          <div class="tl-desc">Built UploadServlet for file handling, ConvertService using Java ImageIO for image conversion, DownloadServlet for streaming, and FileDAO with JDBC for MySQL integration.</div>
        </div>
      </div>
      <div class="tl-item">
        <div class="tl-dot d3">🎨</div>
        <div class="tl-body">
          <div class="tl-phase">Phase 3 — Frontend</div>
          <div class="tl-title">UI Design &amp; Animations</div>
          <div class="tl-desc">Designed dark glassmorphism theme, drag-and-drop upload zone, animated format selector with 35+ chips, 3-step progress bar, and fully responsive layout.</div>
        </div>
      </div>
      <div class="tl-item">
        <div class="tl-dot d4">🚀</div>
        <div class="tl-body">
          <div class="tl-phase">Phase 4 — Launch</div>
          <div class="tl-title">35+ Formats &amp; Deployment</div>
          <div class="tl-desc">Expanded support to DOCX, XLSX, PPTX, 16 code languages, JSON, XML, YAML and more. Added syntax highlighting for code-to-HTML conversion. NaraConvert goes live!</div>
        </div>
      </div>
    </div>
  </div>

  <!-- ══ CONTACT ══ -->
  <div style="margin-bottom:60px;" class="fade-up delay-3">
    <div class="sec-eyebrow">Get In Touch</div>
    <div class="sec-heading">Let's <span>Connect</span></div>

    <div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(260px,1fr));gap:16px;">

      <a href="https://github.com/narayan1483" target="_blank" class="contact-card" style="--cc:#63b3ed;">
        <div class="cc-icon">🐙</div>
        <div class="cc-content">
          <div class="cc-label">GitHub</div>
          <div class="cc-value">github.com/narayan1483</div>
          <div class="cc-sub">Open source projects &amp; code</div>
        </div>
        <div class="cc-arrow">→</div>
      </a>

      <a href="mailto:mauryanarayan649@gmail.com" class="contact-card" style="--cc:#fc8181;">
        <div class="cc-icon">📧</div>
        <div class="cc-content">
          <div class="cc-label">Gmail</div>
          <div class="cc-value">mauryanarayan649@gmail.com</div>
          <div class="cc-sub">Email me anytime</div>
        </div>
        <div class="cc-arrow">→</div>
      </a>

      <a href="tel:+919517339347" class="contact-card" style="--cc:#68d391;">
        <div class="cc-icon">📞</div>
        <div class="cc-content">
          <div class="cc-label">Phone / WhatsApp</div>
          <div class="cc-value">+91 9517339347</div>
          <div class="cc-sub">Available Mon–Sat, 9am–8pm</div>
        </div>
        <div class="cc-arrow">→</div>
      </a>

    </div>
  </div>

  <!-- ══ CTA ══ -->
  <div class="cta-section">
    <div class="cta-title">Ready to Convert?</div>
    <p class="cta-sub">Upload any file and convert it instantly — completely free.<br>Built with ❤️ by <strong style="color:var(--accent)">Narayan Prasad Maurya</strong></p>
    <div class="cta-btns">
      <a href="upload.jsp" class="btn-a">⚡ Start Converting Now</a>
      <a href="formats.jsp" class="btn-b">📋 See All 35+ Formats</a>
    </div>
  </div>

</div><!-- /page -->

<footer class="footer">
  <div class="footer-left">© 2026 <span>NaraConvert</span> — Built by <span>Narayan Prasad Maurya</span> with Java &amp; ❤️</div>
  <div class="footer-right" style="color:var(--text3);font-size:11px;">Java · JSP · MySQL · Apache Tomcat</div>
</footer>

<script>
// Skill bars animate on scroll
const skillObs = new IntersectionObserver(entries => {
  entries.forEach(e => {
    if (e.isIntersecting) {
      e.target.querySelectorAll('.skill-fill[data-w]').forEach(bar => {
        setTimeout(() => { bar.style.width = bar.dataset.w + '%'; }, 100);
      });
      skillObs.unobserve(e.target);
    }
  });
}, { threshold: 0.2 });
document.querySelectorAll('.skills-col').forEach(c => skillObs.observe(c));

// Stat counters
document.querySelectorAll('.stat-val[data-target]').forEach(el => {
  const end  = parseInt(el.dataset.target);
  const suf  = el.dataset.suf !== undefined ? el.dataset.suf : '+';
  const numObs = new IntersectionObserver(entries => {
    if (entries[0].isIntersecting) {
      let c = 0; const step = Math.max(end / 60, 1);
      const t = setInterval(() => {
        c = Math.min(c + step, end);
        el.textContent = Math.round(c) + suf;
        if (c >= end) clearInterval(t);
      }, 20);
      numObs.disconnect();
    }
  }, { threshold: 0.5 });
  numObs.observe(el);
});
</script>
</body>
</html>
