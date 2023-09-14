package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberVo;
import com.example.demo.vo.MtmVo;
import com.example.demo.vo.ReviewVo;

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
	public void reviewOk(ReviewVo rvo);
	public void chgProduct(String pcode);
	public void chgGumae(int no);
	public void mtmOk(MtmVo mvo);
	public ArrayList<HashMap> getReview(String userid);
	public ArrayList<HashMap> getQuest(String userid);
	public ArrayList<HashMap> getMtm(String userid);
	public void reviewUpdate(ReviewVo rvo);
	public void proChgStar(String pcode);
	public void reviewDel(int no);
	public void setSangp(int no);
}
