package service;

import java.awt.image.BufferedImage;
import java.awt.*;
import java.io.*;
import javax.imageio.ImageIO;
import java.util.Iterator;
import javax.imageio.ImageWriter;

public class ConvertService {

    // ════════════════════════════════════════════════════════════════════
    // MAIN ENTRY POINT
    // ════════════════════════════════════════════════════════════════════
    public static String convertImage(String inputPath, String outputFormat) {
        outputFormat = outputFormat.trim().toLowerCase();
        if (outputFormat.equals("word")) outputFormat = "docx";
        String inputExt  = inputPath.substring(inputPath.lastIndexOf(".") + 1).toLowerCase();
        String outputPath = inputPath.substring(0, inputPath.lastIndexOf(".")) + "." + outputFormat;
        try {
            if (isImageFormat(inputExt))  return convertFromImage(inputPath, outputPath, outputFormat);
            if (isCodeFormat(inputExt))   return convertFromCode(inputPath, outputPath, outputFormat);
            if (inputExt.equals("txt") || inputExt.equals("csv") || inputExt.equals("md")
             || inputExt.equals("json")  || inputExt.equals("xml")
             || inputExt.equals("yaml")  || inputExt.equals("yml")
             || inputExt.equals("sql"))  return convertFromText(inputPath, outputPath, outputFormat, inputExt);
            if (inputExt.equals("html") || inputExt.equals("htm"))
                                          return convertFromHtml(inputPath, outputPath, outputFormat);
            if (inputExt.equals("pdf"))   return convertFromPdf(inputPath, outputPath, outputFormat);
            if (inputExt.equals("docx") || inputExt.equals("doc"))
                                          return convertFromDocx(inputPath, outputPath, outputFormat);
            if (inputExt.equals("xlsx") || inputExt.equals("xls"))
                                          return convertFromXlsx(inputPath, outputPath, outputFormat);
            if (inputExt.equals("pptx") || inputExt.equals("ppt"))
                                          return convertFromPptx(inputPath, outputPath, outputFormat);
            System.err.println("Unsupported: " + inputExt);
            return null;
        } catch (Exception e) {
            System.err.println("ConvertService error: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    // ════════════════════════════════════════════════════════════════════
    // IMAGE → *
    // ════════════════════════════════════════════════════════════════════
    private static String convertFromImage(String in, String out, String fmt) throws Exception {
        BufferedImage img = ImageIO.read(new File(in));
        if (img == null) throw new IOException("Cannot read image: " + in);
        if (fmt.equals("pdf"))  return writePdfFromText("[Image] " + new File(in).getName()
            + "\nSize: " + img.getWidth() + " x " + img.getHeight() + " px", out);
        if (fmt.equals("docx")) return writeDocx("[Image] " + new File(in).getName()
            + "\nSize: " + img.getWidth() + " x " + img.getHeight() + " px", out);
        if (fmt.equals("txt"))  return writeText("[Image: " + img.getWidth() + "x" + img.getHeight() + "]", out);
        if (fmt.equals("html")) return writeText("<html><body style='text-align:center;background:#111;padding:40px;'>"
            + "<img src='" + new File(in).getName() + "' style='max-width:100%;border-radius:8px;'>"
            + "</body></html>", out);
        if (fmt.equals("ico")) { writeImg(img, "png", out); return out; }
        if (fmt.equals("jpg") || fmt.equals("jpeg")) img = flattenAlpha(img);
        writeImg(img, fmt.equals("jpg") ? "jpeg" : fmt, out);
        return out;
    }

    // ════════════════════════════════════════════════════════════════════
    // CODE → *
    // ════════════════════════════════════════════════════════════════════
    private static String convertFromCode(String in, String out, String fmt) throws Exception {
        String code = readFile(in);
        String ext  = in.substring(in.lastIndexOf(".") + 1).toLowerCase();
        String lang = getLangName(ext);

        if (fmt.equals("txt") || isCodeFormat(fmt)) return writeText(code, out);
        if (fmt.equals("md"))  return writeText("# " + new File(in).getName() + "\n\n```" + ext + "\n" + code + "\n```\n", out);
        if (fmt.equals("docx")) return writeDocx(code, out);
        if (fmt.equals("pdf"))  return writePdfFromText("[ " + lang + " ] " + new File(in).getName() + "\n" + "-".repeat(60) + "\n\n" + code, out);
        if (fmt.equals("html")) {
            String esc = escHtml(code);
            String hi  = highlight(esc, ext);
            String nums = addLineNums(hi);
            return writeText("<!DOCTYPE html><html><head><meta charset='UTF-8'><title>" + new File(in).getName() + "</title><style>"
                + "body{margin:0;background:#0d1117;color:#c9d1d9;font-family:'Fira Code',Consolas,monospace;}"
                + ".hdr{background:#161b22;padding:14px 32px;border-bottom:1px solid #30363d;display:flex;align-items:center;gap:12px;font-size:13px;color:#8b949e;}"
                + ".dots{display:flex;gap:6px;}.dot{width:12px;height:12px;border-radius:50%;}"
                + ".d1{background:#ff5f57;}.d2{background:#febc2e;}.d3{background:#28c840;}"
                + ".badge{background:#21262d;border:1px solid #30363d;color:#58a6ff;padding:3px 12px;border-radius:12px;font-size:11px;font-weight:700;}"
                + ".fname{color:#f0f6fc;font-weight:700;}"
                + "pre{padding:28px 32px;font-size:13px;line-height:1.8;overflow-x:auto;margin:0;}"
                + ".ln{color:#484f58;user-select:none;margin-right:24px;min-width:32px;display:inline-block;text-align:right;border-right:1px solid #21262d;padding-right:16px;}"
                + ".kw{color:#ff7b72;}.str{color:#a5d6ff;}.cm{color:#8b949e;font-style:italic;}.op{color:#ffa657;}"
                + "</style></head><body>"
                + "<div class='hdr'><div class='dots'><div class='dot d1'></div><div class='dot d2'></div><div class='dot d3'></div></div>"
                + "<span class='fname'>" + new File(in).getName() + "</span>"
                + "<span class='badge'>" + lang.toUpperCase() + "</span></div>"
                + "<pre>" + nums + "</pre></body></html>", out);
        }
        return writeText(code, out);
    }

    // ════════════════════════════════════════════════════════════════════
    // TXT / CSV / MD / JSON / XML / YAML / SQL → *
    // ════════════════════════════════════════════════════════════════════
    private static String convertFromText(String in, String out, String fmt, String inExt) throws Exception {
        String content = readFile(in);

        if (fmt.equals("docx")) return writeDocx(content, out);
        if (fmt.equals("pdf"))  return writePdfFromText(content, out);

        if (fmt.equals("html")) {
            return writeText("<html><head><meta charset='UTF-8'><style>"
                + "body{font-family:monospace;padding:32px;background:#fff;white-space:pre-wrap;"
                + "font-size:14px;line-height:1.7;color:#333;}</style></head><body>"
                + escHtml(content) + "</body></html>", out);
        }
        if (fmt.equals("png") || fmt.equals("jpg") || fmt.equals("jpeg"))
            return imgOut(renderTextImg(content, 900, 14), fmt, out);
        if (inExt.equals("csv") && fmt.equals("json")) return writeText(csvToJson(content), out);
        if (inExt.equals("csv") && fmt.equals("xml"))  return writeText(csvToXml(content), out);
        return writeText(content, out);
    }

    // ════════════════════════════════════════════════════════════════════
    // HTML → *
    // ════════════════════════════════════════════════════════════════════
    private static String convertFromHtml(String in, String out, String fmt) throws Exception {
        String content = readFile(in);
        String plain = content.replaceAll("<[^>]+>", " ")
            .replace("&amp;", "&").replace("&lt;", "<").replace("&gt;", ">").replace("&nbsp;", " ")
            .replaceAll("\\s+", " ").trim();
        if (fmt.equals("txt"))  return writeText(plain, out);
        if (fmt.equals("docx")) return writeDocx(plain, out);
        if (fmt.equals("pdf"))  return writePdfFromText(plain, out);
        if (fmt.equals("md"))   return writeText("# Page\n\n" + plain, out);
        if (isImageFormat(fmt)) return imgOut(renderTextImg(plain, 900, 14), fmt, out);
        return writeText(content, out);
    }

    // ════════════════════════════════════════════════════════════════════
    // PDF → *
    // ════════════════════════════════════════════════════════════════════
    private static String convertFromPdf(String in, String out, String fmt) throws Exception {
        byte[] raw = java.nio.file.Files.readAllBytes(new File(in).toPath());
        String src = new String(raw, "ISO-8859-1");

        // Extract text from BT...ET blocks
        StringBuilder sb = new StringBuilder();
        java.util.regex.Matcher bt = java.util.regex.Pattern.compile("(?s)BT(.*?)ET").matcher(src);
        while (bt.find()) {
            String blk = bt.group(1);
            java.util.regex.Matcher tj = java.util.regex.Pattern.compile("\\(([^)]*)\\)\\s*Tj").matcher(blk);
            while (tj.find()) {
                String t = tj.group(1).replace("\\n", "\n").replace("\\r", "\r")
                    .replace("\\t", "\t").replace("\\\\", "\\").replace("\\(", "(").replace("\\)", ")");
                t = t.replaceAll("[^\\x20-\\x7E\\n\\r\\t]", "");
                if (!t.trim().isEmpty()) { sb.append(t); sb.append(" "); }
            }
            java.util.regex.Matcher tja = java.util.regex.Pattern.compile("\\[([^\\]]*)\\]\\s*TJ").matcher(blk);
            while (tja.find()) {
                java.util.regex.Matcher sm = java.util.regex.Pattern.compile("\\(([^)]*)\\)").matcher(tja.group(1));
                while (sm.find()) {
                    String t = sm.group(1).replace("\\\\", "\\").replace("\\(", "(").replace("\\)", ")");
                    sb.append(t.replaceAll("[^\\x20-\\x7E]", ""));
                }
            }
        }
        String text = sb.toString().replaceAll("[ \\t]+", " ").replaceAll("\\n{3,}", "\n\n").trim();

        // Fallback: scan printable ASCII runs
        if (text.length() < 20) {
            StringBuilder fb = new StringBuilder();
            StringBuilder cur = new StringBuilder();
            for (byte b : raw) {
                int c = b & 0xFF;
                if (c >= 32 && c <= 126) { cur.append((char) c); }
                else { if (cur.length() >= 4) fb.append(cur).append(" "); cur.setLength(0); }
            }
            if (cur.length() >= 4) fb.append(cur);
            text = fb.toString()
                .replaceAll("\\b(obj|endobj|stream|endstream|xref|trailer|startxref"
                    + "|BT|ET|Tf|Tm|Td|TD|Tj|TJ|cm|Do|Type|Font|Page|Pages|Catalog"
                    + "|MediaBox|Resources|Producer|Creator)\\b", " ")
                .replaceAll("\\s+", " ").trim();
        }
        if (text.length() > 10000) text = text.substring(0, 10000) + "\n...[truncated]";

        if (fmt.equals("txt"))  return writeText(text, out);
        if (fmt.equals("docx")) return writeDocx(text, out);
        if (fmt.equals("html")) return writeText("<html><head><meta charset='UTF-8'><style>"
            + "body{font-family:Georgia,serif;padding:48px 64px;max-width:860px;margin:auto;"
            + "line-height:1.9;color:#1a1a1a;font-size:14px;}</style></head><body>"
            + "<pre style='white-space:pre-wrap;font-family:inherit;'>" + escHtml(text) + "</pre></body></html>", out);
        if (isImageFormat(fmt)) return imgOut(renderTextImg(text, 940, 13), fmt, out);
        return writePdfFromText(text, out);
    }

    // ════════════════════════════════════════════════════════════════════
    // DOCX → *
    // ════════════════════════════════════════════════════════════════════
    private static String convertFromDocx(String in, String out, String fmt) throws Exception {
        String xml = extractZip(in, "word/document.xml");
        if (xml == null) xml = "";
        // Extract <w:t> text paragraph by paragraph
        StringBuilder sb = new StringBuilder();
        java.util.regex.Matcher pm = java.util.regex.Pattern.compile("(?s)<w:p[ >](.*?)</w:p>").matcher(xml);
        while (pm.find()) {
            java.util.regex.Matcher tm = java.util.regex.Pattern.compile("<w:t[^>]*>([^<]*)</w:t>").matcher(pm.group(1));
            StringBuilder para = new StringBuilder();
            while (tm.find()) para.append(tm.group(1));
            String p = unesc(para.toString()).trim();
            if (!p.isEmpty()) sb.append(p).append("\n");
        }
        String text = sb.toString().trim();
        if (text.isEmpty()) text = unesc(xml.replaceAll("<[^>]+>", " ")).replaceAll("\\s+", " ").trim();

        if (fmt.equals("txt"))  return writeText(text, out);
        if (fmt.equals("docx")) return writeDocx(text, out);
        if (fmt.equals("pdf"))  return writePdfFromText(text, out);
        if (fmt.equals("md"))   return writeText("# Document\n\n" + text, out);
        if (fmt.equals("html")) return writeText("<html><head><meta charset='UTF-8'><style>"
            + "body{font-family:Arial,sans-serif;padding:48px;max-width:820px;margin:auto;"
            + "line-height:1.8;color:#222;}</style></head><body>"
            + "<p>" + escHtml(text).replace("  ", "</p><p>") + "</p></body></html>", out);
        if (isImageFormat(fmt)) return imgOut(renderTextImg(text, 900, 14), fmt, out);
        return writeText(text, out);
    }

    // ════════════════════════════════════════════════════════════════════
    // XLSX → *
    // ════════════════════════════════════════════════════════════════════
    private static String convertFromXlsx(String in, String out, String fmt) throws Exception {
        String sharedXml = extractZip(in, "xl/sharedStrings.xml");
        java.util.List<String> strs = new java.util.ArrayList<>();
        if (sharedXml != null) {
            java.util.regex.Matcher m = java.util.regex.Pattern.compile("<t[^>]*>([^<]*)</t>").matcher(sharedXml);
            while (m.find()) strs.add(unesc(m.group(1)));
        }
        String sheetXml = extractZip(in, "xl/worksheets/sheet1.xml");
        if (sheetXml == null) return writeText("(empty)", out);

        StringBuilder csv  = new StringBuilder();
        StringBuilder html = new StringBuilder("<html><head><meta charset='UTF-8'><style>"
            + "body{font-family:Arial,sans-serif;padding:24px;}"
            + "table{border-collapse:collapse;width:100%;font-size:13px;}"
            + "td,th{border:1px solid #ddd;padding:8px 14px;}"
            + "tr:first-child td{background:#2a5298;color:white;font-weight:bold;}"
            + "tr:nth-child(even) td{background:#f5f8ff;}"
            + "</style></head><body><table>");

        java.util.regex.Matcher rowM = java.util.regex.Pattern.compile("(?s)<row[^>]*>(.*?)</row>").matcher(sheetXml);
        while (rowM.find()) {
            html.append("<tr>");
            java.util.regex.Matcher cellM = java.util.regex.Pattern.compile("(?s)<c ([^>]*)>(.*?)</c>").matcher(rowM.group(1));
            StringBuilder csvRow = new StringBuilder();
            while (cellM.find()) {
                String attrs = cellM.group(1), cell = cellM.group(2);
                java.util.regex.Matcher vm = java.util.regex.Pattern.compile("(?s)<v>(.*?)</v>").matcher(cell);
                String val = vm.find() ? vm.group(1) : "";
                if (attrs.contains("t=\"s\"")) {
                    try { int idx = Integer.parseInt(val.trim()); val = idx < strs.size() ? strs.get(idx) : val; }
                    catch (Exception ignored) {}
                }
                if (csvRow.length() > 0) csvRow.append(",");
                csvRow.append("\"").append(val.replace("\"", "\"\"")).append("\"");
                html.append("<td>").append(escHtml(val)).append("</td>");
            }
            csv.append(csvRow).append("\n");
            html.append("</tr>");
        }
        html.append("</table></body></html>");

        if (fmt.equals("csv") || fmt.equals("txt")) return writeText(csv.toString(), out);
        if (fmt.equals("html")) return writeText(html.toString(), out);
        if (fmt.equals("json")) return writeText(csvToJson(csv.toString()), out);
        if (fmt.equals("xml"))  return writeText(csvToXml(csv.toString()), out);
        if (fmt.equals("pdf"))  return writePdfFromText(csv.toString(), out);
        if (isImageFormat(fmt)) return imgOut(renderTextImg(csv.toString(), 1000, 12), fmt, out);
        return writeText(csv.toString(), out);
    }

    // ════════════════════════════════════════════════════════════════════
    // PPTX → *
    // ════════════════════════════════════════════════════════════════════
    private static String convertFromPptx(String in, String out, String fmt) throws Exception {
        java.util.zip.ZipFile zip = new java.util.zip.ZipFile(in);
        java.util.TreeMap<String, String> slides = new java.util.TreeMap<>();
        java.util.Enumeration<? extends java.util.zip.ZipEntry> entries = zip.entries();
        while (entries.hasMoreElements()) {
            java.util.zip.ZipEntry e = entries.nextElement();
            String name = e.getName();
            if (name.startsWith("ppt/slides/slide") && name.endsWith(".xml")
                && !name.contains("Layout") && !name.contains("Master")) {
                String xml = streamStr(zip.getInputStream(e));
                StringBuilder sb = new StringBuilder();
                java.util.regex.Matcher pm = java.util.regex.Pattern.compile("(?s)<a:p>(.*?)</a:p>").matcher(xml);
                while (pm.find()) {
                    java.util.regex.Matcher tm = java.util.regex.Pattern.compile("<a:t[^>]*>([^<]*)</a:t>").matcher(pm.group(1));
                    StringBuilder para = new StringBuilder();
                    while (tm.find()) para.append(tm.group(1));
                    String p = unesc(para.toString()).trim();
                    if (!p.isEmpty()) sb.append(p).append("\n");
                }
                String slideText = sb.toString().trim();
                if (!slideText.isEmpty()) slides.put(name, slideText);
            }
        }
        zip.close();

        StringBuilder text = new StringBuilder();
        StringBuilder html = new StringBuilder("<html><head><meta charset='UTF-8'><style>"
            + "body{font-family:Arial,sans-serif;padding:40px;background:#1a1a2e;}"
            + ".slide{background:#16213e;border:1px solid #0f3460;border-radius:12px;padding:32px;margin-bottom:24px;color:#e0e0e0;}"
            + "h3{color:#63b3ed;margin-bottom:12px;} p{line-height:1.7;color:#a0aec0;}"
            + "</style></head><body>");
        int s = 1;
        for (String t : slides.values()) {
            text.append("-- Slide ").append(s).append(" --\n").append(t).append("\n\n");
            html.append("<div class='slide'><h3>Slide ").append(s).append("</h3><p>")
                .append(escHtml(t).replace("\n", "<br>")).append("</p></div>");
            s++;
        }
        html.append("</body></html>");

        if (fmt.equals("txt"))  return writeText(text.toString(), out);
        if (fmt.equals("html")) return writeText(html.toString(), out);
        if (fmt.equals("docx")) return writeDocx(text.toString(), out);
        if (fmt.equals("md")) {
            StringBuilder md = new StringBuilder("# Presentation\n\n");
            s = 1;
            for (String t : slides.values())
                md.append("## Slide ").append(s++).append("\n\n").append(t).append("\n\n---\n\n");
            return writeText(md.toString(), out);
        }
        if (fmt.equals("pdf"))  return writePdfFromText(text.toString(), out);
        if (isImageFormat(fmt)) return imgOut(renderTextImg(text.toString(), 900, 13), fmt, out);
        return writeText(text.toString(), out);
    }

    // ════════════════════════════════════════════════════════════════════
    // HELPERS — Format checks
    // ════════════════════════════════════════════════════════════════════
    private static boolean isImageFormat(String e) {
        return e != null && java.util.Arrays.asList("png","jpg","jpeg","bmp","gif","webp","tiff","tif","ico").contains(e);
    }
    private static boolean isCodeFormat(String e) {
        return e != null && java.util.Arrays.asList("py","java","js","ts","cpp","c","cs","php","rb","go","rs","kt","swift","sh","r","scala").contains(e);
    }

    // ════════════════════════════════════════════════════════════════════
    // HELPERS — Image utils
    // ════════════════════════════════════════════════════════════════════
    private static BufferedImage flattenAlpha(BufferedImage src) {
        BufferedImage r = new BufferedImage(src.getWidth(), src.getHeight(), BufferedImage.TYPE_INT_RGB);
        Graphics2D g = r.createGraphics();
        g.drawImage(src, 0, 0, Color.WHITE, null);
        g.dispose();
        return r;
    }
    private static void writeImg(BufferedImage img, String fmt, String path) throws Exception {
        if (!ImageIO.write(img, fmt, new File(path))) throw new IOException("ImageIO.write failed: " + fmt);
    }
    private static String imgOut(BufferedImage img, String fmt, String path) throws Exception {
        if (fmt.equals("ico")) { writeImg(img, "png", path); return path; }
        if (fmt.equals("jpg") || fmt.equals("jpeg")) img = flattenAlpha(img);
        writeImg(img, fmt.equals("jpg") ? "jpeg" : fmt, path);
        return path;
    }

    // ════════════════════════════════════════════════════════════════════
    // HELPERS — Text rendering to image
    // ════════════════════════════════════════════════════════════════════
    private static java.util.List<String> wrapLines(String text, FontMetrics fm, int innerW) {
        java.util.List<String> lines = new java.util.ArrayList<>();
        for (String raw : text.split("\n", -1)) {
            if (raw.isEmpty()) { lines.add(""); continue; }
            if (fm.stringWidth(raw) <= innerW) { lines.add(raw); continue; }
            String[] words = raw.split(" ", -1);
            StringBuilder cur = new StringBuilder();
            for (String w : words) {
                String test = cur.length() > 0 ? cur + " " + w : w;
                if (fm.stringWidth(test) > innerW && cur.length() > 0) {
                    lines.add(cur.toString()); cur = new StringBuilder(w);
                } else {
                    if (cur.length() > 0) cur.append(" ");
                    cur.append(w);
                }
            }
            if (cur.length() > 0) lines.add(cur.toString());
        }
        return lines;
    }

    private static BufferedImage renderTextImg(String text, int width, int fontSize) {
        text = text.replaceAll("[\u0000-\u0008\u000B\u000C\u000E-\u001F\u007F]", "");
        Font font = new Font("Dialog", Font.PLAIN, fontSize);
        BufferedImage dummy = new BufferedImage(1, 1, BufferedImage.TYPE_INT_RGB);
        Graphics2D gd = dummy.createGraphics();
        gd.setFont(font);
        FontMetrics fm = gd.getFontMetrics();
        gd.dispose();
        int margin = 60, lineH = fm.getHeight() + 4;
        java.util.List<String> wl = wrapLines(text, fm, width - margin * 2);
        int height = Math.max(wl.size() * lineH + margin * 2, 400);
        BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = img.createGraphics();
        g.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
        g.setColor(Color.WHITE); g.fillRect(0, 0, width, height);
        g.setFont(font); g.setColor(new Color(20, 20, 20));
        int y = margin + fm.getAscent();
        for (String line : wl) { g.drawString(line, margin, y); y += lineH; }
        g.dispose();
        return img;
    }

    private static java.util.List<BufferedImage> renderTextPages(String text, int fontSize) {
        text = text.replaceAll("[\u0000-\u0008\u000B\u000C\u000E-\u001F\u007F]", "");
        int pageW = 794, pageH = 1123, mx = 80, my = 90;
        Font font = new Font("Dialog", Font.PLAIN, fontSize);
        BufferedImage dummy = new BufferedImage(1, 1, BufferedImage.TYPE_INT_RGB);
        Graphics2D gd = dummy.createGraphics();
        gd.setFont(font);
        FontMetrics fm = gd.getFontMetrics();
        gd.dispose();
        int lineH = fm.getHeight() + 4;
        int linesPerPage = (pageH - my * 2) / lineH;
        java.util.List<String> allLines = wrapLines(text, fm, pageW - mx * 2);
        java.util.List<BufferedImage> pages = new java.util.ArrayList<>();
        int i = 0;
        do {
            BufferedImage page = new BufferedImage(pageW, pageH, BufferedImage.TYPE_INT_RGB);
            Graphics2D g = page.createGraphics();
            g.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
            g.setColor(Color.WHITE); g.fillRect(0, 0, pageW, pageH);
            g.setFont(font); g.setColor(new Color(20, 20, 20));
            int y = my + fm.getAscent();
            for (int c = 0; c < linesPerPage && i < allLines.size(); c++, i++) {
                g.drawString(allLines.get(i), mx, y); y += lineH;
            }
            g.dispose();
            pages.add(page);
        } while (i < allLines.size());
        return pages;
    }

    // ════════════════════════════════════════════════════════════════════
    // HELPERS — PDF writer (multi-page, pure Java)
    // ════════════════════════════════════════════════════════════════════
    private static String writePdfFromText(String text, String outputPath) throws Exception {
        return writePdfPages(renderTextPages(text, 16), outputPath);
    }

    private static String writePdf(BufferedImage src, String outputPath) throws Exception {
        return writePdfPages(java.util.Arrays.asList(src), outputPath);
    }

    private static String writePdfPages(java.util.List<BufferedImage> pages, String outputPath) throws Exception {
        int N = pages.size();
        byte[][] rgbData = new byte[N][];
        int[] iW = new int[N], iH = new int[N];
        for (int pi = 0; pi < N; pi++) {
            BufferedImage src = pages.get(pi);
            BufferedImage img = new BufferedImage(src.getWidth(), src.getHeight(), BufferedImage.TYPE_INT_RGB);
            Graphics2D g2 = img.createGraphics();
            g2.setColor(Color.WHITE); g2.fillRect(0, 0, src.getWidth(), src.getHeight());
            g2.drawImage(src, 0, 0, null); g2.dispose();
            iW[pi] = img.getWidth(); iH[pi] = img.getHeight();
            byte[] rgb = new byte[iW[pi] * iH[pi] * 3]; int ri = 0;
            for (int row = 0; row < iH[pi]; row++)
                for (int col = 0; col < iW[pi]; col++) {
                    int px = img.getRGB(col, row);
                    rgb[ri++] = (byte)((px >> 16) & 0xFF);
                    rgb[ri++] = (byte)((px >>  8) & 0xFF);
                    rgb[ri++] = (byte)( px        & 0xFF);
                }
            rgbData[pi] = rgb;
        }
        int total = 3 * N + 2;
        int[] off = new int[total + 1];
        ByteArrayOutputStream buf = new ByteArrayOutputStream();
        buf.write(new byte[]{0x25,0x50,0x44,0x46,0x2D,0x31,0x2E,0x34,0x0A});
        off[1] = buf.size();
        ws(buf, "1 0 obj\n<< /Type /Catalog /Pages 2 0 R >>\nendobj\n");
        StringBuilder kids = new StringBuilder();
        for (int pi = 0; pi < N; pi++) { if (pi > 0) kids.append(" "); kids.append(3 + pi).append(" 0 R"); }
        off[2] = buf.size();
        ws(buf, "2 0 obj\n<< /Type /Pages /Kids [" + kids + "] /Count " + N + " >>\nendobj\n");
        for (int pi = 0; pi < N; pi++) {
            int pg = 3+pi, im = 3+N+pi, ct = 3+2*N+pi;
            double sc = Math.min(595.0/iW[pi], 842.0/iH[pi]);
            int dw=(int)(iW[pi]*sc), dh=(int)(iH[pi]*sc), ox=(595-dw)/2, oy=(842-dh)/2;
            off[pg] = buf.size();
            ws(buf, pg+" 0 obj\n<< /Type /Page /Parent 2 0 R /MediaBox [0 0 595 842]"
                +" /Contents "+ct+" 0 R /Resources << /XObject << /Im"+pi+" "+im+" 0 R >> >> >>\nendobj\n");
        }
        for (int pi = 0; pi < N; pi++) {
            int im = 3+N+pi; off[im] = buf.size();
            ws(buf, im+" 0 obj\n<< /Type /XObject /Subtype /Image /Width "+iW[pi]
                +" /Height "+iH[pi]+" /ColorSpace /DeviceRGB /BitsPerComponent 8 /Length "
                +rgbData[pi].length+" >>\nstream\n");
            buf.write(rgbData[pi]);
            ws(buf, "\nendstream\nendobj\n");
        }
        for (int pi = 0; pi < N; pi++) {
            int ct = 3+2*N+pi;
            double sc = Math.min(595.0/iW[pi], 842.0/iH[pi]);
            int dw=(int)(iW[pi]*sc), dh=(int)(iH[pi]*sc), ox=(595-dw)/2, oy=(842-dh)/2;
            byte[] cb = ("q "+dw+" 0 0 "+dh+" "+ox+" "+oy+" cm /Im"+pi+" Do Q\n").getBytes("ISO-8859-1");
            off[ct] = buf.size();
            ws(buf, ct+" 0 obj\n<< /Length "+cb.length+" >>\nstream\n");
            buf.write(cb);
            ws(buf, "\nendstream\nendobj\n");
        }
        int xref = buf.size();
        StringBuilder xb = new StringBuilder("xref\n0 "+(total+1)+"\n0000000000 65535 f \n");
        for (int oi = 1; oi <= total; oi++) xb.append(String.format("%010d 00000 n \n", off[oi]));
        ws(buf, xb.toString());
        ws(buf, "trailer\n<< /Size "+(total+1)+" /Root 1 0 R >>\nstartxref\n"+xref+"\n%%EOF\n");
        try (FileOutputStream fos = new FileOutputStream(outputPath)) { buf.writeTo(fos); }
        return outputPath;
    }

    private static void ws(ByteArrayOutputStream buf, String s) throws Exception {
        buf.write(s.getBytes("ISO-8859-1"));
    }

    // ════════════════════════════════════════════════════════════════════
    // HELPERS — DOCX writer (pure Java ZIP / Open XML)
    // ════════════════════════════════════════════════════════════════════
    private static String writeDocx(String text, String outputPath) throws Exception {
        String[] paras = text.split("\n");
        StringBuilder body = new StringBuilder();
        for (String p : paras) {
            String esc = p.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
            body.append("<w:p><w:pPr><w:spacing w:after=\"160\"/></w:pPr>")
                .append("<w:r><w:rPr><w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>")
                .append("<w:sz w:val=\"24\"/></w:rPr>")
                .append("<w:t xml:space=\"preserve\">").append(esc).append("</w:t>")
                .append("</w:r></w:p>\n");
        }
        String NW  = "http://schemas.openxmlformats.org/wordprocessingml/2006/main";
        String NR  = "http://schemas.openxmlformats.org/officeDocument/2006/relationships";
        String NP  = "http://schemas.openxmlformats.org/package/2006/relationships";
        String NOD = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument";
        String NST = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles";
        String NC  = "http://schemas.openxmlformats.org/package/2006/content-types";
        String CDO = "application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml";
        String CDS = "application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml";
        String CDR = "application/vnd.openxmlformats-package.relationships+xml";

        String doc  = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>"
            + "<w:document xmlns:w=\""+NW+"\" xmlns:r=\""+NR+"\">"
            + "<w:body>" + body
            + "<w:sectPr><w:pgSz w:w=\"12240\" w:h=\"15840\"/>"
            + "<w:pgMar w:top=\"1440\" w:right=\"1440\" w:bottom=\"1440\" w:left=\"1440\"/>"
            + "</w:sectPr></w:body></w:document>";
        String rels = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>"
            + "<Relationships xmlns=\""+NP+"\">"
            + "<Relationship Id=\"rId1\" Type=\""+NOD+"\" Target=\"word/document.xml\"/>"
            + "</Relationships>";
        String wrels= "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>"
            + "<Relationships xmlns=\""+NP+"\">"
            + "<Relationship Id=\"rId1\" Type=\""+NST+"\" Target=\"styles.xml\"/>"
            + "</Relationships>";
        String styles="<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>"
            + "<w:styles xmlns:w=\""+NW+"\">"
            + "<w:docDefaults><w:rPrDefault><w:rPr>"
            + "<w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>"
            + "<w:sz w:val=\"24\"/></w:rPr></w:rPrDefault></w:docDefaults></w:styles>";
        String ct   = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>"
            + "<Types xmlns=\""+NC+"\">"
            + "<Default Extension=\"rels\" ContentType=\""+CDR+"\"/>"
            + "<Default Extension=\"xml\" ContentType=\"application/xml\"/>"
            + "<Override PartName=\"/word/document.xml\" ContentType=\""+CDO+"\"/>"
            + "<Override PartName=\"/word/styles.xml\" ContentType=\""+CDS+"\"/>"
            + "</Types>";

        try (java.util.zip.ZipOutputStream zos = new java.util.zip.ZipOutputStream(new FileOutputStream(outputPath))) {
            zos.setMethod(java.util.zip.ZipOutputStream.DEFLATED);
            ze(zos, "[Content_Types].xml", ct);
            ze(zos, "_rels/.rels", rels);
            ze(zos, "word/document.xml", doc);
            ze(zos, "word/_rels/document.xml.rels", wrels);
            ze(zos, "word/styles.xml", styles);
        }
        return outputPath;
    }

    private static void ze(java.util.zip.ZipOutputStream zos, String name, String data) throws Exception {
        zos.putNextEntry(new java.util.zip.ZipEntry(name));
        zos.write(data.getBytes("UTF-8"));
        zos.closeEntry();
    }

    // ════════════════════════════════════════════════════════════════════
    // HELPERS — File I/O
    // ════════════════════════════════════════════════════════════════════
    private static String writeText(String text, String path) throws Exception {
        try (BufferedWriter w = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path), "UTF-8"))) {
            w.write(text);
        }
        return path;
    }

