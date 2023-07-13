package com.lec.ex4_object;

public class Ex03_CardMain {
	public static void main(String[] args) {
		Card c1 = new Card("♥", 3);
		Card c2 = new Card("♥", 3);
		Card c3 = null;
		String str = "str";
		System.out.println(c1);
		System.out.println(c2);
		System.out.println("c1과 c2가 같은 주소인가 ? " + (c1==c2));
		System.out.println("c1과 c2가 같은 카드냐? " + c1.equals(c2));
	}
}
