package com.lec.ex01_list;

import java.util.ArrayList;
import java.util.Date;
public class Ex03_FriendArrayListMain {
	public static void main(String[] args) {
//		Friend[] fs = new Friend[5];
//		fs [0] = new Friend("ȫ�浿", "010-9999-9999", new Date(98,0,1));
		
		ArrayList<Friend> friends = new ArrayList<Friend>();
		friends.add(new Friend("ȫ�浿", "010-9999-9999", new Date(98,0,1)));
		friends.add(new Friend("��浿", "010-8888-8888", new Date(98,6,14)));
		friends.add(new Friend("���浿", "010-7777-7777", new Date(98,6,14)));
		friends.add(new Friend("�ڱ浿", "010-6666-6666", new Date(98,5,14)));
		friends.add(new Friend("���浿", "010-5555-5555", new Date(98,11,4)));
		for(Friend friend : friends) { //Ȯ��for��
			System.out.println(friend);
		}
		for(int idx=0; idx<friends.size(); idx++) {
			System.out.println(idx + " : " + friends.get(idx));
		}
		// 0�� �ε��� ���� ������ �̸��� ����ϼ���
		//Ȯ��for��
		for(Friend friend : friends) {
			System.out.println(friend.getName()); 
			//System.out.print(friend.getName() + "\t"); //���������
		}
		//�Ϲ�for��
		for(int idx=0; idx<friends.size(); idx++) {
			System.out.println(idx + " : " + friends.get(idx).getName());
			//System.out.print(idx + " : " + friends.get(idx).getName() + "\t"); ���������
		}
	}
}
