package com.lec.loop;
/* *
 * **
 * ***
 * ****
 * *****
 * ****** */
public class Ex03for {
	public static void main(String[] args) {
		for(int i=5; i>=1; i-- ) { //5번반복
			for(int j=1; j<=i; j++) { // i번반복
				System.out.print("*");
		} //for-j
		System.out.println(); //개행만
		}//for
	}//main
}
