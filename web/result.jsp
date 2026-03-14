<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.net.URLDecoder, java.io.File" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NaraConvert – Conversion Successful!</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="orb orb-1"></div>
<div class="orb orb-2"></div>
<div class="page-wrapper">
  <nav class="navbar">
    <div class="nav-logo">
      <a href="index.jsp" style="text-decoration:none;background:linear-gradient(135deg,#63b3ed,#76e4f7);-webkit-background-clip:text;-webkit-text-fill-color:transparent;font-weight:800;font-size:22px;font-family:'Space Mono',monospace;">NaraConvert</a>
    </div>
    <ul class="nav-links">
      <li><a href="index.jsp">Home</a></li>
      <li><a href="upload.jsp">Convert</a></li>
      <li><a href="#">Formats</a></li>
      <li><a href="#">About</a></li>
    </ul>
    <a href="upload.jsp"><button class="nav-badge">Convert Another</button></a>
  </nav>
  <div class="result-page">
    <div class="result-card">
<%
  String rawFile  = request.getParameter("file");
  String errorMsg = request.getParameter("error");
  if (errorMsg != null) {
%>
      <div class="success-icon" style="background:rgba(245,101,101,0.1);border-color:rgba(245,101,101,0.3);">❌</div>
      <h2 class="result-title">Conversion Failed</h2>
      <p class="result-subtitle"><%= errorMsg %></p>
      <div class="result-actions">
        <a href="upload.jsp" class="btn-download" style="background:linear-gradient(135deg,#fc8181,#f56565);">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 16 12 12 8 16"/><line x1="12" y1="12" x2="12" y2="21"/></svg>
          Try Again
        </a>
      </div>
<%
  } else if (rawFile != null && !rawFile.trim().isEmpty()) {
    String filePath      = URLDecoder.decode(rawFile, "UTF-8");
    File   convertedFile = new File(filePath);
    String displayName   = convertedFile.getName();
    String ext           = displayName.substring(displayName.lastIndexOf(".") + 1).toUpperCase();
    long   fileSizeKB    = convertedFile.exists() ? convertedFile.length() / 1024 : 0;
%>
      <div class="success-icon">✅</div>
      <h2 class="result-title">Conversion Complete!</h2>
      <p class="result-subtitle">Your file is ready. Click below to download it to your device.</p>
      <div style="display:flex;align-items:center;gap:12px;background:rgba(104,211,145,0.05);border:1px solid rgba(104,211,145,0.2);border-radius:12px;padding:14px 18px;margin-bottom:28px;text-align:left;">
        <span style="font-size:28px;">📄</span>
        <div style="flex:1;overflow:hidden;">
          <div style="font-size:14px;font-weight:700;color:#f7fafc;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><%= displayName %></div>
          <div style="font-size:12px;color:#718096;margin-top:2px;"><%= fileSizeKB %> KB &nbsp;•&nbsp;<span style="color:#63b3ed;font-family:'Space Mono',monospace;font-weight:700;"><%= ext %></span></div>
        </div>
        <span style="background:rgba(99,179,237,0.1);border:1px solid rgba(99,179,237,0.3);color:#63b3ed;font-size:12px;font-family:'Space Mono',monospace;font-weight:700;padding:4px 10px;border-radius:6px;white-space:nowrap;"><%= ext %></span>
      </div>
      <div class="result-actions">
        <a href="DownloadServlet?file=<%= java.net.URLEncoder.encode(filePath, "UTF-8") %>" class="btn-download">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 01-2 2H5a2 2 0 01-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
          Download <%= displayName %>
        </a>
        <a href="upload.jsp" class="btn-again">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="1 4 1 10 7 10"/><path d="M3.51 15a9 9 0 102.13-9.36L1 10"/></svg>
          Convert Another File
        </a>
        <a href="index.jsp" class="btn-again">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
          Back to Home
        </a>
      </div>
<%
  } else {
%>
      <div class="success-icon" style="font-size:32px;">📂</div>
      <h2 class="result-title">No File Yet</h2>
      <p class="result-subtitle">Upload a file first to convert and download it.</p>
      <div class="result-actions">
        <a href="upload.jsp" class="btn-download">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 16 12 12 8 16"/><line x1="12" y1="12" x2="12" y2="21"/></svg>
          Upload a File
        </a>
      </div>
<%
  }
%>
    </div>
  </div>
  <footer class="footer">
    <div class="footer-text">© 2026 <span>NaraConvert</span> — All rights reserved</div>
    <div class="footer-formats">
      <span class="footer-fmt">PNG</span><span class="footer-fmt">JPG</span><span class="footer-fmt">WEBP</span><span class="footer-fmt">PDF</span><span class="footer-fmt">+6</span>
    </div>
  </footer>
</div>
</body>
</html>
