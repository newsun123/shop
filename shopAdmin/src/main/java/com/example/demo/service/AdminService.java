package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.example.demo.vo.BaesongVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.QuestVo;

public interface AdminService {

	public String productAdd(Model model);
	public String getJung(HttpServletRequest request);
	public String getSo(HttpServletRequest request);
	public String getPcode(HttpServletRequest request);
	public void test();
	public String productAddOk(HttpServletRequest request);
	public String gumaeState(Model model);
	public ProductVo getProduct(HttpServletRequest req);
	public BaesongVo getBaesong(HttpServletRequest req);
	public String stateChange(HttpServletRequest req);
	public String memberlist(Model model);
	public String memberout(HttpServletRequest req);
	public String plist(Model model);
	public String adminReview(HttpServletRequest req,Model model);
	public String reviewDel(HttpServletRequest req);
	public String answerlist(Model model);
	public String questOk(QuestVo qvo);
}
