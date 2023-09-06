package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberVo;

@Mapper
public interface MypageMapper {

	public MemberVo myinfo(String userid);
	public void mynamechg(String userid,String name);
	public void myphonchg(String userid,String phone);
	public void myemailchg(String userid,String email);
	public String getPwd(String userid);
	public void chgPwd(String pwd, String userid);
	public ArrayList<HashMap> mygumae(String userid);
	public void stateChange(String state,String no);
}
