package com.bdqn.meituan.vo;

import java.util.ArrayList;
import java.util.List;

public class Letters {
	private String letter;
	private List<Position> areas=new ArrayList<Position>(0);
	public List<Position> getAreas() {
		return areas;
	}
	public void setAreas(List<Position> areas) {
		this.areas = areas;
	}
	public String getLetter() {
		return letter;
	}
	public void setLetter(String letter) {
		this.letter = letter;
	}
}
