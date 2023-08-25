package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ProductService;
import com.example.demo.vo.ProductVo;

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
	public String procontent(HttpServletRequest request, Model model, HttpSession session) {
		return service.procontent(request, model, session);

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
	public @ResponseBody String cartAdd(HttpServletRequest request, HttpSession session) {

		return service.cartAdd(request, session);
	}

	@RequestMapping("/product/cartView")
	public String cartView(HttpSession session, Model model) {
		return service.cartView(session, model);
	}

	@RequestMapping("/product/changeSu")
	public @ResponseBody String changeSu(HttpServletRequest request) {
		return service.changeSu(request);
	}

	@RequestMapping("/product/cartDel")
	public @ResponseBody String cartDel(HttpServletRequest request) {
		return service.cartDel(request);
	}

	@RequestMapping("/product/selectDel")
	public @ResponseBody String selectDel(HttpServletRequest request) {
		return service.selectDel(request);
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

	@RequestMapping("/product/selectDel2")
	public String selectDel2(HttpServletRequest request) {
		return service.selectDel2(request);
	}

	@RequestMapping("/product/progumae")
	public String progumae(ProductVo pvo,HttpSession session,Model model) {
		return service.progumae(pvo,session,model);
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
}