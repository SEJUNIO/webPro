package com.lec.loop;
//15 16 17 18 19
//20 21 22 23 24
// ~ 50
public class Ex04_for {
	public static void main(String[] args) {
		for(int i=15; i<=50; i++) {
			System.out.print(i + "\t");  //'\t' => 문자 1개
			if(i%5 ==4) {
				System.out.println(); //개행만
			}
		}
	}
}
