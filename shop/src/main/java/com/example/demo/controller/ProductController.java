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

@Controller
public class ProductController {
	
	@Autowired
	@Qualifier("ps")
	private ProductService service;
	
	
	@RequestMapping("/product/prolist")
	public String prolist(Model model,HttpServletRequest request) {
		return service.prolist(model,request);
	}
	
	@RequestMapping("/product/procontent")
	public String procontent(HttpServletRequest request,Model model,
			HttpSession session) {
		return service.procontent(request,model,session);
		
	}
	
	@RequestMapping("/product/addjjim")
	public @ResponseBody String addjjim(HttpServletRequest request,
			HttpSession session) {
		return service.addjjim(request,session);
	}
	
	@RequestMapping("/product/deljjim")
	public @ResponseBody String deljjim(HttpServletRequest request,
			HttpSession session) {
		return service.deljjim(request,session);
	}
	
	@RequestMapping("/product/cartAdd")
	public @ResponseBody String cartAdd(HttpServletRequest request,HttpSession session) {
		
		return service.cartAdd(request,session);
	}
	
	@RequestMapping("/product/cartView")
	public String cartView(HttpSession session,Model model) {
		return service.cartView(session,model);
	}
	
	@RequestMapping("/product/changeSu")
	public @ResponseBody String changeSu(HttpServletRequest request){
		return service.changeSu(request);
	}
	
	@RequestMapping("/product/cartDel")
	public @ResponseBody String cartDel(HttpServletRequest request) {
		return service.cartDel(request);
	}
	
	
}
