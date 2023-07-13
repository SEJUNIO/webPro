package com.lec.ex4_object;
//��ȭ��ȣ ��4�ڸ��˻� 
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;
public class Ex04_FriendMain {
	public static void main(String[] args) {
		Friend[] friends ={ new Friend("ȫ�浿", "010-9999-9999", "���� ���빮��",
					new Date(new GregorianCalendar(1998, 11, 12).getTimeInMillis())),
						 	new Friend("�ű浿", "010-8888-9999", "��⵵ �Ⱦ��",
					new Date(new GregorianCalendar(1996, 6, 22).getTimeInMillis())),
						 	new Friend("�ڹ���", "010-8888-1234", "���� �߱�",
					new Date(new GregorianCalendar(1997, 6, 2).getTimeInMillis())),
						 	new Friend("�ڼ���", "010-8888-7777", "�Ⱦ� ���ȱ�",
					new Date(new GregorianCalendar(1981, 7, 22).getTimeInMillis())),
						 	new Friend("������", "010-8888-5555", "�Ժ� û����",
					new Date(new GregorianCalendar(1996, 6, 2).getTimeInMillis()))};
				Scanner scanner = new Scanner(System.in);		 
				//�˻��� ���� �Է�(����) => �迭 �˻�(0��° �ε������� ���� ������ ���)
				while(true) {
					boolean searchOk = false; //�� ã�Ҵٸ� �ʱ�ȭ
					System.out.print("�˻��� ��ȭ��ȣ ��4�ڸ��Է�(��, ���Ḧ ���Ͻø� x�� �Է��Ͻÿ�) : ");
					String searchWord = scanner.next(); //��⵵
					if(searchWord.equalsIgnoreCase("x")) break;
					for(Friend friend : friends) {
						String tel = friend.getTel(); //010-8888-8888
						int spaceIdx = tel.lastIndexOf("-");
						String temp = tel.substring(spaceIdx+1);
						if(searchWord.equals(temp) ) {
							System.out.println(friend);
							searchOk = true;
						}//if
					}//for
					if(!searchOk) { //�ش������ ģ���� ��ã��   //searchOk ==false : �� ���� �ƴ� ����� �������� !searchOk : �̰� �� ������ ����
						System.out.println("�ش� ��ȭ��ȣ ��2�ڸ��� ģ���� �����ϴ�");
					} //if
				}//while
				scanner.close();
			} //main
}//class

