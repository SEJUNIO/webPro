package com.lec.ex;
//일반for문 vs 확장for문 (Array,AraayList에서만)
public class Ex02_out {
	public static void main(String[] args) {
	double[] arr = {990,987,920}; // {0,0,0}
	//확장 for문(배열 값만 배열 출력)
	for(double a : arr) {
		System.out.println(a);
	}
	
	
	// 일반 for문(인덱스와 값을 같이 출력)
	for(int idx=0; idx<arr.length; idx++) {
		System.out.printf("arr[%d] = %.1f\t", idx, arr[idx]);
	}
	// 배열값을 변경(10%증가)
	System.out.println("10%증가");
//	for(double a : arr) { //확장for문을 이용한 값 변경은 불가
//		a *= 1.1;
//	}
	System.out.println("10%증가");
	for(int idx=0; idx<arr.length; idx++) {
		arr[idx] *= 1.1; // arr[idx] = arr[idx] *1.1;
	}
	for(double a : arr) {
		System.out.print(a + "\t");
	}
}

}
