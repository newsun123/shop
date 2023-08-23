package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MainMapper;

@Service
@Qualifier("mains")
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainMapper mapper;

	@Override
	public String main() {
	
		return "/main/main";
	}
}
