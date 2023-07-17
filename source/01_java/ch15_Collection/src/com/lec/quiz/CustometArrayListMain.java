package com.lec.quiz;
//N(n)입력할 때 까지 고객이름, 전화, 주소를 입력받아 arrayList에 add
//N(n)을 입력하면 가입한 고객정보 출력(arrayList for문을 출력)
import java.util.ArrayList;
import java.util.Scanner;
public class CustometArrayListMain {
	public static void main(String[] args) {
		ArrayList<Customer> customers = new ArrayList<Customer>(); //가입한 회원정보 add
		Scanner scanner = new Scanner(System.in);
		String answer, name, tel, address;
		//N(n)입력할 때 까지 고객이름, 전화, 주소를 입력받아 arrayList에 add			
		while(true) {
			System.out.print("회원가입을 진행하시겠습니까(Y/N)?");
			answer = scanner.nextLine();
			if(answer.equalsIgnoreCase("n")) break;
			System.out.println("이름, 전화번호, 주소 입력받아 customer객체 만들어 Customers.add하기");
			System.out.print("이름?");
			name = scanner.nextLine();
			System.out.print("전화?");
			tel = scanner.nextLine();
			System.out.println("주소?");
			address = scanner.nextLine();
			//Customers.add();
			customers.add(new Customer(name, tel, address));
//			Customer customer = new Customer(); //customer.name = null,  tel =null, address=null
//			System.out.print("이름 ? ");
//			customer.setName(scanner.nextLine());
//			System.out.print("전화번호 ? ");
//			customer.setTel(scanner.nextLine());
//			System.out.print("주소 ? ");
//			customer.setAddress(scanner.nextLine());
//			customers.add(customer);
			
		}
		//N(n)을 입력하면 가입한 고객정보 출력(arrayList for문을 출력)
		if(customers.size()==0) {
			System.out.println("가입한 회원이 없습니다");
		}else {
			//Customers 출력 (확장for문, 일반 for문)
			for(Customer customer : customers) {
				System.out.println(customer);
			}
		}
		
	}
}
