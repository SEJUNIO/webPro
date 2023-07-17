package com.lec.quiz;
import java.util.ArrayList;
// ��� ����(�ּҾ�2�ڸ�) �˻�
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;
public class Test {
	public static void main(String[] args) {
		ArrayList<Friend> friends = new ArrayList<Friend>();
		friends.add(new Friend("ȫ�浿","010-9999-9999", "���� ���빮��", 
				new Date(new GregorianCalendar(1998,11,12).getTimeInMillis())));
		friends.add(new Friend("�ű浿", "010-8888-9999", "��⵵ �Ⱦ��", 
				new Date(new GregorianCalendar(1996, 6, 22).getTimeInMillis())));
		friends.add(new Friend("��浿", "010-8888-777", "��õ �߱�", 
				new Date(new GregorianCalendar(1996, 6, 2).getTimeInMillis())));
		friends.add(new Friend("�ڼ���", "010-8888-6666", "���� ��걸", 
				new Date(new GregorianCalendar(1996, 7, 22).getTimeInMillis())));
		friends.add(new Friend("������", "010-8888-5555", "�Ժ� û����", 
						new Date(new GregorianCalendar(1996, 6, 2).getTimeInMillis())));
		Scanner scanner = new Scanner(System.in);
		// �˻��� ���� �Է�(����) => �迭 �˻� (0��° �ε������� ���� ������ ���)
		while(true) {
			boolean searchOk = false; // �� ã�Ҵٸ� �ʱ�ȭ
			System.out.print("�˻��� ������ �Է� (��, ���Ḧ ���Ͻø� x�� �Է��Ͻÿ�) : ");
			String searchWord = scanner.next(); // ���
			if(searchWord.equalsIgnoreCase("x")) break;
			for(Friend friend : friends) {
				String address = friend.getAddress(); // ��⵵ �Ⱦ�� / ���� ���빮��
				String temp = address.substring(0, 2);
				if( searchWord.equals(temp) ) {
					System.out.println(friend);
					searchOk = true;
				}//if
			}//for
			if(!searchOk) { // �ش� ������ ģ���� �� ã��
				System.out.println("�ش� ������ ģ���� �����ϴ�");
			}//if
		}//while
	}//main
}//class