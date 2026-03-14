# ⚡ NaraConvert — Universal File Converter

<div align="center">

![NaraConvert Banner](https://img.shields.io/badge/NaraConvert-Universal%20File%20Converter-blue?style=for-the-badge&logo=java&logoColor=white)

[![Java](https://img.shields.io/badge/Java-ED8B00?style=flat-square&logo=java&logoColor=white)](https://www.java.com)
[![JSP](https://img.shields.io/badge/JSP-Servlet-007396?style=flat-square&logo=apache&logoColor=white)](https://tomcat.apache.org)
[![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)](https://www.mysql.com)
[![Tomcat](https://img.shields.io/badge/Apache%20Tomcat-F8DC75?style=flat-square&logo=apache-tomcat&logoColor=black)](https://tomcat.apache.org)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)
[![Free](https://img.shields.io/badge/100%25-Free-brightgreen?style=flat-square)]()

**35+ formats · No signup · No limits · Completely Free**

[🌐 Live Demo](https://narayan1483.github.io/NaraConvert) · [📁 Source Code](https://github.com/narayan1483/NaraConvert) · [👤 Developer](https://github.com/narayan1483)

</div>

---

## 📌 What is NaraConvert?

**NaraConvert** is a full-stack universal file converter built with pure Java. Convert images, documents, spreadsheets, code files and data formats — all for free, with no registration required.

> Built from scratch using Java Servlets + JSP + MySQL + Apache Tomcat. No third-party conversion APIs — everything is processed server-side.

---

## ✨ Features

| Feature | Details |
|---------|---------|
| ⚡ **Fast** | Java-powered backend — millisecond conversions |
| 🔒 **Private** | Files processed locally — nothing sent to third parties |
| 📄 **Multi-page PDF** | Proper A4 multi-page PDF output |
| 💸 **100% Free** | No subscription, no watermarks, no limits |
| 🛠️ **Open Source** | Full source code available on GitHub |
| 📱 **Responsive** | Works on desktop and mobile |

---

## 🗂️ Supported Formats

### 🖼️ Images (8 formats)
`PNG` `JPG` `JPEG` `WEBP` `BMP` `GIF` `ICO` `TIFF`

### 📄 Documents (6 formats)
`PDF` `DOCX` `WORD` `PPTX` `XLSX` `DOC`

### 📊 Data & Text (8 formats)
`TXT` `CSV` `JSON` `XML` `HTML` `MD` `YAML` `SQL`

### 💻 Code Files (14 formats)
`PY` `JAVA` `JS` `TS` `CPP` `C` `CS` `PHP` `RB` `GO` `RS` `KT` `SH` `SCALA`

---

## 🚀 Getting Started

### Prerequisites
- Java JDK 21+
- Apache Tomcat 10+
- MySQL 8+
- NetBeans IDE (recommended)

### Installation

**1. Clone the repository**
```bash
git clone https://github.com/narayan1483/NaraConvert.git
cd NaraConvert
```

**2. Setup MySQL Database**
```sql
CREATE DATABASE naraconvert;
USE naraconvert;

CREATE TABLE files (
  id INT AUTO_INCREMENT PRIMARY KEY,
  original_name VARCHAR(255),
  stored_name VARCHAR(255),
  input_format VARCHAR(20),
  output_format VARCHAR(20),
  file_size BIGINT,
  converted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**3. Configure DB Connection**

Edit `src/util/DBConnection.java`:
```java
private static final String URL = "jdbc:mysql://localhost:3306/naraconvert";
private static final String USER = "your_mysql_username";
private static final String PASS = "your_mysql_password";
```

**4. Add MySQL Connector**

Download `mysql-connector-j-9.x.x.jar` and add to project Libraries.

**5. Deploy & Run**
```
- Open project in NetBeans
- Right click project → Clean and Build
- Run on Apache Tomcat (port 8082)
- Open: http://localhost:8082/NaraConvert/
```

---

## 📁 Project Structure

```
NaraConvert/
├── Web Pages/
│   ├── index.html          ← GitHub Pages landing page
│   ├── index.jsp           ← Home page
│   ├── upload.jsp          ← Upload & Convert page
│   ├── formats.jsp         ← All supported formats
│   ├── result.jsp          ← Conversion result
│   ├── about.jsp           ← Developer info
│   ├── css/style.css       ← Global styles
│   ├── js/script.js        ← Frontend logic
│   ├── images/             ← Static images
│   ├── uploads/            ← Uploaded files (temp)
│   └── converted/          ← Converted files (temp)
│
├── Source Packages/
│   ├── controller/
│   │   ├── UploadServlet.java
│   │   ├── ConvertServlet.java
│   │   └── DownloadServlet.java
│   ├── service/
│   │   └── ConvertService.java   ← Core conversion logic
│   ├── dao/
│   │   └── FileDAO.java
│   ├── model/
│   │   └── FileModel.java
│   └── util/
│       └── DBConnection.java
│
└── WEB-INF/
    └── web.xml
```

---

## 🔄 How It Works

```
User uploads file
      ↓
UploadServlet.java  →  saves to /uploads/
      ↓
ConvertService.java →  converts file (pure Java)
      ↓
FileDAO.java        →  logs to MySQL
      ↓
result.jsp          →  shows download link
      ↓
DownloadServlet.java → serves converted file
```

---

## 🖥️ Screenshots

| Home Page | Upload Page |
|-----------|-------------|
| ![Home](https://raw.githubusercontent.com/narayan1483/NaraConvert/master/web/images/home.png) | ![Upload](https://raw.githubusercontent.com/narayan1483/NaraConvert/master/web/images/upload.png) |

| Formats Page | About Page |
|--------------|------------|
| ![Formats](https://raw.githubusercontent.com/narayan1483/NaraConvert/master/web/images/formats.png) | ![About](https://raw.githubusercontent.com/narayan1483/NaraConvert/master/web/images/abouts.png) |

| Home Footer |
|-------------|
| ![Footer](https://raw.githubusercontent.com/narayan1483/NaraConvert/master/web/images/home_footer.png) |

---

## 👨‍💻 Developer

<div align="center">

**Narayan Prasad Maurya**

*Full Stack Engineer & Game Developer*

Passionate about building real-world applications. Expert in **Java · Node.js · React · Express.js** with hands-on experience in **AI/ML** and **Game Development**.

[![GitHub](https://img.shields.io/badge/GitHub-narayan1483-181717?style=flat-square&logo=github)](https://github.com/narayan1483)
[![Gmail](https://img.shields.io/badge/Gmail-mauryanarayan649%40gmail.com-EA4335?style=flat-square&logo=gmail&logoColor=white)](mailto:mauryanarayan649@gmail.com)
[![Instagram](https://img.shields.io/badge/Instagram-npmaurya124-E4405F?style=flat-square&logo=instagram&logoColor=white)](https://www.instagram.com/npmaurya124/)
[![Phone](https://img.shields.io/badge/Phone-%2B91%209517339347-25D366?style=flat-square&logo=whatsapp&logoColor=white)](tel:+919517339347)

</div>

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

<div align="center">

Made with ❤️ by **Narayan Prasad Maurya**

⭐ **Star this repo if you found it useful!**

</div>
