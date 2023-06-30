package com.lec.ex;
//1~10까지 정수의 합과 그 결과가 짝수인지 홀수인지 출력
public class Ex01 {
	public static void main(String[] args) {
		int tot =0; //값을 누적하는 변수
		for(int i=1; i<=10; i++) {
			tot += i;
		}
		System.out.println("1~10까지 정수의 합은 : " + tot);
		System.out.println( tot%2==0 ? "짝수입니다" : "홀수입니다"); //tot를 2로 나눈 값이 0이면 짝수이냐 홀수이냐
		// 11~100까지 정수의 합과 그 결과가 짝수인지 홀수인지 출력
		tot=0;
		for(int i =11; i<=100; i++) {
			tot +=i;
		}
		System.out.println("11~100까지 정수의 합은 : " + tot);
		System.out.println( tot%2==0 ? "짝수입니다" : "홀수입니다"); //tot를 2로나눈값이 0이면 짝수이냐 홀수이냐
	} 
}
