package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	@Qualifier("my")
	private MypageService service;
	
	@RequestMapping("/mypage/myinfo")
	public String myinfo(HttpSession session,Model model) {
		return service.myinfo(session,model);
	}
	
	@RequestMapping("/mypage/mynamechg")
	public String mynamechg(HttpSession session, HttpServletRequest req) {
		return service.mynamechg(session,req);
	}
	
	@RequestMapping("/mypage/myphonchg")
	public String myphonchg(HttpSession session, HttpServletRequest req) {
		return service.myphonchg(session,req);
	}
	
	@RequestMapping("/mypage/myemailchg")
	public String myemailchg(HttpSession session, HttpServletRequest req) {
		return service.myemailchg(session,req);
	}
	
	@RequestMapping("/mypage/checkPwd")
	public @ResponseBody String checkPwd(HttpServletRequest req, HttpSession ss) {
		return service.checkPwd(req,ss);
	}
	
	@RequestMapping("/mypage/chgPwd")
	public String chgPwd(HttpServletRequest req, HttpSession ss) {
		return service.chgPwd(req,ss);
	}
}
