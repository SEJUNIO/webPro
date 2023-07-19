package com.lec.quiz;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Member {
	private String name;
	private String tel;
	private Date bitrhday;
	private String address;

	public Member(String name, String tel, Date bitrhday, String address) {
		this.name = name;
		this.tel = tel;
		this.bitrhday = bitrhday;
		this.address = address;
	}

	@Override
	public String toString() {
		if (bitrhday != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
			return name + "\t" + tel + "\t" + sdf.format(bitrhday) + "생" + "\t" + address + "\n";
		}
		return name + "\t" + tel + "\t생일모름\t" + address+"\n";

	}
}
