package com.lec.ex6_person;

public class PersonTestMain {
	public static void main(String[] args) {
		PersonInfo p1;
		p1 = new PersonInfo("ȫ�浿", 22, 'm');
		p1.print();
		PersonInfo p2 = new PersonInfo();
		System.out.println(p2.infoPrint());
	}
}
