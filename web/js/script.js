// ═══════════════════════════════════════════════
// CONVERSION SUPPORT MAP
// What each input format can convert TO
// ═══════════════════════════════════════════════
const SUPPORT_MAP = {
  // Images → any image + pdf + txt + html
  png:  { group:"image", to:["jpg","jpeg","bmp","gif","webp","tiff","ico","pdf","txt","html"] },
  jpg:  { group:"image", to:["png","jpeg","bmp","gif","webp","tiff","ico","pdf","txt","html"] },
  jpeg: { group:"image", to:["png","jpg","bmp","gif","webp","tiff","ico","pdf","txt","html"] },
  bmp:  { group:"image", to:["png","jpg","jpeg","gif","webp","tiff","ico","pdf","txt","html"] },
  gif:  { group:"image", to:["png","jpg","jpeg","bmp","webp","tiff","ico","pdf","txt","html"] },
  webp: { group:"image", to:["png","jpg","jpeg","bmp","gif","tiff","ico","pdf","txt","html"] },
  tiff: { group:"image", to:["png","jpg","jpeg","bmp","gif","webp","ico","pdf","txt","html"] },
  tif:  { group:"image", to:["png","jpg","jpeg","bmp","gif","webp","ico","pdf","txt","html"] },
  ico:  { group:"image", to:["png","jpg","jpeg","bmp","gif","webp","tiff","pdf","txt","html"] },
  // Documents
  pdf:  { group:"doc",   to:["png","jpg","jpeg","bmp","txt","html"] },
  docx: { group:"doc",   to:["pdf","txt","html","png","jpg"] },
  doc:  { group:"doc",   to:["pdf","txt","html","png","jpg"] },
  txt:  { group:"doc",   to:["pdf","html","png","jpg","csv"] },
  csv:  { group:"doc",   to:["txt","html","pdf","png","jpg"] },
  html: { group:"doc",   to:["pdf","txt","png","jpg"] },
  htm:  { group:"doc",   to:["pdf","txt","png","jpg"] },
  // Spreadsheets
  xlsx: { group:"sheet", to:["csv","txt","html","pdf","png","jpg"] },
  xls:  { group:"sheet", to:["csv","txt","html","pdf","png","jpg"] },
  // Presentations
  pptx: { group:"pres",  to:["txt","html","pdf","png","jpg"] },
  ppt:  { group:"pres",  to:["txt","html","pdf","png","jpg"] },
};

const GROUP_LABELS = {
  image: "🖼️ Image file",
  doc:   "📄 Document file",
  sheet: "📊 Spreadsheet file",
  pres:  "📊 Presentation file",
};

// ═══════════════════════════════════════════════
// FILE PREVIEW
// ═══════════════════════════════════════════════
function previewFile() {
  const fileInput = document.getElementById("fileInput");
  const info      = document.getElementById("fileSelectedInfo");
  const nameEl    = document.getElementById("fileName");
  const sizeEl    = document.getElementById("fileSize");

  if (fileInput.files.length > 0) {
    const file = fileInput.files[0];
    nameEl.textContent = file.name;
    sizeEl.textContent = formatFileSize(file.size);
    info.classList.add("show");
    document.querySelector(".drop-zone").style.borderColor = "rgba(104,211,145,0.4)";

    // Show supported output formats hint
    const ext = file.name.split(".").pop().toLowerCase();
    showConversionHint(ext);
    highlightSupportedFormats(ext);
  }
}

function formatFileSize(bytes) {
  if (bytes < 1024) return bytes + " B";
  if (bytes < 1024 * 1024) return (bytes / 1024).toFixed(1) + " KB";
  return (bytes / (1024 * 1024)).toFixed(2) + " MB";
}

function showConversionHint(ext) {
  const hint  = document.getElementById("conversionHint");
  const hintT = document.getElementById("hintText");
  const info  = SUPPORT_MAP[ext];
  if (!info) { hint.style.display = "none"; return; }
  hintT.innerHTML = `<strong>${GROUP_LABELS[info.group] || ext.toUpperCase()} detected</strong> — 
    Can convert to: <span style="color:#63b3ed;font-family:'Space Mono',monospace;font-weight:700;">
    ${info.to.map(f=>f.toUpperCase()).join(", ")}</span>`;
  hint.style.display = "block";
}

