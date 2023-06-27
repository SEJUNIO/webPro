package com.lec.ex;
//기본데이터타입(기초데이터타입; 소문자시작) vs. 참조데이터타입(객체대이터타입; 대문자 시작)
public class VarEx06 {
	public static void main(String[] args) {
		//기본데이터타입
		int i;
		i = 10;
		//참조데이터타입(객체데이터타입)
		String name;
		name = "KIM";
		System.out.println("name = " + name);
		name = "김수한무";	
		System.out.println("name = " + name);
	}
}
		//system.out.println() 개행포함
		//system.out.print() 개행미포함
		//system.out.printf() ("출력포맷", %대응변수)