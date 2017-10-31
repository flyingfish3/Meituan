package com.bdqn.meituan.service;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bdqn.meituan.dao.IPositionDAO;
import com.bdqn.meituan.vo.Letters;
import com.bdqn.meituan.vo.Position;

@Service
public class PositionService {
	@Autowired
	private IPositionDAO ipdao;
	public List<Position> findAllProvinces(){
		return ipdao.findAllProvinces();
	}
	public String findSpecCitys(int areaid){
		List<Position> citys=ipdao.findSpecCitys(areaid);
		ObjectMapper om=new ObjectMapper();
		String city=null;
		try {
			city = om.writeValueAsString(citys);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return city;
	}
	//查询所有的地区的首字母
	public List<Letters> findLetter_Areas(){
		return ipdao.findLetter_Areas();
	}
}
