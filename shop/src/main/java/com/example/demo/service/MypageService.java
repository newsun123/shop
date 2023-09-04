package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MypageService {

	public String myinfo(HttpSession session,Model model);
	public String mynamechg(HttpSession session,HttpServletRequest req);
	public String myphonchg(HttpSession session, HttpServletRequest req);
	public String myemailchg(HttpSession session, HttpServletRequest req);
	public String checkPwd(HttpServletRequest req, HttpSession ss);
	public String chgPwd(HttpServletRequest req, HttpSession ss);
	public String mygumae(HttpSession ss, Model model);
}
