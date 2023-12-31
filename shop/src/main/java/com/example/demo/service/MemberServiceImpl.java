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
		// System.out.println(mvo.getUserid()+"/"+mvo.getPwd());
		mvo = mapper.loginOk(mvo);
		// System.out.println(mvo);
		
		if(mvo.getName()==null)
		{
			return "redirect:/member/login?chk=1&pcode="+pcode+"&su="+su;
		} else if(mvo.getState()==1) {
			return "redirect:/member/reState?no="+mvo.getNo();
		} else {
			session.setAttribute("userid", mvo.getUserid());
			session.setAttribute("name", mvo.getName());
			
			
			
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
				
				// 이 부분에 쿠키정보를 cart 테이블로 이동시킨다. > 패키지가 달라 쿠키정보를 못 읽어오기 때문에
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

	@Override
	public String reState(HttpServletRequest req, Model model) {
		String no = req.getParameter("no");
		model.addAttribute("no",no);
		return "member/reState";
	}

	@Override
	public String chgState(HttpServletRequest req) {
		String no= req.getParameter("no");
		mapper.chgState(no);
		return "/member/login";
	}
}
