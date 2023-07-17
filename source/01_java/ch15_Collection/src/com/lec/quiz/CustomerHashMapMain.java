package com.lec.quiz;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;

import org.omg.PortableInterceptor.Interceptor;

public class CustomerHashMapMain {
	public static void main(String[] args) {
		HashMap<String, Customer> customers = new HashMap<String, Customer>();
		Scanner scanner = new Scanner(System.in);
		String answer, name, tel, address;
		while(true) {
			System.out.println("회원가입 하시겠습니까 (Y/N) ?");
			answer = scanner.nextLine();
			if(answer.equalsIgnoreCase("n")) break;
			System.out.println("이름, 전화번호, 주소 입력받고 Customer에 추가");
			System.out.print("이름: ?");
			name = scanner.nextLine();
			System.out.print("전화번호: ?");
			tel = scanner.nextLine();
			System.out.print("주소: ?");
			address = scanner.nextLine();
			customers.put(tel, new Customer(name, tel, address));
		}
		if(customers.size()==0) {
			System.out.println("가입된 회원은 없습니다");
		}else {
			Iterator<String> iterator = customers.keySet().iterator();
			while(iterator.hasNext()) {
			System.out.println(customers.get(iterator.next()));
			}
			
			}
		}
		
		
	}

