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
				System.out.println("�Է·���"); break;
			case "u": case "U":
				System.out.println("������Ʈ ����"); break;
			case "d": case "D":
				System.out.println("���� ����");
			}
		}while(!fn.equals("x") && !fn.equals("X"));
}
}