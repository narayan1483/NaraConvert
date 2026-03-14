package model;

public class FileModel {

    private int id;
    private String filename;
    private String originalFormat;
    private String convertedFormat;
    private String filePath;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getOriginalFormat() {
        return originalFormat;
    }

    public void setOriginalFormat(String originalFormat) {
        this.originalFormat = originalFormat;
    }

    public String getConvertedFormat() {
        return convertedFormat;
    }

    public void setConvertedFormat(String convertedFormat) {
        this.convertedFormat = convertedFormat;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

}