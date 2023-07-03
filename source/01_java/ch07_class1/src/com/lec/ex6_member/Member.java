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
		System.out.println("���̵� : " + id);
		System.out.println("�̸� : " + name);
		System.out.println("�̸��� : " + email);
		System.out.println("�ּ� : " + address);
		System.out.println("���� : " + birth);
		System.out.println("���� : " + gender);
	}
	public String infoString() {
		String result = "���̵� : " +id;
		result += "\n�̸� : " + name;
		result += "\n�̸��� : " + email;
		result += "\n�ּ� : " + address;
		result += "\n���� : " + birth;
		result += "\n���� : " + gender;
		return result;
	}

}
