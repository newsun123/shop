package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberVo;

@Mapper
public interface MemberMapper {
	public int useridCheck(MemberVo mvo);
	public void memberOk(MemberVo mvo);
	public String loginOk(MemberVo mvo);
	public void addjjim(String pcode,String userid);
	public void addCart(String pcode,String su,String userid);
}
