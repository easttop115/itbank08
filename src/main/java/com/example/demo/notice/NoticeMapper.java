package com.example.demo.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface NoticeMapper {

    List<NoticeDTO> noticeform(@Param("begin") int begin, @Param("end") int en);

    int totalCount();

    void noticewriteProc(NoticeDTO notice);

    NoticeDTO noticecontent(@Param("no") int n);

    String noticeDownload(int n);

    // int NoticeModifyProc(NoticeDTO notice);

    // void NoticeDeleteProc(int n);

    void incrementViews(int n);

    // List<NoticeDTO> noticeformWithTitleSearch(int begin, int end, String
    // titleSearch);

    // int totalCountWithTitleSearch(String titleSearch);

    NoticeDTO searchNotice(@Param("title") String title);

}
