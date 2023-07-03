package com.lec.ex6_member;

public class Member {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String address;
	private	String birth;
	private char gender;
	
	public Member () {}

	public Member(String id, String pw, String name, String email, String address, String birth, char gender) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.address = address;
		this.birth = birth;
		this.gender = gender;
	}
	public void print ( ) {
		System.out.println("아이디 : " + id);
		System.out.println("이름 : " + name);
		System.out.println("이메일 : " + email);
		System.out.println("주소 : " + address);
		System.out.println("생일 : " + birth);
		System.out.println("성별 : " + gender);
	}
	public String infoString() {
		String result = "아이디 : " +id;
		result += "\n이름 : " + name;
		result += "\n이메일 : " + email;
		result += "\n주소 : " + address;
		result += "\n생일 : " + birth;
		result += "\n성별 : " + gender;
		return result;
	}

}
