package com.bdqn.meituan.service;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.meituan.dao.IPositionDAO;
import com.bdqn.meituan.vo.Position;

@Service
@Transactional
public class RegisterService {
	@Autowired
	private IPositionDAO ipdao;
	public String getProvs(){
		List<Position> pros=ipdao.findAllProvinces();
		ObjectMapper om=new ObjectMapper();
		String provs=null;
		try {
			provs= om.writeValueAsString(pros);
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
		return provs;
	}
}
