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
	
	@RequestMapping("main/main")
	public String main() {
		return "main/main";
	}
	
	@RequestMapping("/top")
	public String top() {
		return "/top";
	}
	
	@RequestMapping("/")
	public String home() {
		return "redirect:/main/main";
	}
	
	@RequestMapping("/member/memberlist")
	public String memberlist(Model model) {
		return as.memberlist(model);
	}
	
	@RequestMapping("/member/memberout")
	public String memberout(HttpServletRequest req) {
		return as.memberout(req);
	}
	
	@RequestMapping("/product/plist")
	public String plist(Model model)
	{
		return as.plist(model);
	}
	
	@RequestMapping("/product/adminReview")
	public String adminReview(HttpServletRequest req,Model model) {
		return as.adminReview(req,model);
	}
	
	@RequestMapping("/product/reviewDel")
	public @ResponseBody String reviewDel(HttpServletRequest req) {
		return as.reviewDel(req);
	}
	
	@RequestMapping("/answer/answerlist")
	public String answerlist(Model model) {
		return as.answerlist(model);
	}
}
