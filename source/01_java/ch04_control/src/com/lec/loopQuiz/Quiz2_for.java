package com.lec.loopQuiz;
//1~10까지 숫자 중 짝수의 합과 홀수의 합을 구해보자
public class Quiz2_for {
	public static void main(String[] args) {
		int tot = 0; // 홀수 누적 변수
			for(int i=1; i<11; i++) {
				if(1%2 !=0) {
					tot += i;
				}
			}//for
			System.out.println("1~10까지의 홀수의 합은 " + tot);
	}
}
