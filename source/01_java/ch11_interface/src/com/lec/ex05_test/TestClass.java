package com.lec.ex05_test;

public class TestClass implements I3{

	@Override
	public void m1() {
		System.out.println("상수i1 =" +  i1);
	}
	@Override
	public void m2() {
		System.out.println("상수i2 =" +  i2);
	}
	@Override
	public void m3() {
		System.out.println("상수i3 =" +  i3);
	}

}
