package com.example.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	@RequestMapping("/test/caljs")
	public String caljs() {
		return "/test/caljs";
	}
	
	@RequestMapping("/test/caljs2")
	public String caljs2() {
		return "/test/caljs2";
	}
	
	@RequestMapping("/test/getCal")
	public @ResponseBody ArrayList<HashMap> getCal(HttpServletRequest req) {
		
		String y=req.getParameter("y");
		int m= Integer.parseInt(req.getParameter("m"));
		
		String mm=String.format("%02d", m); // 월을 2자리수로 만듬.
		
		ArrayList<HashMap> mapall = mapper.getCal(y+"-"+mm);  //2023-09
		return mapall;
	}
	
	
	@RequestMapping("/test/caljs22")
	public String caljs22()
	{
		return "/test/caljs22";
	}
	
	
	@RequestMapping("/test/getCal2")
	public @ResponseBody ArrayList<HashMap> getCal2(HttpServletRequest request)
	{
		String y=request.getParameter("y");
		int m=Integer.parseInt( request.getParameter("m") );
		String mm=String.format("%02d", m);
				 
		ArrayList<HashMap> mapall=mapper.getCal2(y+"-"+mm);  // 2023-09
		
		return mapall;
	}
	
	
}
