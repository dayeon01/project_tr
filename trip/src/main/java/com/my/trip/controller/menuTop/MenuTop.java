package com.my.trip.controller.menuTop;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
@RequestMapping("/menu_top")

public class MenuTop {
	
	//로그인
	@RequestMapping("login.tr")
	public ModelAndView login(ModelAndView mv){
		mv.setViewName("menu_top/login");
		return mv;
		
	}
	
	
	//회원가입
	@RequestMapping("join.tr")
	public ModelAndView join(ModelAndView mv) {
		mv.setViewName("menu_top/join");
		return mv;
	}
	
}
