package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.BaesongVo;
import com.example.demo.vo.CompVo;
import com.example.demo.vo.DaeVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.JungVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.SoVo;

@Mapper
public interface AdminMapper {
	public ArrayList<DaeVo> getDae();
	public ArrayList<CompVo> getComp();
	public ArrayList<JungVo> getJung(String dae);
	public ArrayList<SoVo> getSo(String daejung);
	public int getPcode(String pcode);
	public ArrayList<ProductVo> getTest();
	public void setPcode(int no,String pcode);
	public void productAddOk();
	public ArrayList<GumaeVo> gumaeState();
	public ProductVo getProduct(String pcode);
	public BaesongVo getBaesong(String no);
	public void stateChange(String state,String no);
}
