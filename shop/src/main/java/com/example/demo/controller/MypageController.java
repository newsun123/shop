package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.example.demo.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	@Qualifier("mys")
	private MypageService service;
}
