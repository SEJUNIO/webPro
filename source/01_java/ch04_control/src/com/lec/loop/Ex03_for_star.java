package com.lec.loop;
/* * * * * 5개
 * * * * 4개
 * * * 3개
 * * 2개
 */
public class Ex03_for_star {
	public static void main(String[] args) {
		for(int i=5; i>=1; i--) { //5번 반복
			for(int j=1; j<=i; j++) { //1번반복
				System.out.print("* ");
			}
			System.out.println(); //개행만
		}
	}
}
