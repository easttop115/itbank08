package com.example.demo.notice;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
    private NoticeMapper noticeMapper;

    public void noticeform(String cp, Model model, Object jdbcTemplate) {
        int currentPage = 1;
        try {
            currentPage = Integer.parseInt(cp);
        } catch (Exception e) {
            currentPage = 1;
        }

        int pageBlock = 7; // 한 페이지에 보일 데이터의 수
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

    // List<NoticeDTO> noticeformWithTitleSearch(int begin, int end, String
    // titleSearch) {
    // String sql = "SELECT * FROM notice WHERE search_text LIKE ? LIMIT ?, ?";
    // titleSearch = "%" + titleSearch + "%";
    // return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(NoticeDTO.class),
    // titleSearch, begin, end);
    // }

    // // 검색어에 맞는 공지사항의 총 수 가져오기
    // int totalCountWithTitleSearch(String titleSearch) {
    // String sql = "SELECT COUNT(*) FROM notice WHERE search_text LIKE ?";
    // titleSearch = "%" + titleSearch + "%";
    // return jdbcTemplate.queryForObject(sql, Integer.class, titleSearch);

    @Autowired
    public NoticeService(NoticeMapper noticeMapper) {
        this.noticeMapper = noticeMapper;
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

        NoticeDTO noticeDTO = new NoticeDTO();
        noticeDTO.setId(sessionId);
        noticeDTO.setTitle(title);
        noticeDTO.setContent(multi.getParameter("content"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        noticeDTO.setWriteDate(sdf.format(new Date()));
        noticeDTO.setFileName("");

        // 비밀번호 설정 후 인코딩
        String userEnteredPassword = multi.getParameter("password");
        noticeDTO.setPassword(userEnteredPassword);

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String secretPw = encoder.encode(noticeDTO.getPassword());
        noticeDTO.setPassword(secretPw);

        MultipartFile file = multi.getFile("fileName");
        // if(file.getSize() != 0) { // 클라이언트가 파일을 업로드 했다면
        if (file != null && !file.isEmpty()) {
            // 파일의 이름
            sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
            String fileTime = sdf.format(new Date());
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
            noticeDTO.setFileName(fullPath);
            f = new File(fullPath);
            try {
                file.transferTo(f);
            } catch (Exception e) {
                e.printStackTrace();
                noticeDTO.setFileName("");
            }

        }

        mapper.noticewriteProc(noticeDTO);
        return "redirect:/notice/noticeform";
    }

    // public NoticeDTO noticecontent(String no) {
    // int n = 1;
    // try {
    // n = Integer.parseInt(no);
    // } catch (Exception e) {
    // return null;
    // }

    // NoticeDTO notice = mapper.noticecontent(n);
    // if (notice != null) {
    // mapper.incrementViews(n);
    // notice.setViews(notice.getViews() + 1);

    // if (notice.getFileName() != null) {
    // String[] names = notice.getFileName().split("\\\\");
    // for (String name : names)
    // System.out.println("NoticeService-noticecontent name : " + name);
    // /* C:\\javas\\upload\\user4\\20230925140126-pom.xml */

    // /* 20230925140126-01-pom-v01.xml */
    // String[] fileNames = names[4].split("-", 2);
    // for (String fileName : fileNames)
    // System.out.println("NoticeService-noticecontent fileName : " + fileName);

    // notice.setFileName(fileNames[1]);
    // }
    // }
    // return notice;
    // }
    public NoticeDTO noticecontent(String no) {
        int n = 1;
        try {
            n = Integer.parseInt(no);
        } catch (Exception e) {
            return null;
        }

        NoticeDTO notice = mapper.noticecontent(n);
        if (notice != null && notice.getFileName() != null) {
            String[] names = notice.getFileName().split("\\\\");
            System.out.println("글내용" + notice.getContent());
            System.out.println("글제목" + notice.getTitle());
            for (String name : names)
                System.out.println("NoticeService-noticecontent name : " + name);

            // names 배열의 길이가 충분한지 확인
            if (names.length > 4) {
                String[] fileNames = names[4].split("-", 2);

                // fileNames 배열의 길이가 충분한지 확인
                if (fileNames.length > 1) {
                    for (String fileName : fileNames)
                        System.out.println("NoticeService-noticecontent fileName : " + fileName);

                    // 유효한 인덱스에만 접근
                    notice.setFileName(fileNames[1]);
                } else {
                    // 적절한 에러 처리 또는 로깅
                }
            } else {
                // 적절한 에러 처리 또는 로깅
            }

            mapper.incrementViews(n);
            notice.setViews(notice.getViews() + 1);

        }

        return notice;
    }

    public void noticeDownload(String no, HttpServletResponse response) {
    }

    public NoticeDTO searchNotice(String title) {
        NoticeDTO notices = mapper.searchNotice(title);
        return notices;
    }

}