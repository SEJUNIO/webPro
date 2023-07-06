package com.lec.ex08_customer;
public class TestMain {
	public static void main(String[] args) {
		Customer customer = new Customer("È«±æµ¿", "010-9999-9999", "2023-07-05", "12-01");
		System.out.println(customer.infoString());
		customer.buy(500000);
		customer.buy(710000);
		Staff staff = new Staff("È«±æ¼ø", "010-8888-8888", "2023-07-04", "12-01");
		
		Person[] person = {customer, staff};
		for(int idx=0 ; idx<person.length ; idx++) {
			System.out.println(person[idx].infoString());
		}
		for(Person p : person) {
			System.out.println(p.infoString());
		}
	}
}