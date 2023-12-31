package com.lec.quiz;

import java.util.Date;
import java.text.SimpleDateFormat;
//new Friend("홍", "010-9999-9999", "서울 서대문구", new Date(98,11,12) 
//new Friend("홍", "010-9999-9999", "서울 서대문구", new Date(new GregorianCalendar(1998,11, 12).getTime~() 
public class Friend {
	private String name;
	private String tel;
	private String address;
	private Date birthday;
	public Friend(String name, String tel, String address, Date birthday) {
		this.name = name;
		this.tel = tel;
		this.address = address;
		this.birthday = birthday;
	}
	@Override
	public String toString() {
		if(birthday!=null) {
			SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
			return "이름:"+name +"\n주소:" + address + "\n핸드폰:"+tel +"\n생일:"+sdf.format(birthday) +"\n";
		}
		return "이름:"+name +"\n주소:" + address + "\n핸드폰:"+tel;
	}
	//getter
	public Date getBirthday() { //내 객체의 벌스데이를 가져온다.
		return birthday;
	}
	public String getName() {
		return name;
	}
	public String getTel() {
		return tel;
	}
	public String getAddress() {
		return address;
	}
	
	}
