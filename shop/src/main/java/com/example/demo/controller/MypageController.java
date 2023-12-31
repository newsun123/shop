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
import com.example.demo.vo.MtmVo;
import com.example.demo.vo.ReviewVo;

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
	
	@RequestMapping("/mypage/mygumae")
	public String mygumae(HttpSession ss, Model model) {
		return service.mygumae(ss,model);
	}
	
	@RequestMapping("/mypage/stateChange")
	public String stateChange(HttpServletRequest req) {
		return service.stateChange(req);
	}
	
	@RequestMapping("/mypage/review")
	public String review(HttpServletRequest req,Model model) {
		return service.review(req,model);
	}
	
	@RequestMapping("/mypage/reviewOk")
	public String reviewOk(ReviewVo rvo,HttpSession ss) {
		return service.reviewOk(rvo,ss);
	}
	
	@RequestMapping("/mypage/mtm")
	public String mtm() {
		return service.mtm();
	}
	
	@RequestMapping("/mypage/mtmOk")
	public String mtmOk(MtmVo mvo,HttpSession ss) {
		return service.mtmOk(mvo,ss);
	}
	
	@RequestMapping("/mypage/mylist")
	public String mylist(HttpSession ss,Model model) {
		return service.mylist(ss,model);
	}
	
	@RequestMapping("/mypage/reviewUpdate")
	public String reviewUpdate(ReviewVo rvo) {
		return service.reviewUpdate(rvo);
	}
	
	@RequestMapping("/mypage/reviewDel")
	public String reviewDel(ReviewVo rvo) {
		return service.reviewDel(rvo);
	}
	
	@RequestMapping("/mypage/memberout")
	public String memberout(HttpSession session) {
		return service.memberout(session);
	}
}
