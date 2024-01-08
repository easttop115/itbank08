package com.example.demo.notice;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.PageService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class NoticeService {
    @Autowired
    private NoticeMapper mapper;
    private String filePath = "C:\\itbank08\\upload\\";

    public void noticeform(String cp, Model model) {
        int currentPage = 1;
        try {
            currentPage = Integer.parseInt(cp);
        } catch (Exception e) {
            currentPage = 1;
        }

        int pageBlock = 3; // 한 페이지에 보일 데이터의 수
        int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
        int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호

        List<NoticeDTO> Notices = mapper.noticeform(begin, end);
        int totalCount = mapper.totalCount();
        if (totalCount == 0) {
            return;
        }

        String url = "noticeform?currentPage=";
        String result = PageService.printPage(url, totalCount, pageBlock, currentPage);

        model.addAttribute("Notices", Notices);
        model.addAttribute("result", result);
    }

    @Autowired
    private HttpSession session;

    public String noticewriteProc(MultipartHttpServletRequest multi) {
        // System.out.println("title : " + multi.getParameter("title"));
        String sessionId = (String) session.getAttribute("id");
        if (sessionId == null)
            // sessionId = "admin";

            return "redirect:/";

        String title = multi.getParameter("title");
        if (title == null || title.trim().isEmpty()) {
            return "redirect:noticewrite";
        }
        String userEnteredPassword = multi.getParameter("password");
        System.out.println("사용자가 입력한 비밀번호: [" + userEnteredPassword + "]");

        NoticeDTO notice = new NoticeDTO();
        notice.setTitle(title);
        notice.setContent(multi.getParameter("content"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        MultipartFile file = multi.getFile("fileName");
        // if(file.getSize() != 0) { // 클라이언트가 파일을 업로드 했다면
        if (file != null && !file.isEmpty()) {
            // 파일의 이름
            sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
            String fileTime = sdf.format(new Date(0));
            String fileName = file.getOriginalFilename();

            String suffix = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
            System.out.println("NoticeService-notice writeProc-suffix : " + suffix);
            if (suffix.equalsIgnoreCase("pdf") == false)
                return "redirect:noticewrite";

            // 파일의 저장 경로
            String fileSaveDirectory = "C:\\itbank08\\upload\\" + sessionId;
            File f = new File(fileSaveDirectory);
            if (f.exists() == false) {
                f.mkdir();
            }

            String fullPath = fileSaveDirectory + "\\" + fileTime + fileName;
            notice.setFileName(fullPath);
            f = new File(fullPath);
            try {
                file.transferTo(f);
            } catch (Exception e) {
                e.printStackTrace();
                notice.setFileName("");
            }
            if (userEnteredPassword != null && !userEnteredPassword.trim().isEmpty()) {
                notice.setPassword(userEnteredPassword);
            } else {
                // 사용자가 비밀번호를 입력하지 않은 경우 기본값 또는 빈 문자열로 설정
                notice.setPassword(""); // 또는 다른 기본값 설정
            }

        }

        // 조회수랑 게시글 번호는 INSERT 명령 시 입력
        mapper.noticewriteProc(notice);
        return "redirect:NoticeForm";
    }

    public void noticeContent(String cp, Model model) {
    }

    public void noticeDownload(String no, HttpServletResponse response) {
    }

    public NoticeDTO noticecontent(String no) {
        return null;
    }

}