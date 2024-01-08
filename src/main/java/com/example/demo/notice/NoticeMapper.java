package com.example.demo.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface NoticeMapper {

    List<NoticeDTO> noticeform(@Param("begin") int begin, @Param("end") int en);

    int totalCount();

    void noticewriteProc(NoticeDTO notice);

    NoticeDTO NoticeContent(int n);

    String NoticeDownload(int n);

    int NoticeModifyProc(NoticeDTO notice);

    void NoticeDeleteProc(int n);

    void incrementViews(int n);

}