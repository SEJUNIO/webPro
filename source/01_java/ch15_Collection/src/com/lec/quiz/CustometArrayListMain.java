package com.lec.quiz;
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
//			Customer customer = new Customer(); //customer.name = null,  tel =null, address=null
//			System.out.print("�̸� ? ");
//			customer.setName(scanner.nextLine());
//			System.out.print("��ȭ��ȣ ? ");
//			customer.setTel(scanner.nextLine());
//			System.out.print("�ּ� ? ");
//			customer.setAddress(scanner.nextLine());
//			customers.add(customer);
			
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
