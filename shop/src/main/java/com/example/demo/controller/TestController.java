package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.vo.MemberVo;

// JSON 공부용 테스트 컨트롤런
@Controller
public class TestController {
    
	@Autowired
	private MemberMapper mapper;
	
	@RequestMapping("/test/member")
	public String member(Model model)
	{
	//	model.addAttribute("mlist",mapper.member()); 오류때문에 주석처리
		return "/test/member";
	}
	
	@RequestMapping("/test/member2")
	public String member2(Model model)
	{
	//	model.addAttribute("mlist",mapper.member()); 오류때문에 주석처리
		return "/test/member2";
	}
	
//	@RequestMapping("/test/getMember")
//	public @ResponseBody MemberVo getMember(HttpServletRequest request)
//	{
//		String userid=request.getParameter("userid");
//		MemberVo mvo=mapper.getMember(userid); 오류때문에 주석처리
//		return mvo;
//	}
}
