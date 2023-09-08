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
		
		if(name==null) {
			return "redirect:/member/login?chk=1&pcode="+pcode+"&su="+su;
			
		}else {
			session.setAttribute("userid", mvo.getUserid());
			session.setAttribute("name", name);
			
			// 쿠키에 있는 장바구니 상품을 cart테이블에 저장 쿠키는 지우기 0908
			
			Cookie[] cookies = req.getCookies(); 
			for(int i=0;i<cookies.length;i++) {
				if(cookies[i].getName().equals("cart")) {
					String imsi = cookies[i].getValue();
					String[] cart = imsi.split(",");
					
					for(int j=0;j<cart.length;j++) {
						String pcode2 = cart[j].substring(0,12);
						String su2 = cart[j].substring(13);
						
						mapper.setCart(pcode2, mvo.getUserid(), su2);
					}
				}
			} // 쿠키 저장 완료 0908
			
			if(pcode != null && pcode.length() != 0) {
				//jjim테이블에 저장하기
				
				if(su.length()==0) { //찜인 경우
					mapper.addjjim(pcode, mvo.getUserid());		
					return "redirect:/product/procontent?pcode="+pcode;
					
				}else {
					
					return "redirect:/product/progumae?&pcode="+pcode+"&su="+su;
					//장바구니로 이동창을 보여주고 싶다
					
				}
				
			}else {		
				return "/main/main";
			}
			
		}
	}

	@Override
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/main/main";
	}
}
