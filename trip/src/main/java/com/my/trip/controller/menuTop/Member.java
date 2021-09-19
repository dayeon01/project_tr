package com.my.trip.controller.menuTop;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.my.trip.dao.MemberDao;
import com.my.trip.vo.joinVO;

@Controller
@RequestMapping("/menu_top")


public class Member {
	@Autowired
	MemberDao mDao;
	
	
	//로그인 폼보기
	@RequestMapping("/login.tr")
	public ModelAndView login(ModelAndView mv){
		mv.setViewName("menu_top/login");
		return mv;
		
	}
	
	
	//회원가입 폼보기
	@RequestMapping("/join.tr")
	public ModelAndView join(ModelAndView mv) {
		mv.setViewName("menu_top/join");
		return mv;
	}
	
	//id 중복검사
	//@RequestMapping(value="/ukCheck.tr",headers="Accept=*/*",produces="application/json;charset=utf8")
	@RequestMapping(value="/idCheck.tr", method=RequestMethod.POST, params="id")
	@ResponseBody 
	public Map<String, String> idCheck(String id){
		int cnt = mDao.idCheck(id);
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("res", "NO");
		map.put("id", id);
		if(cnt != 1) {
			map.put("res", "OK");
		}
		System.out.println("map" +map);
		return map;
		/*
		 * int cnt = mDao.idCheck(id);
		 * 
		 * String idCheck = new idCheck(id); map.put("result","NO"); map.put("cnt",
		 * cnt+""); if(cnt != 1) { map.put("result","OK"); } System.out.println(map);
		 * return map;
		 */
	}
	
	@RequestMapping("/joinProc.tr")
	//회원가입 요청처리
	public ModelAndView joinProc(joinVO jVO, ModelAndView mv, HttpSession session, RedirectView rv) {
		/*
		 * if(isLogin(session)) { rv.setUrl("/trip/main.tr"); mv.setView(rv); return mv;
		 * }
		 */
		int cnt = mDao.joinMember(jVO);
		
		if(cnt == 1) {
			session.setAttribute("SID", jVO.getId());
			rv.setUrl("/trip/login.tr");
		}else {
			rv.setUrl("/trip/join.tr");
		}
		mv.setView(rv);
		return mv;
		
	}
	
	
	// 로그인 검사
		public boolean isLogin(HttpSession session) {
			String sid = (String) session.getAttribute("SID");
			
			return (sid == null) ? false : true;
		}
	
}
