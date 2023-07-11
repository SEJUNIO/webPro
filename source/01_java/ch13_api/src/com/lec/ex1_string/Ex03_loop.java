package com.lec.ex1_string;

import java.util.Scanner;

public class Ex03_loop {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String fn;
		do {
			System.out.print("I:input, U:update, D:delte, X:exit ?");
			fn = scanner.next(); // i, I, U, u, d, D, X, x ...
			switch(fn) {
			case "i": case "I":
				System.out.println("입력로직"); break;
			case "u": case "U":
				System.out.println("업데이트 로직"); break;
			case "d": case "D":
				System.out.println("삭제 로직");
			}
		}while(!fn.equals("x") && !fn.equals("X"));
}
}
