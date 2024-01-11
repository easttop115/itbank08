package com.example.demo.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class NoticeController {
    @Autowired
    private NoticeService service;
    @Autowired
    private HttpSession session;

    @RequestMapping("/notice/noticeform")
    public String noticeForm(Model model,
            @RequestParam(value = "currentPage", required = false) String cp) {
        service.noticeform(cp, model, cp);
        return "/notice/noticeform";
    }

    @PostMapping("/searchNotice")
    public String searchNotice(String title, Model model) {
        if (title.trim().isEmpty() || title == "") {
            return "/notice/noticeform";
        }
        NoticeDTO notices = service.searchNotice(title);
        model.addAttribute("notices", notices);

        return "/notice/noticeform";
    }

    @RequestMapping("/notice/noticewrite")
    public String noticewrite() {
        String sessionId = (String) session.getAttribute("id");
        if (sessionId == null)
            return "redirect:/";
        return "/notice/noticewrite";
    }

    @PostMapping("/notice/noticewriteProc")
    public String noticewriteProc(MultipartHttpServletRequest multi) {
        String sessionId = (String) session.getAttribute("id");
        if (sessionId == null)
            return "redirect:/";

        String path = service.noticewriteProc(multi);
        return path;
    }

    @RequestMapping("/notice/noticecontent")
    public String noticecontent(String no, Model model) {
        NoticeDTO notice = service.noticecontent(no);

        if (notice == null) {
            return "redirect:/notice/noticeform";
        }

        model.addAttribute("notice", notice);
        return "/notice/noticecontent";
    }

    @RequestMapping("noticeDownload")
    public void noticeDownload(String no, HttpServletResponse response) {
        service.noticeDownload(no, response);
    }

    // @RequestMapping("/notice/noticemodify")
    // public String noticemodify(String no, Model model) {
    // String sessionId = (String) session.getAttribute("id");
    // if (sessionId == null)
    // sessionId = "admin";
    // // return "redirect:login";
    // String path = service.noticemodify(no, model);
    // return path;
    // }

    // @PostMapping("noticemodifyProc")
    // public String noticemodifyProc(NoticeDTO notice, RedirectAttributes ra) {
    // String sessionId = (String) session.getAttribute("id");
    // if (sessionId == null)
    // sessionId = "admin";
    // // return "redirect:login";
    // String msg = service.noticemodifyProc(Notice);
    // ra.addFlashAttribute("msg", msg);

    // if (msg.equals("게시글 수정 성공"))
    // return "redirect:noticecontent?no=" + Notice.getNo();

    // return "redirect:noticemodify?no=" + Notice.getNo();
    // }

    // @RequestMapping("noticeDeleteProc")
    // public String noticeDeleteProc(String no) {
    // String sessionId = (String) session.getAttribute("id");
    // if (sessionId == null)
    // sessionId = "admin";
    // // return "redirect:login";

    // String msg = service.noticeDeleteProc(no);

    // if (msg.equals("작성자만 삭제 할 수 있습니다."))
    // return "redirect:NoticeContent?no=" + no;

    // return "redirect:NoticeForm";
    // }

    // @RequestMapping("/notice/noticewrite")
    // public String noticewrite() {
    // String sessionId = (String) session.getAttribute("id");
    // if (sessionId == null)
    // return "redirect:login";
    // // sessionId = "admin";
    // return "/notice/noticeform";
    // }

    // @PostMapping("/notice/noticewriteProc")
    // public String noticewriteProc(MultipartHttpServletRequest multi) {
    // String sessionId = (String) session.getAttribute("id");
    // if (sessionId == null)
    // sessionId = "admin";
    // // return "redirect:login";
    // String path = service.noticewriteProc(multi);
    // return path;
    // }

}
