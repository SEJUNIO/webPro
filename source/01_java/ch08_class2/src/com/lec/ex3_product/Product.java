package com.lec.ex3_product;
// 데이터:serialNo
public class Product {
	private int serialNo;
	public static int count = 100; // 초기값  //static이 있으면 공유한다.
	public Product( ) {   //생성자함수
		serialNo = ++count;
	}
	public static void staticMethod(){
		System.out.println("static 메소드");
	}
	public void infoPrint() {
		System.out.println("시리얼번호 : " + serialNo + "\t공유변수 count : " + count);
	}
	public int getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}
}
