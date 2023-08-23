package com.example.demo.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;

import com.example.demo.mapper.AdminMapper;
import com.example.demo.vo.CompVo;
import com.example.demo.vo.DaeVo;
import com.example.demo.vo.JungVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.SoVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;

	@Override
	public String productAdd(Model model) {
		ArrayList<DaeVo> list = mapper.getDae();
		model.addAttribute("list",list);
		ArrayList<CompVo> clist= mapper.getComp();
		model.addAttribute("clist",clist);
		return "/product/productAdd";
	}

	@Override
	public String getJung(HttpServletRequest request) {
		String dae = request.getParameter("dae");
		ArrayList<JungVo> list = mapper.getJung(dae);
		String str="<option> 중분류 </option>";
		for(int i=0;i<list.size();i++) {
			str=str+"<option value='"+list.get(i).getCode()+"'>"+list.get(i).getName()+"</option>";
		}
		return str;
	}

	@Override
	public String getSo(HttpServletRequest request) {
		String daejung = request.getParameter("daejung");
		ArrayList<SoVo> list = mapper.getSo(daejung);
		String str = "<option> 소분류 </option>";
		for(int i=0;i<list.size();i++) {
			str=str+"<option value='"+list.get(i).getCode()+"'>"+list.get(i).getName()+"</option>";
		}
		return str;
	}

	@Override
	public String getPcode(HttpServletRequest request) {
		
		String pcode = request.getParameter("pcode");
		int num = mapper.getPcode(pcode);
		//num을 3자리로 만든 뒤 pcode랑 합치기
		String imsi = num+"";
		
		if(imsi.length()==1) {
			imsi="00"+num;
		}else if(imsi.length()==2) {
			imsi="0"+num;
		}
		pcode = pcode+imsi;
		return pcode;
	}

	@Override
	public void test() {
		ArrayList<ProductVo> list = mapper.getTest();
		String[] arr = {"01","02","03","04","05","06","07","08","09","10","11","12"};
		for(int i=0; i<list.size();i++) {
			int chk = (int)(Math.random()*12);
			String pcode = list.get(i).getPcode();
			pcode=pcode.substring(0,7)+arr[chk]+pcode.substring(7);
			mapper.setPcode(list.get(i).getNo(),pcode);
		}
	}

	@Override
	public String productAddOk(HttpServletRequest request) {
		
		int size = 1024*1024*20;
		try {
			
			String path = ResourceUtils.getFile("classpath:static/pro").toPath().toString();
			MultipartRequest multi = new MultipartRequest(request, path,size,"utf-8",new DefaultFileRenamePolicy());
			
			ProductVo pvo = new ProductVo();
			pvo.setPcode(multi.getParameter("pcode"));
			pvo.setPimg(multi.getParameter("pimg"));
			pvo.setDimg(multi.getParameter("dimg"));
			pvo.setBprice(Integer.parseInt(multi.getParameter("bprice")));
			pvo.setBtime(Integer.parseInt(multi.getParameter("btime")));
			pvo.setHalin(Integer.parseInt(multi.getParameter("halin")));
			pvo.setJuk(Integer.parseInt(multi.getParameter("juk")));
			pvo.setNo(Integer.parseInt(multi.getParameter("no")));
			pvo.setPrice(Integer.parseInt(multi.getParameter("price")));
			pvo.setTitle(multi.getParameter("title"));
			
			mapper.productAddOk();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/product/plist";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
