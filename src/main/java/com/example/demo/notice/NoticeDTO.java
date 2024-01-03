package com.example.demo.notice;

public class NoticeDTO {
    private int no;
    private String title;
    private String content;
    private String id;
    private String writedate; // 2023-09-22
    private String views;
    private String fileName;

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getWriteDate() {
        return writedate;
    }

    public void setWriteDate(String writedate) {
        this.writedate = writedate;
    }

    public String getViews() {
        return views;
    }

    public void setViews(String views) {
        this.views = views;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

}
