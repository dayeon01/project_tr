package com.my.trip.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/main")

public class Main {
	
	@RequestMapping("main.tr")
	public ModelAndView main(ModelAndView mv, HttpSession session) {
		mv.setViewName("main/main");
		String sid = (String) session.getAttribute("SID");
		System.out.println("sid : "+ sid);
		return mv;
	}
}