function highlightSupportedFormats(ext) {
  const info = SUPPORT_MAP[ext];
  const all  = document.querySelectorAll(".format-option label");

  all.forEach(label => {
    const val   = label.previousElementSibling.value;
    const radio = label.previousElementSibling;
    if (!info) {
      label.style.opacity = "1";
      label.style.cursor  = "pointer";
      radio.disabled = false;
      return;
    }
    if (info.to.includes(val)) {
      label.style.opacity = "1";
      label.style.cursor  = "pointer";
      radio.disabled = false;
    } else {
      label.style.opacity = "0.3";
      label.style.cursor  = "not-allowed";
      radio.disabled = true;
      // Uncheck if was selected
      if (radio.checked) {
        radio.checked = false;
        // Auto-select first valid format
        const firstValid = document.querySelector(`.format-option input[value="${info.to[0]}"]`);
        if (firstValid) { firstValid.checked = true; selectFormat(info.to[0]); }
      }
    }
  });
}

// ═══════════════════════════════════════════════
// DRAG & DROP
// ═══════════════════════════════════════════════
function dragOverHandler(ev) {
  ev.preventDefault();
  document.getElementById("dropZone").classList.add("dragover");
}
function dragLeaveHandler() {
  document.getElementById("dropZone").classList.remove("dragover");
}
function dropHandler(ev) {
  ev.preventDefault();
  document.getElementById("dropZone").classList.remove("dragover");
  const fileInput = document.getElementById("fileInput");
  if (ev.dataTransfer.files.length > 0) {
    fileInput.files = ev.dataTransfer.files;
    previewFile();
  }
}
function openFilePicker() {
  document.getElementById("fileInput").click();
}

// ═══════════════════════════════════════════════
// FORMAT SELECTION
// ═══════════════════════════════════════════════
function selectFormat(value) {
  document.getElementById("selectedFormat").value = value;
}

// ═══════════════════════════════════════════════
// UPLOAD PROGRESS
// ═══════════════════════════════════════════════
function startUpload() {
  const progress = document.getElementById("progressBar");
  const wrap     = document.getElementById("progressWrap");
  const label    = document.getElementById("progressLabel");
  wrap.classList.add("show");
  let width = 0;
  const interval = setInterval(() => {
    if (width >= 95) { clearInterval(interval); label.textContent = "Processing..."; return; }
    width += Math.random() * 3 + 0.5;
    width = Math.min(width, 95);
    progress.style.width = width + "%";
    label.textContent = Math.round(width) + "%";
  }, 80);
}

// ═══════════════════════════════════════════════
// PAGE INIT
// ═══════════════════════════════════════════════
window.onload = function () {
  // Card tilt
  document.querySelectorAll(".feature-card").forEach(card => {
    card.addEventListener("mousemove", e => {
      const r = card.getBoundingClientRect();
      const x = (e.clientX - r.left) / r.width - 0.5;
      const y = (e.clientY - r.top) / r.height - 0.5;
      card.style.transform = `translateY(-4px) rotateX(${-y*5}deg) rotateY(${x*5}deg)`;
    });
    card.addEventListener("mouseleave", () => { card.style.transform = ""; });
  });

  // Stat counters
  document.querySelectorAll(".stat-number[data-target]").forEach(el => {
    const end  = parseInt(el.getAttribute("data-target"));
    const suf  = el.getAttribute("data-suffix") || "+";
    let count  = 0;
    const step = end / 80;
    const t    = setInterval(() => {
      count += step;
      if (count >= end) { el.textContent = end + suf; clearInterval(t); }
      else el.textContent = Math.round(count) + suf;
    }, 20);
  });

  // Scroll reveal
  const obs = new IntersectionObserver(entries => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        e.target.style.opacity = "1";
        e.target.style.transform = "translateY(0)";
      }
    });
  }, { threshold: 0.1 });
  document.querySelectorAll(".feature-card").forEach(card => {
    card.style.opacity = "0";
    card.style.transform = "translateY(30px)";
    card.style.transition = "opacity 0.6s ease, transform 0.6s ease";
    obs.observe(card);
  });
};