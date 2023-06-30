package com.lec.Quiz;

public class Quiz2 {
	public static void main(String[] args) {
		int[] arr = {10,20,30,40,50,12,13};
		int temp = 0;
		for(int i=0; i<arr.length; i++ ) {
			for(int j =0; j<arr.length; j++);
			temp += arr[i] ;				
		}
		System.out.println("배열의 총 합은 : " + temp);
	}
}
