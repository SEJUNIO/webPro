package com.lec.ex1_string;

public class Ex01 {
	public static void main(String[] args) {
		int i = 10;
		String str1 = "Java";
		String str2 = "Java";
		String str3 = new String("Java");
		if(str1==str2) {
			System.out.println("str1과 str2는 같은 주소를 참조");
		}else {
			System.out.println("str1과 str2는 다른 주소를 참조");
		}
		System.out.println(str1==str3? "str1과 str3은 같은 주소 " : "str1과 str3은 다른주소");
		str2 = "oracle";
		if(str1 == str2) {
			System.out.println("수정후, str1과 str2은 같은 주소를 얻음");
		}else {
			System.out.println("수정후, str1과 str2는 다른 주소를 얻음");
		}
	}
}
