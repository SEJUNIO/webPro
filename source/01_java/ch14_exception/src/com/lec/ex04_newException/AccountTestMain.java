package com.lec.ex04_newException;

public class AccountTestMain {
	public static void main(String[] args) {
		Account hong = new Account("011-1234", "ȫ�浿", 10000);
		//System.out.println(hong);	
		System.out.println(hong);
		Account hong1 = new Account("012-9875", "ȫ����");
		System.out.println(hong1);
		try {
			hong.withdraw(5000);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		try {
			hong1.withdraw(10);  //�ܾ��� �����ϸ� ���� �Ұ�
		}catch (Exception e) {
			System.out.println("���� �޼��� : " + e.getMessage());
		}
		
		hong1.deposite(100000);
	}
}
