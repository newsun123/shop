package com.example.demo.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ProductService;
import com.example.demo.vo.BaesongVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.QuestVo;

@Controller
public class ProductController {

	@Autowired
	@Qualifier("ps")
	private ProductService service;

	@RequestMapping("/product/prolist")
	public String prolist(Model model, HttpServletRequest request) {
		return service.prolist(model, request);
	}

	@RequestMapping("/product/procontent")
	public String procontent(HttpServletRequest request, Model model, HttpSession session,HttpServletResponse res) {
		
		/*
		 * //cookie 생성 - 쿠키 받으려면 response로 받아야함. String imsi =
		 * "p01010102001:2/p01010205007:3/p0050304004:5/"; Cookie cookie = new
		 * Cookie("cart",imsi); // 생성자("변수","값"); cookie.setMaxAge(600); //초 단위
		 * res.addCookie(cookie);
		 */
		//cookie 삭제
		/*
		 * Cookie cookie = new Cookie("cart",""); cookie.setMaxAge(0);
		 * res.addCookie(cookie);
		 */
		
		return service.procontent(request, model, session);

	}
	//쿠키 화인용 공부
	
	@RequestMapping("/product/viewCookie")
	public void viewCookie(HttpServletRequest req) { // 쿠키를 읽어오기
		
		Cookie[] cookies = req.getCookies();

		for (int i = 0; i < cookies.length; i++) {
			// System.out.println(cookies[i].getName()); // 변수명을 가져오기
			// System.out.println(cookies[i].getValue()); // 값을 가져오기
			if (cookies[i].getName().equals("cart")) {
				// System.out.println(cookies[i].getValue()); String cart =
				String cart = cookies[i].getValue();
				String[] carts = cart.split("/"); // p01010102002:2
				System.out.println(cart);
				for (int j = 0; j < carts.length; j++) {
					String pcode = carts[j].substring(0, 12);
					String su = carts[j].substring(13);
					
					System.out.println(pcode+" " +su);
				}
			}

		}
	}
	

	@RequestMapping("/product/addjjim")
	public @ResponseBody String addjjim(HttpServletRequest request, HttpSession session) {
		return service.addjjim(request, session);
	}

	@RequestMapping("/product/deljjim")
	public String deljjim(HttpServletRequest request, HttpSession session) {
		return service.deljjim(request, session);
	}

	@RequestMapping("/product/cartAdd")
	public @ResponseBody String cartAdd(HttpServletRequest request, HttpSession session,HttpServletResponse response) {

		return service.cartAdd(request, session,response);
	}

	@RequestMapping("/product/cartView")
	public String cartView(HttpSession session, Model model,HttpServletRequest req) {
		return service.cartView(session, model,req);
	}

	@RequestMapping("/product/changeSu")
	public @ResponseBody String changeSu(HttpServletRequest request) {
		return service.changeSu(request);
	}

	@RequestMapping("/product/cartDel")
	public @ResponseBody String cartDel( HttpServletResponse response, HttpServletRequest request) {
		return service.cartDel(response,request);
	}

	@RequestMapping("/product/selectDel")
	public @ResponseBody String selectDel(HttpServletRequest request) {
		return service.selectDel(request);
	}
	
	@RequestMapping("/product/selectDel2")
	public @ResponseBody String selectDel2(HttpServletRequest request,HttpServletResponse response) {
		return service.selectDel2(request,response);
	}

	@RequestMapping("/product/jjimView")
	public String jjimview(HttpSession session, Model model) {
		return service.jjimView(session, model);
	}

	@RequestMapping("/product/jjimToCart")
	public String jjimToCart(HttpServletRequest request, HttpSession session) {
		return service.jjimToCart(request, session);
	}

	@RequestMapping("/product/jjimDel")
	public String jjimDel(HttpServletRequest request, HttpSession session) {
		return service.jjimDel(request, session);
	}

	@RequestMapping("/product/progumae")
	public String progumae(HttpServletRequest request,HttpSession session,Model model) {
		return service.progumae(request,session,model);
	}
	
	@RequestMapping("/product/chgPhone")
	public @ResponseBody String chgPhone(HttpServletRequest request,HttpSession session) {
		return service.chgPhone(request,session);
	}
	
	@RequestMapping("/product/baelist")
	public String baelist(HttpSession session,HttpServletRequest request,Model model) {
		return service.baelist(session,request,model);
	}
	
	@RequestMapping("/product/baeWrite")
	public String baeWrite() {
		return service.baeWrite();
	}
	
	@RequestMapping("/product/baeWriteOk")
	public String baeWriteOk(BaesongVo bvo,HttpSession session) {
		return service.baeWriteOk(bvo,session);
	}
	
	@RequestMapping("/product/baeupdate")
	public String baeupdate(HttpServletRequest request, Model model) {
		return service.baeupdate(request,model);
	}
	
	@RequestMapping("/product/baeUpdateOk")
	public String baeUpdateOk(BaesongVo bvo,HttpSession session) {
		return service.baeUpdateOk(bvo,session);
	}
	@RequestMapping("/product/baeDelete")
	public String baeDelete(HttpServletRequest request) {
		return service.baeDelete(request);
	}
	
	@RequestMapping("/product/setReq")
	public @ResponseBody String setReq(HttpServletRequest request) {
		return service.setReq(request);
	}
	
	@RequestMapping("/product/progumaeOk")
	public String progumaeOk(GumaeVo gvo,HttpSession session) {
		return service.progumaeOk(gvo,session);
	}
	
	@RequestMapping("/product/jumunView")
	public String jumunView(HttpServletRequest request,Model model) {
		return service.jumunView(request,model);
	}
	
	@RequestMapping("/product/setCart")
	public String setCart(HttpServletResponse res,HttpServletRequest req,HttpSession ss) {
		
		return service.setCart(res,req,ss);
	}
	
	 @RequestMapping("/product/munOk")
	 public String munOk(QuestVo qvo, HttpSession session)  // 상품문의하기
	 {
		 return service.munOk(qvo,session);
	 }
}