package com.lec._method;
//sum(int,int), sum(int) - 함수의 오버로딩 / evenOdd(int) / abs(int)절대값
public class Arithmetic {
	public int  sum(int from , int to) { //from부터 to 까지 return
		int result = 0;
		for(int i=from; i<=to; i++) {
			result +=i;
		}
		return result;
	}
	public int sum(int to) { //1~to까지 누적갑 return                     //static 이 없으면 일반 메소드
		int result = 0;												  //static 이 아니면 스태틱 메소드
		for(int i=1; i<=to; i++) {
			result +=i;
		}
		return result;
		}
	
	public String evenOdd(int value) {
		String result = value%2==0 ? "짝수입니다" : "홀수입니다"; 
		return result;
	}
	public static int abs(int value) {
		int result = value>=0? value : -value; //절대값
		return result;
	}
}
