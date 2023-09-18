package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.MemberVo;

public interface MemberService {

	public String member();
	public int useridCheck(MemberVo mvo);
	public String memberOk(MemberVo mvo);
	public String login(HttpServletRequest request,Model model);
	public String loginOk(MemberVo mvo,HttpSession session,String pcode,String su,HttpServletRequest req);
	public String logout(HttpSession session);
	public String reState(HttpServletRequest req,Model model);
	public String chgState(HttpServletRequest req);
}