    private static String readFile(String path) throws Exception {
        byte[] b = java.nio.file.Files.readAllBytes(new File(path).toPath());
        return new String(b, "UTF-8");
    }

    private static String extractZip(String zipPath, String entry) {
        try (java.util.zip.ZipFile zf = new java.util.zip.ZipFile(zipPath)) {
            java.util.zip.ZipEntry ze = zf.getEntry(entry);
            if (ze == null) return null;
            return streamStr(zf.getInputStream(ze));
        } catch (Exception e) { return null; }
    }

    private static String streamStr(InputStream is) throws Exception {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] buf = new byte[4096]; int n;
        while ((n = is.read(buf)) != -1) baos.write(buf, 0, n);
        return baos.toString("UTF-8");
    }

    // ════════════════════════════════════════════════════════════════════
    // HELPERS — String utils
    // ════════════════════════════════════════════════════════════════════
    private static String escHtml(String s) {
        return s.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;").replace("\"","&quot;");
    }

    private static String unesc(String s) {
        if (s == null) return "";
        return s.replace("&amp;","&").replace("&lt;","<").replace("&gt;",">")
                .replace("&quot;","\"").replace("&apos;","'").replace("&#160;"," ").replace("&nbsp;"," ");
    }

    // ════════════════════════════════════════════════════════════════════
    // HELPERS — Syntax highlighting
    // ════════════════════════════════════════════════════════════════════
    private static String highlight(String escaped, String ext) {
        String[] kw;
        if (ext.equals("java") || ext.equals("cs") || ext.equals("kt"))
            kw = new String[]{"public","private","protected","static","final","class","interface","extends","implements","new","return","if","else","for","while","do","switch","case","break","continue","void","int","long","double","float","boolean","String","null","true","false","try","catch","finally","throw","throws","import","package"};
        else if (ext.equals("py"))
            kw = new String[]{"def","class","return","if","elif","else","for","while","import","from","as","with","in","not","and","or","True","False","None","try","except","finally","raise","pass","lambda","yield"};
        else if (ext.equals("js") || ext.equals("ts"))
            kw = new String[]{"function","const","let","var","return","if","else","for","while","class","extends","new","this","import","export","default","async","await","try","catch","finally","throw","null","undefined","true","false","typeof","instanceof"};
        else
            kw = new String[]{};
        String result = escaped;
        for (String k : kw) result = result.replaceAll("\\b(" + k + ")\\b", "<span class='kw'>$1</span>");
        result = result.replaceAll("(&quot;[^&]*&quot;)", "<span class='str'>$1</span>");
        result = result.replaceAll("(//[^\n]*)", "<span class='cm'>$1</span>");
        return result;
    }

    private static String addLineNums(String html) {
        String[] lines = html.split("\n");
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < lines.length; i++)
            sb.append("<span class='ln'>").append(i + 1).append("</span>").append(lines[i]).append("\n");
        return sb.toString();
    }

    private static String getLangName(String ext) {
        switch (ext) {
            case "py": return "Python"; case "java": return "Java"; case "js": return "JavaScript";
            case "ts": return "TypeScript"; case "cpp": return "C++"; case "c": return "C";
            case "cs": return "C#"; case "php": return "PHP"; case "rb": return "Ruby";
            case "go": return "Go"; case "rs": return "Rust"; case "kt": return "Kotlin";
            case "swift": return "Swift"; case "sh": return "Shell"; case "r": return "R";
            case "scala": return "Scala"; default: return ext.toUpperCase();
        }
    }

    // ════════════════════════════════════════════════════════════════════
    // HELPERS — CSV conversions
    // ════════════════════════════════════════════════════════════════════
    private static String csvToJson(String csv) {
        String[] rows = csv.split("\n");
        if (rows.length == 0) return "[]";
        String[] headers = rows[0].split(",");
        StringBuilder json = new StringBuilder("[\n");
        for (int i = 1; i < rows.length; i++) {
            if (rows[i].trim().isEmpty()) continue;
            String[] vals = rows[i].split(",", -1);
            json.append("  {");
            for (int j = 0; j < headers.length; j++) {
                String h = headers[j].trim().replace("\"", "");
                String v = j < vals.length ? vals[j].trim().replace("\"", "") : "";
                json.append("\"").append(h).append("\":\"").append(v).append("\"");
                if (j < headers.length - 1) json.append(",");
            }
            json.append(i < rows.length - 1 ? "},\n" : "}\n");
        }
        return json.append("]").toString();
    }

    private static String csvToXml(String csv) {
        String[] rows = csv.split("\n");
        if (rows.length == 0) return "<data/>";
        String[] headers = rows[0].split(",");
        StringBuilder xml = new StringBuilder("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<data>\n");
        for (int i = 1; i < rows.length; i++) {
            if (rows[i].trim().isEmpty()) continue;
            String[] vals = rows[i].split(",", -1);
            xml.append("  <row>\n");
            for (int j = 0; j < headers.length; j++) {
                String h = headers[j].trim().replace("\"", "").replaceAll("[^a-zA-Z0-9_]", "_");
                String v = j < vals.length ? escHtml(vals[j].trim().replace("\"", "")) : "";
                xml.append("    <").append(h).append(">").append(v).append("</").append(h).append(">\n");
            }
            xml.append("  </row>\n");
        }
        return xml.append("</data>").toString();
    }
}