package com.example.demo.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.notice.NoticeMapper;
import com.example.demo.notice.NoticeService;

@Controller
public class MainController {

	@Autowired
	private MainService service;
	@Autowired
	private NoticeMapper noticemapper;
	@Autowired
	private NoticeService noticeservice;

	@RequestMapping("main/mainform")
	public String mainform(Model model, @RequestParam(value = "currentPage", required = false) String cp) {
		noticeservice.noticeform(cp, model, cp);

		return "main/mainform";
	}

}