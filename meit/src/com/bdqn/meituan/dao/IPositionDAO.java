package com.bdqn.meituan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.bdqn.meituan.vo.Letters;
import com.bdqn.meituan.vo.Position;

public interface IPositionDAO {
	//查询出所有的省
	@Select("SELECT A.AREAID, A.AREANAME FROM AREA A WHERE SUPERID = 0")
	public List<Position> findAllProvinces();
	//根据省名查询出所有的市
	@Select("SELECT A.AREAID, A.AREANAME FROM AREA A WHERE A.SUPERID = (SELECT AR.AREAID FROM AREA AR WHERE AR.AREAID =#{areaid})")
	public List<Position> findSpecCitys(int areaid);
	
	//查询所有的地区的首字母
	public List<Letters> findLetter_Areas();
	
}
