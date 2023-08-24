package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.ProductVo;

@Mapper
public interface ProductMapper {
	public ArrayList<ProductVo> prolist(String pcode,String str,int index);
	public int getChong(String pcode);
	public String getDaeName(String dae);
	public String getJungName(String daecode,String jung);
	public String getSoName(String daecode,String so);
	public ProductVo procontent(String pcode);
	public String getComp(String code);
	public void addjjim(String pcode,String userid);
    public void deljjim(String pcode, String userid);
    public boolean isjjim(String pcode,String userid);
    public void cartAdd(String pcode,int su,String userid);
    public ProductVo isCart(String pcode,String userid);
    public void cartUp(int hap,int no);
    public ArrayList<HashMap> cartView(String userid);
    public void changeSu(String su,String no);
    public void cartDel(String no);
    public ArrayList<HashMap> jjimView(String userid);
    public void jjimToCart(String pcode,String userid,int su);
    public void jjimDel(String pcode,String userid);
}
