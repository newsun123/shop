package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MypageMapper;

@Service
@Qualifier("mys")
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageMapper mapper;
}
