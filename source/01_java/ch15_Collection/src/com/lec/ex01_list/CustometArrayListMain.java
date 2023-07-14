package com.lec.ex01_list;
//N(n)�Է��� �� ���� ���̸�, ��ȭ, �ּҸ� �Է¹޾� arrayList�� add
//N(n)�� �Է��ϸ� ������ ������ ���(arrayList for���� ���)
import java.util.ArrayList;
import java.util.Scanner;
public class CustometArrayListMain {
	public static void main(String[] args) {
		ArrayList<Customer> customers = new ArrayList<Customer>(); //������ ȸ������ add
		Scanner scanner = new Scanner(System.in);
		String answer, name, tel, address;
		//N(n)�Է��� �� ���� ���̸�, ��ȭ, �ּҸ� �Է¹޾� arrayList�� add			
		while(true) {
			System.out.print("ȸ�������� �����Ͻðڽ��ϱ�(Y/N)?");
			answer = scanner.nextLine();
			if(answer.equalsIgnoreCase("n")) break;
			System.out.println("�̸�, ��ȭ��ȣ, �ּ� �Է¹޾� customer��ü ����� Customers.add�ϱ�");
			System.out.print("�̸�?");
			name = scanner.nextLine();
			System.out.print("��ȭ?");
			tel = scanner.nextLine();
			System.out.println("�ּ�?");
			address = scanner.nextLine();
			//Customers.add();
			customers.add(new Customer(name, tel, address));
			
		}
		//N(n)�� �Է��ϸ� ������ ������ ���(arrayList for���� ���)
		if(customers.size()==0) {
			System.out.println("������ ȸ���� �����ϴ�");
		}else {
			//Customers ��� (Ȯ��for��, �Ϲ� for��)
			for(Customer customer : customers) {
				System.out.println(customer);
			}
		}
		
	}
}
