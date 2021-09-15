package com.my.trip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller


public class popUp {

	@RequestMapping("/popup/jusoPopup.tr")
	public ModelAndView jusoPopup(ModelAndView mv) {
		mv.setViewName("/popup/jusoPopup");
		return mv;
	}
	
}
