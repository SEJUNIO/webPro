package com.lec.Quiz;

import java.util.Scanner;

public class Quiz2 {
	public static void main(String[] args) {
		int[] arr = {10,20,30,40,50,12,13};
		int temp = 0;
//		for(int idx=0; idx<arr.length; idx++{
//		tot +=arr[idx];
		for(int i=0; i<arr.length; i++ ) {
			temp += arr[i] ;				
		}
		System.out.println("배열의 총 합은 : " + temp);
	}
}
