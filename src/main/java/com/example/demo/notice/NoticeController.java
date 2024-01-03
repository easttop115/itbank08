package com.example.demo.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController {
    @Autowired
    private NoticeService service;
    @Autowired
    private HttpSession session;

    @RequestMapping("/notice/noticeform")
    public String noticeForm(Model model,
            @RequestParam(value = "currentPage", required = false) String cp) {
        service.noticeForm(cp, model);
        return "/notice/noticeform";
    }

    // @RequestMapping("noticeContent")
    // public String noticeContent(String no, Model model) {
    // NoticeDTO notice = service.noticeContent(no);
    // if (notice == null) {
    // return "redirect:noticeForm";
    // }

    // model.addAttribute("notice", notice);
    // return "notice/noticeContent";
    // }

    @RequestMapping("noticeDownload")
    public void noticeDownload(String no, HttpServletResponse response) {
        service.noticeDownload(no, response);
    }

    @RequestMapping("notice/noticewrite")
    public String noticewrite(Model model, @RequestParam(value = "currentPage", required = false) String cp) {
        service.noticewrite(cp, model);

        return "notice/noticewrite";
    }

}