package com.example.demo.notice;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;

@Service
public class NoticeService {

    public void noticeForm(String cp, Model model) {
    }

    public void noticeContent(String cp, Model model) {
    }

    public void noticeDownload(String no, HttpServletResponse response) {
    }

    public void noticewrite(String cp, Model model) {
    }

    public String noticewriteProc(MultipartHttpServletRequest multi) {
        return null;
    }

    public NoticeDTO noticecontent(String no) {
        return null;
    }

}