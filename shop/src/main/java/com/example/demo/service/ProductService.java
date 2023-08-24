package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface ProductService {
	public String prolist(Model model,HttpServletRequest request);
	public String procontent(HttpServletRequest request,Model model,HttpSession session);
	public String addjjim(HttpServletRequest request,HttpSession session);
	public String deljjim(HttpServletRequest request,HttpSession session);
	public String cartAdd(HttpServletRequest request,HttpSession session);
	public String cartView(HttpSession session,Model model);
	public String changeSu(HttpServletRequest request);
	public String cartDel(HttpServletRequest request);
	public String selectDel(HttpServletRequest request);
	 
}
