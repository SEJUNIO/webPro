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
		System.out.println("�հ� : " + sum);
		System.out.println("��� : " + average);
		
		int min=0; 
		int	max=999;
		for(int i=0; i<arr.length; i++ ) {
			if(sum <min) {
				min = sum;
	}
			if(sum> max) {
				max = sum;
			}
			System.out.println("�ִ밪 : " + max + "-" + arr.length);
			System.out.println("�ּҰ� : " + sum + "-" + arr.length);
		}
	}
}
