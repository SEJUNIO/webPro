package com.lec.ex01_list;

import java.text.SimpleDateFormat;
import java.util.Date;
public class Friend {
	private String name;
	private String tel;
	private Date birth;
	public Friend(String name, String tel) {
		this.name = name;
		this.tel = tel;
	}
	public Friend(String name, String tel, Date birth) {
		this.name = name;
		this.tel = tel;
		this.birth = birth;
	}
	@Override
	public String toString() {
		if(birth!=null) {
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		return "[name]" + name + "\t[tel]" + tel + "\t[birth]" + sdf.format(birth);
		}
		return "[name]" + name + "\t[tel]" + tel;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getName() {
		return name;
	}
	public Date getBirth() {
		return birth;
	}
}
