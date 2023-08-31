package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MypageMapper;
import com.example.demo.vo.MemberVo;

@Service
@Qualifier("my")
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageMapper mapper;

	@Override
	public String myinfo(HttpSession session, Model model) {
		String userid = session.getAttribute("userid").toString();
		MemberVo mvo = mapper.myinfo(userid);
		model.addAttribute("mvo",mvo);
		return "/mypage/myinfo";
	}

	@Override
	public String mynamechg(HttpSession session,HttpServletRequest req) {
		String userid = session.getAttribute("userid").toString();
		String name = req.getParameter("name");
		mapper.mynamechg(userid,name);
		return "redirect:/mypage/myinfo";
	}

	@Override
	public String myphonchg(HttpSession session, HttpServletRequest req) {
		String userid = session.getAttribute("userid").toString();
		String phone = req.getParameter("phone");
		mapper.myphonchg(userid,phone);
		return "redirect:/mypage/myinfo";
	}

	@Override
	public String myemailchg(HttpSession session, HttpServletRequest req) {
		String userid = session.getAttribute("userid").toString();
		String email = req.getParameter("email");
		mapper.myemailchg(userid,email);
		return "redirect:/mypage/myinfo";
	}

	@Override
	public String checkPwd(HttpServletRequest req, HttpSession ss) {
		
		String userid = ss.getAttribute("userid").toString();
		String pwd = req.getParameter("pwd");
		String pwd2 = mapper.getPwd(userid);
		
		if(pwd.equals(pwd2)) {
			return "0";
		}else {
			return "1";			
		}
		
	}
	
	public String getPwd(String userid) {
		return mapper.getPwd(userid);
	}

	@Override
	public String chgPwd(HttpServletRequest req, HttpSession ss) {
		String pwd = req.getParameter("pwd1");
		String userid = ss.getAttribute("userid").toString();
		mapper.chgPwd(pwd,userid);
		return "redirect:/mypage/myinfo";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
