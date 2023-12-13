package com.example.demo.main;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Service
public class MainService {
	@RequestMapping("main/mainform")
	public void mainform(String cp, Model model) {
		
	}

}