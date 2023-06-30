package com.lec.ex;

import com.lec._method.Arithmetic;   // 패키지가 다르면 임폴트를 따로 해줘야한다.

public class Ex03 {
	public static void main(String[] args) {
		System.out.println("-9의 절대 값 :" +Arithmetic.abs(-9));
		Arithmetic arithmetic = new Arithmetic();
		int tot = arithmetic.sum(10);
		System.out.println("합은" + tot);
		System.out.println(arithmetic.evenOdd(tot));
		tot= arithmetic.sum(10, 100);
		System.out.println("합은" + tot);
		System.out.println(arithmetic.evenOdd(tot));
		
	}
}
