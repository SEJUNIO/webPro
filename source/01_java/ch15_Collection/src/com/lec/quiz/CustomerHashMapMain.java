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
			System.out.println("ȸ������ �Ͻðڽ��ϱ� (Y/N) ?");
			answer = scanner.nextLine();
			if(answer.equalsIgnoreCase("n")) break;
			System.out.println("�̸�, ��ȭ��ȣ, �ּ� �Է¹ް� Customer�� �߰�");
			System.out.print("�̸�: ?");
			name = scanner.nextLine();
			System.out.print("��ȭ��ȣ: ?");
			tel = scanner.nextLine();
			System.out.print("�ּ�: ?");
			address = scanner.nextLine();
			customers.put(tel, new Customer(name, tel, address));
		}
		if(customers.size()==0) {
			System.out.println("���Ե� ȸ���� �����ϴ�");
		}else {
			Iterator<String> iterator = customers.keySet().iterator();
			while(iterator.hasNext()) {
			System.out.println(customers.get(iterator.next()));
			}
			
			}
		}
		
		
	}

