package com.example.demo.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.example.demo.service.MemberService;
import com.example.demo.vo.MemberVo;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("mems")
	private MemberService service;
	
	@RequestMapping("/member/member")
	public String member() {
		
		return service.member();
	}
	
	@RequestMapping("/member/useridCheck")
	public @ResponseBody int useridCheck(MemberVo mvo) {
		
		return service.useridCheck(mvo);
	}
	
	@RequestMapping("/member/memberOk")
	public String memberOk(MemberVo mvo) {
		
		return service.memberOk(mvo);
	}
	
	@RequestMapping("/member/login")
	public String login(HttpServletRequest request,Model model){
		return service.login(request,model);
	}
	
	@RequestMapping("/member/loginOk")
	public String loginOk(MemberVo mvo,HttpSession session,String pcode,String su,HttpServletRequest req) {
		Cookie cart = WebUtils.getCookie(req, "cart");
		
		return service.loginOk(mvo,session,pcode,su,req);
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		return service.logout(session);
	}
}
