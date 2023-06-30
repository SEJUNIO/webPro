package com.lec.test;

public class ProgramingLan {
	public static void main(String[] args) {
		int  arr[] = {76,46,34,89,100,50,90,93};
		int sum =0;
		int average = 0;
		for(int i=0; i<arr.length; i++ ) {
		sum += arr[i] ;	
		average = sum /arr.length;
		}
		System.out.println("합계 : " + sum);
		System.out.println("평균 : " + average);
		
		int min=0; 
		int	max=999;
		for(int i=0; i<arr.length; i++ ) {
			if(sum <min) {
				min = sum;
	}
			if(sum> max) {
				max = sum;
			}
			System.out.println("최대값 : " + max + "-" + arr.length);
			System.out.println("최소값 : " + sum + "-" + arr.length);
		}
	}
}
