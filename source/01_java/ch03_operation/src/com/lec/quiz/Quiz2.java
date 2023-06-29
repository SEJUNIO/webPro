package com.lec.quiz;
import java.util.Scanner;
//입력한 수의 짝/홀수 여부 출력
public class Quiz2{
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("수 입력  : ");
		int i = sc.nextInt(); 
		int resuit = i%2;
		System.out.println((resuit==0)? "입력한 수는 짝수" : "입력한 수는 홀수");
		sc.close();
		}
	}
