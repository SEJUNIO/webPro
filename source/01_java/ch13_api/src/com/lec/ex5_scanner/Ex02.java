package com.lec.ex5_scanner;

import java.util.Scanner;
//나이 - 이름 - 
public class Ex02 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("나이? ");
		int age = scanner.nextInt();
		System.out.println("입력한 나이는: " + age);
		System.out.println("이름? ");
		String name = scanner.next();
		System.out.println("입력한 이름은: " + name); //톰크루즈는 안되  //white-space(space, tab, \n) 앞까지 가져옴, 맨앞에 있는 \n은 무시
		System.out.println("주소? ");
		scanner.nextLine(); // 버퍼에 남아있는 \n을 지우는 용도
		String address = scanner.nextLine(); //"\n앞까지 가져오고 \n지움
		System.out.println("입력한 주소는: " + address);
		System.out.println("끝");
		scanner.close();
		
		
		
		
	}
	
}
