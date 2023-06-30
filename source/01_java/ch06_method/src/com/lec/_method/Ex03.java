package com.lec._method;
public class Ex03 {
	public static void main(String[] args) {
		System.out.println("-9의 절대값은 : " + Arithmetic.abs(-9)); //스태틱메소드는 패키지안에 다른파일이어도 사용가능하나 일반메소드는 다른방식이 있다.
		Arithmetic ar = new Arithmetic();
		int tot = ar.sum(11,100);  //ar은 Arithmetic 줄인말
		System.out.println("11부터 100까지 누적합은" +  tot );
		System.out.println(ar.evenOdd(tot));
		tot = ar.sum(10);
		System.out.println("10까지의 합은 " + tot);
		
	}
}
