package com.example.demo.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

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

	@Override
	public String mygumae(HttpSession ss, Model model) {
		String userid = ss.getAttribute("userid").toString();
		
		ArrayList<HashMap> mapall = mapper.mygumae(userid);
		
		//도착날짜, 요일 처리
		for(int i=0; i<mapall.size(); i++) {
			int btime=(int)mapall.get(i).get("btime");
			
			LocalDate today=LocalDate.now();
			LocalDate xday=today.plusDays(btime);
			
			// ProductVo의 writeday변수를 이용하여 처리 : prolist에서 등록일을 사용하지 않는다..
			mapall.get(i).put("baeday", xday.toString().substring(5).replace("-","/"));
			
			int cc=xday.getDayOfWeek().getValue();  // 1~7까지의 값 (월~일)
			String yoil="";
			switch(cc)
			{
			   case 1: yoil="월"; break;
			   case 2: yoil="화"; break;
			   case 3: yoil="수"; break;
			   case 4: yoil="목"; break;
			   case 5: yoil="금"; break;
			   case 6: yoil="토"; break;
			   case 7: yoil="일"; break;
			}
			mapall.get(i).put("yoil", yoil);
		}
		
		model.addAttribute("mapall",mapall);
		return "/mypage/mygumae";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
