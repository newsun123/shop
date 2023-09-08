package com.example.demo.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.vo.MemberVo;

@Service
@Qualifier("mems")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public String member() {
		
		return "/member/member";
	}

	@Override
	public int useridCheck(MemberVo mvo) {

		return mapper.useridCheck(mvo);
	}

	@Override
	public String memberOk(MemberVo mvo) {
		
		mapper.memberOk(mvo);
		return "/member/login";
	}

	@Override
	public String login(HttpServletRequest request,Model model) {
		
		model.addAttribute("pcode",request.getParameter("pcode"));
		model.addAttribute("su",request.getParameter("su"));
		
		return "/member/login";
	}

	@Override
	public String loginOk(MemberVo mvo,HttpSession session,String pcode,String su,HttpServletRequest req) {
		String name=mapper.loginOk(mvo);
		System.out.println("pcode: "+pcode);
		
		if(name==null)
		{
			return "redirect:/member/login?chk=1&pcode="+pcode+"&su="+su;
		}
		else
		{
			session.setAttribute("userid", mvo.getUserid());
			session.setAttribute("name", name);
			
			
			
			if(pcode != null && pcode.length() != 0) 
			{
			     if(su.length()==0)  // jjim인 경우 값이 없으므로 ""
			     {
			    	 // jjim테이블에 저장을 하기
				     mapper.addjjim(pcode, mvo.getUserid());
				     return "redirect:/product/procontent?pcode="+pcode;
				     
			     }
			     else
			     {
			    	 return "redirect:/product/progumae?pcode="+pcode+"&su="+su;
			    	 
			    	 // cart에 저장 후 procontent로 이동시 장바구니로 이동창을 보여주고 싶다..
			     }
			     
			     // 같다면 여기에  return
			}
			else
			{
				return "redirect:/product/setCart";
				 //return "/main/main";
			}
			
			
		}
		 
	}

	@Override
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/main/main";
	}
}
