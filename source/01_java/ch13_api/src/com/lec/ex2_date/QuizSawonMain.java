package com.lec.ex2_date;

public class QuizSawonMain {
	public static void main(String[] args) {
		QuizSawon hong = new QuizSawon("202301", "홍길동", QuizSawon.COMPUTER);
		QuizSawon shin = new QuizSawon("202201", "홍길순", QuizSawon.DESIGN, 2022, 1, 1);
		System.out.println(hong.toString());
		System.out.println(shin);
	}
}