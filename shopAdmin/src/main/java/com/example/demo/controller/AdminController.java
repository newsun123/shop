package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.AdminService;
import com.example.demo.vo.BaesongVo;
import com.example.demo.vo.ProductVo;

@Controller
public class AdminController {

	@Autowired
	@Qualifier("as")
	private AdminService as;
	
	@RequestMapping("/")
	public String home() {
		return "redirect:/product/productAdd";
	}
	
	@RequestMapping("/product/productAdd")
	public String productAdd(Model model) {
		return as.productAdd(model);
	}
	
	@RequestMapping("/product/getJung")
	public @ResponseBody String getJung(HttpServletRequest request) {
		return as.getJung(request);
	}
	
	@RequestMapping("/product/getSo")
	public @ResponseBody String getSo(HttpServletRequest request) {
		return as.getSo(request);
	}
	
	@RequestMapping("/product/getPcode")
	public @ResponseBody String getPcode(HttpServletRequest request) {
		return as.getPcode(request);
	}
	
	@RequestMapping("/product/test")
	public void test() {
		as.test();
	}
	
	@RequestMapping("/product/productAddOk")
	public String productAddOk(HttpServletRequest request) {
		return as.productAddOk(request);
	}
	
	@RequestMapping("/gumae/gumaeState")
	public String gumaeState(Model model) {
		return as.gumaeState(model);
	}
	
	@RequestMapping("/gumae/getProduct")
	public @ResponseBody ProductVo getProduct(HttpServletRequest req) {
		
		return as.getProduct(req);
	}
	
	@RequestMapping("/gumae/getBaesong")
	public @ResponseBody BaesongVo getBaesong(HttpServletRequest req) {
		return as.getBaesong(req);
	}
	
	@RequestMapping("/gumae/stateChange")
	public String stateChange(HttpServletRequest req) {
		return as.stateChange(req);
	}
	
	
	
}
