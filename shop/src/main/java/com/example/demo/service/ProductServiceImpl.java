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

import com.example.demo.mapper.ProductMapper;
import com.example.demo.vo.BaesongVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.ProductVo;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductMapper mapper;

	@Override
	public String prolist(Model model,HttpServletRequest request) {
		
		String pcode=request.getParameter("pcode");
		model.addAttribute("pcode",pcode);
		
		//prolist.jsp에 id가="sectionTop"인곳에 출력할 내용 만들기 => Home-대-중-소
		String[] ppp= {null,null,null};
	    String sectiontop="HOME";
		String imsi;
	    for(int i=0;i<ppp.length;i++){
    		
			try{
    			ppp[i]=pcode.substring(i*2+1,i*2+3);
    			switch(i) {
    				case 0: 
    					imsi=mapper.getDaeName(ppp[0]); 
    					sectiontop=sectiontop+" > "+imsi;
    				break;
    				case 1:
    					imsi=mapper.getJungName(ppp[0],ppp[1]); 
    					sectiontop=sectiontop+" > "+imsi;
    				break;
    				case 2: 
    					imsi=mapper.getSoName(ppp[0]+ppp[1],ppp[2]);
    					sectiontop=sectiontop+" > "+imsi;
    				break;
    			}
    			
    		}catch(Exception e){
    			break;
    		}
	    }
		
	    model.addAttribute("sectiontop",sectiontop);
	    
//	    for(int i=0;i<ppp.length;i++){
//	    	System.out.println(ppp[i]);
//	    }
	    
		//페이지 관련
		int page=1;
		if(request.getParameter("page")!=null)
			page=Integer.parseInt(request.getParameter("page"));
		
		int index=(page-1)*20;
		
		int num=3;
		if(request.getParameter("num")!=null)
			num=Integer.parseInt(request.getParameter("num"));
		
		String str="";
		switch(num) {
			case 1: str="price asc"; break;
			case 2: str="price desc"; break;
			case 3: str="pansu desc"; break;
			case 4: str="writeday desc"; break;
		}
		ArrayList<ProductVo> plist=mapper.prolist(pcode,str, index);
		
		for(int i=0;i<plist.size();i++) {
			
			int btime=plist.get(i).getBtime(); //주문후 몇일 뒤에 배송되는가를 저장한 값
			LocalDate today=LocalDate.now();
			LocalDate xday=today.plusDays(btime);
			
			//productVo의 writeday변수를 이용하여 처리: prolist에서 등록일은 사용하지 않는다
			plist.get(i).setWriteday(xday.toString().substring(5).replace("-","/"));
			
			//요일 구하기
			/*String yoil= xday.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.KOREAN).substring(0,1);*/
			int cc=xday.getDayOfWeek().getValue();
			
			String yoil="";
			switch(cc) {
				case 1: yoil="월"; break;
				case 2: yoil="화"; break;
				case 3: yoil="수"; break;
				case 4: yoil="목"; break;
				case 5: yoil="금"; break;
				case 6: yoil="토"; break;
				case 7: yoil="일"; break;
			}
			plist.get(i).setYoil(yoil);
			
			//별점처리: 노란별 출력 갯수, 반별 출력 갯수, 회색별 출력갯수를 구하여 전달
			//반별 기준:0.3 <= 반별 <= 0.8
			double star=plist.get(i).getStar();
			
			//노란별의 갯수 정하기: 정수부분은 노란별
			int ystar=(int)star;
			
			if(star-ystar>0.8)
				ystar++;
			
			//반쪽별 갯수 정하기
			int banstar=0;
			if(ystar+0.3<star && star< ystar+0.8)
				banstar=1;
			
			//회색별 갯수 정하기
			int gstar=5-(ystar+banstar);
			
			plist.get(i).setYstar(ystar);
			plist.get(i).setBanstar(banstar);
			plist.get(i).setGstar(gstar);
		}
		
		model.addAttribute("plist",plist);
		
		//pstart, pend, chong, page 뷰에 전달
		int pstart=page/10;
		
		if(page%10==0)
			pstart--;
		
		pstart=pstart*10+1;
		int pend=pstart+9;
		
		int chong=mapper.getChong(pcode);
		
		if(pend>chong)
			pend=chong;
		
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("num",num);
		
		return "/product/prolist";
	}

	@Override
	public String procontent(HttpServletRequest request,Model model,
			HttpSession session) {
		
		String pcode=request.getParameter("pcode");
		ProductVo pvo=mapper.procontent(pcode);
		
		//별점 관련 처리
		double star=pvo.getStar();
		
		//노란별의 갯수 정하기: 정수부분은 노란별
		int ystar=(int)star;
		
		if(star-ystar>0.8)
			ystar++;
		
		//반쪽별 갯수 정하기
		int banstar=0;
		if(ystar+0.3<star && star< ystar+0.8)
			banstar=1;
		
		//회색별 갯수 정하기
		int gstar=5-(ystar+banstar);
		
		pvo.setYstar(ystar);
		pvo.setBanstar(banstar);
		pvo.setGstar(gstar);
		
		//배송일자 및 요일 처리
		int btime=pvo.getBtime(); //주문후 몇일 뒤에 배송되는가를 저장한 값
		LocalDate today=LocalDate.now();
		LocalDate xday=today.plusDays(btime);
		
		pvo.setWriteday(xday.toString().substring(5).replace("-","/"));
		
		int cc=xday.getDayOfWeek().getValue();
		
		String yoil="";
		switch(cc) {
			case 1: yoil="월"; break;
			case 2: yoil="화"; break;
			case 3: yoil="수"; break;
			case 4: yoil="목"; break;
			case 5: yoil="금"; break;
			case 6: yoil="토"; break;
			case 7: yoil="일"; break;
		}
		
		pvo.setYoil(yoil);
		
		//제조사 구하기: p01010102003
		String code=pcode.substring(7,9);
		String comp=mapper.getComp(code);
		
		model.addAttribute("pvo",pvo);
		model.addAttribute("comp",comp);
		model.addAttribute("pcode",pcode);
		
		//현재 제품을 사용자가 찜테이블에 저장했는지 여부를 확인하여 model로 전달
		String userid="";
		if(session.getAttribute("userid")!=null)
			userid=session.getAttribute("userid").toString();
		
		if(mapper.isjjim(pcode,userid)) {
			
			model.addAttribute("img","jjim2.png");
			
		}else {
			model.addAttribute("img","jjim1.png");
		}
		
		//로그인을 하지 않고 장바구니 담기를 했을 때 로그인을 실행하고
		//cart에 담은 후 proconent로 이동시 ct=1값이 존재
		model.addAttribute("ct",request.getParameter("ct"));
		
		return "/product/procontent";
		
	}

	@Override
	public String addjjim(HttpServletRequest request, HttpSession session) {
		
		if(session.getAttribute("userid")!=null) {
			
			try {
				String pcode=request.getParameter("pcode");
				String userid=session.getAttribute("userid").toString();
				
				mapper.addjjim(pcode,userid);
				
				return "0";
			}catch(Exception e) {
				
				return "1";			
			}	
		}else {
			return "2";
		}
	}
	
	@Override
	public String deljjim(HttpServletRequest request, HttpSession session) {
		
		try{
			String pcode=request.getParameter("pcode");
			String userid=session.getAttribute("userid").toString();
		
			mapper.deljjim(pcode,userid);
		  
			return "0";
		}catch(Exception e){
	        
			return "1";		
		}
	}

	@Override
	public String cartAdd(HttpServletRequest request, HttpSession session) {
		
		try {
			String pcode=request.getParameter("pcode");
			int su=Integer.parseInt(request.getParameter("su"));
			String userid=session.getAttribute("userid").toString();
			
			//현재 상품이 cart에 존재하는지 여부를 체크
			ProductVo pvo=mapper.isCart(pcode,userid);
			
			if(pvo==null) { //현재 상품이 장바구니에 없다
				
				mapper.cartAdd(pcode,su,userid);
			}else {
				int hap=pvo.getSu()+su;
				mapper.cartUp(hap,pvo.getNo());
			}
			
			
			return "0";
			
		}catch(NullPointerException e) {
			return "2";
			
		}catch(Exception e) {
			return "1";
		}
	}

	@Override
	public String cartView(HttpSession session, Model model) {
		
		ArrayList<HashMap> mapall=mapper.cartView(session.getAttribute("userid").toString());
		
		//자바스크립트에서 배열형태 값,값,값
		String str="";
		for(int i=0;i<mapall.size();i++) {
			str=str+mapall.get(i).get("su")+",";
		}
		
		model.addAttribute("str",str);
		model.addAttribute("mapall",mapall);
		
		return "/product/cartView";
	}

	@Override
	public String changeSu(HttpServletRequest request) {
		
		try{
		   String su=request.getParameter("su");
		   String no=request.getParameter("no");
		
		   mapper.changeSu(su,no);
		   return "0";
		   
		}catch(Exception e){
		   return "1";	
		}
	}

	@Override
	public String cartDel(HttpServletRequest request) {
		// 카트에 저장된 상품을 삭제하기(08/24)
		try {
			String no = request.getParameter("no");
			mapper.cartDel(no);
			return "0";
		} catch (Exception e) {
			return "1";
		}
	}

	@Override
	public String selectDel(HttpServletRequest request) {
		String nos = request.getParameter("nos");
		// ,로 구분된 값을 나눈다.
		try {
			String[] no = nos.split(",");
			for (int i = 0; i < no.length; i++)
				mapper.cartDel(no[i]);

			return "0";
		} catch (Exception e) {
			return "1";
		}
	}
	


	@Override
	public String jjimView(HttpSession session, Model model) {
		String userid= session.getAttribute("userid").toString();
		model.addAttribute("mapall", mapper.jjimView(userid));
		return "/product/jjimView";
	}

	@Override
	public String jjimToCart(HttpServletRequest request, HttpSession session) {
		String pcode = request.getParameter("pcode");
		String no = request.getParameter("no");
		String userid = session.getAttribute("userid").toString();
		
		mapper.jjimToCart(pcode,userid,1);
		mapper.jjimDel(no);
		return "redirect:/product/cartView";
	}

	@Override
	public String jjimDel(HttpServletRequest request, HttpSession session) {
		
		String no = request.getParameter("nos");
			mapper.jjimDel(no);
			
			return "redirect:/product/jjimView";

	}

	@Override
	public String selectDel2(HttpServletRequest request) {
		try {
			String nos = request.getParameter("nos");
			String[] no = nos.split(",");
			for(int i=0;i<no.length;i++) {
				mapper.jjimDel(no[i]);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/product/jjimView";
	}

	@Override
	public String progumae(ProductVo pvo, HttpSession session,Model model) {
		// 구매자 정보를 구하여 views에 전달 (이름, 이메일, 주소) : member
		String userid = session.getAttribute("userid").toString();
		MemberVo mvo = mapper.getMember(userid);
		model.addAttribute("mvo",mvo);
		// 받는 사람의 정보를 구하여 views에 전달(이름, 주소, 연락처, 요청사항) : baesong
		BaesongVo bvo = mapper.getBaesong(userid);
		model.addAttribute("bvo",bvo);
		// 배송되는 상품에 관련된 내용(도착요일, 도착예정일, 상품명, 수량, 배송비) : product
		ProductVo bpvo = mapper.procontent(pvo.getPcode());
		bpvo.setSu(pvo.getSu()); //사용자가 원하는 구매수량
		model.addAttribute("bpvo",bpvo);
		// 결제정보(상품가격, 적립금 사용여부(뒤에)) :
		return "/product/progumae";
	}

	@Override
	public String chgPhone(HttpServletRequest request,HttpSession session) {
		String phone = request.getParameter("phone");
		String userid=session.getAttribute("userid").toString();
		try {
			mapper.chgPhone(phone,userid);
			return "0";
		}catch(Exception e) {
			
			return "1";
		}
	}

	@Override
	public String baelist(HttpSession session,HttpServletRequest request,Model model) {
		String userid=session.getAttribute("userid").toString();
		model.addAttribute("blist",mapper.baelist(userid));
		return "/product/baelist";
	}

	@Override
	public String baeWrite() {
		
		return "/product/baeWrite";
	}
}
