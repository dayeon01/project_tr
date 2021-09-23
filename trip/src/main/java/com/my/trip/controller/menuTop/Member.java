package com.my.trip.controller.menuTop;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
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
	//@RequestMapping(value="/idCheck.tr", method=RequestMethod.POST, params="id")
	/*
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
	*/	
	@RequestMapping(value="/idCheck.tr", method=RequestMethod.POST)
	@ResponseBody 
	public String list(joinVO jVO) throws Exception{
		System.out.println(jVO.getId());
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result","Y");
		return new Gson().toJson(map);
	}
	
	
	@RequestMapping("/joinProc.tr")
	//회원가입 요청처리
	public ModelAndView joinProc(joinVO jVO, ModelAndView mv, HttpSession session, RedirectView rv) {
		/*
		 * if(isLogin(session)) { rv.setUrl("/trip/main.tr"); mv.setView(rv); return mv;
		 * }
		 */
		if(isLogin(session)) {
			rv.setUrl("/trip/main/main.tr");
			mv.setView(rv);
			return mv;
		}
		System.out.println("JVO" + jVO);
		
		int cnt = mDao.joinMember(jVO);
		if(cnt == 1) {
			session.setAttribute("SID", jVO.getId());
			rv.setUrl("/trip/menu_top/login.tr");
		}else {
			rv.setUrl("/trip/menu_top/join.tr");
		}
		mv.setView(rv);
		return mv;
		
	}
	
	//로그인
	@RequestMapping("/loginProc.tr")
	public ModelAndView loginProc(ModelAndView mv, joinVO jVO, HttpSession session, RedirectView rv) {
		String view = "/trip/main/main.tr";
		if(!isLogin(session)) {
			int cnt = mDao.getLogin(jVO);
			if(cnt == 1) {
				session.setAttribute("SID", jVO.getId());
			} else {
				mv.addObject("MSG","false");
				mv.setViewName("menu_top/login");
				return mv;
			}
		}
		rv.setUrl(view);
		mv.setView(rv);
		
		return mv;
	}
	
	
	// 로그인 검사
		public boolean isLogin(HttpSession session) {
			String sid = (String) session.getAttribute("SID");
			
			return (sid == null) ? false : true;
		}
	
}
