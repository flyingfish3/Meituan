package com.bdqn.meituan.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdqn.meituan.service.PositionService;

@Controller
public class PositionAction {
	@Autowired
	private PositionService ps;
	@RequestMapping("pro.do")
	public String findProvins(HttpSession session){
		ServletContext app=session.getServletContext();
		if(app.getAttribute("provinces")==null){
			app.setAttribute("provinces", ps.findAllProvinces());
		}
		if(app.getAttribute("letterAreas")==null){
			app.setAttribute("letterAreas",ps.findLetter_Areas());
		}
		return "position";
	}
	@ResponseBody
	@RequestMapping("city.do")
	public String findCitys(int areaid){
		return ps.findSpecCitys(areaid);
	}
}
