package com.lec.ex0_janmuri;
//클래스 // 자바파일에 public class 한개씩 구현
//메인
public class PersonTestMain {
	public static void main(String[] args) {
		PersonInfo person1 = new PersonInfo("홍길동", 22, 'm');
		person1.print();
	}
}
class PersonInfo {
	private String name;
	private int age;
	private char gender;
	public PersonInfo(String name, int age, char gender) {
		this.name = name;
		this.age = age;
		this.gender = gender;
	}
	public void print() {
		System.out.println("이름 : " + name + ", 나이 : " + age +", 성별 : " +gender);
	}
}

