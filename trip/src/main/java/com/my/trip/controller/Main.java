package com.my.trip.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
@RequestMapping("/main")

public class Main {
	
	@RequestMapping("main.tr")
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("main/main");
		return mv;
	}
}
