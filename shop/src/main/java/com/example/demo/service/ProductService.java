package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.vo.BaesongVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.ProductVo;

public interface ProductService {
	public String prolist(Model model,HttpServletRequest request);
	public String procontent(HttpServletRequest request,Model model,HttpSession session);
	public String addjjim(HttpServletRequest request,HttpSession session);
	public String deljjim(HttpServletRequest request,HttpSession session);
	public String cartAdd(HttpServletRequest request,HttpSession session,HttpServletResponse response);
	public String cartView(HttpSession session,Model model,HttpServletRequest req);
	public String changeSu(HttpServletRequest request);
	public String cartDel(HttpServletResponse response,HttpServletRequest request);
	public String selectDel(HttpServletRequest request);
	public String jjimView(HttpSession session, Model model);
	public String jjimToCart(HttpServletRequest request,HttpSession session);
	public String jjimDel(HttpServletRequest request, HttpSession session);
	public String selectDel2(HttpServletRequest request,HttpServletResponse response);
	public String progumae(HttpServletRequest request,HttpSession session,Model model);
	public String chgPhone(HttpServletRequest request,HttpSession session);
	public String baelist(HttpSession session,HttpServletRequest request,Model model);
	public String baeWrite();
	public String baeWriteOk(BaesongVo bvo, HttpSession session);
	public String baeupdate(HttpServletRequest request, Model model);
	public String baeUpdateOk(BaesongVo bvo,HttpSession session);
	public String baeDelete(HttpServletRequest request);
	public String setReq(HttpServletRequest request);
	public String progumaeOk(GumaeVo gvo,HttpSession session);
	public String jumunView(HttpServletRequest request,Model model);
	public String setCart(HttpServletResponse res,HttpServletRequest req,HttpSession ss);
}
