package com.lec.Quiz;

public class Quiz1 {
	public static void main(String[] args) {
		int[] arr = {76,45,34,89,100,50,90,92};
		for(int i=0; i<arr.length-1; i++) {
			for(int j=i+1; j<arr.length; j++) {
				if(arr[i] > arr[j]) {
					int temp = arr[i];				
					arr[i] = arr[j];
					arr[j] = temp;
				}
			}
		}
		for(int i=0; i<arr.length; i++) {                    //for(int a : arr) {
			System.out.print(arr[i]+" ");                   //System.out.print(a + "\t");
		}
	} //for -j		
}


