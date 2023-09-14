package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.MtmVo;
import com.example.demo.vo.ReviewVo;

public interface MypageService {

	public String myinfo(HttpSession session,Model model);
	public String mynamechg(HttpSession session,HttpServletRequest req);
	public String myphonchg(HttpSession session, HttpServletRequest req);
	public String myemailchg(HttpSession session, HttpServletRequest req);
	public String checkPwd(HttpServletRequest req, HttpSession ss);
	public String chgPwd(HttpServletRequest req, HttpSession ss);
	public String mygumae(HttpSession ss, Model model);
	public String stateChange(HttpServletRequest req);
	public String review(HttpServletRequest req,Model model) ;
	public String reviewOk(ReviewVo rvo,HttpSession ss);
	public String mtm();
	public String mtmOk(MtmVo mvo,HttpSession ss);
	public String mylist(HttpSession ss, Model model);
	public String reviewUpdate(ReviewVo rvo);
	public String reviewDel(ReviewVo rvo);
}
