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
import com.example.demo.vo.ReviewVo;

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

	@Override
	public String stateChange(HttpServletRequest req) {
		String state=req.getParameter("state");
		String no = req.getParameter("no");
		mapper.stateChange(state,no);
	    System.out.println(state+" "+no);
		return "redirect:/mypage/mygumae";
	}

	@Override
	public String review(HttpServletRequest req,Model model) {
		String pcode = req.getParameter("pcode");
		String gumaeno = req.getParameter("gumaeno");
		
		model.addAttribute("pcode",pcode);
		model.addAttribute("gumaeno",gumaeno);
		return "/mypage/review";
	}

	@Override
	public String reviewOk(ReviewVo rvo,HttpSession ss) {
		String userid=ss.getAttribute("userid").toString();
		rvo.setUserid(userid);
		mapper.reviewOk(rvo);
		
		// 현재 상품의 star를 review테이블에서 전부 가져온다. 
		// 그 후 평균을 낸 뒤, product table의 star 필드를 update한다.
		// product 테이블에 review 필드에 1을 누적시키기
		mapper.chgProduct(rvo.getPcode());
		// 상품평을 등록했으면 gumae 테이블에 sangp필드의 값을 1로 변경한다.
		mapper.chgGumae(rvo.getGumaeno());
		return "redirect:/mypage/mygumae";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
