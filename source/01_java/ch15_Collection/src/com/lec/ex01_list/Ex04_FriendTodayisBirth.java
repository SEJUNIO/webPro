package com.lec.ex01_list;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Ex04_FriendTodayisBirth {
	public static void main(String[] args) {
		ArrayList<Friend> friends = new ArrayList<Friend>(); //2023-07-14
		friends.add(new Friend("ȫ�浿", "010-9999-9999", new Date(98,0,1)));
		friends.add(new Friend("��浿", "010-8888-8888", new Date(98,6,14)));
		friends.add(new Friend("���浿", "010-7777-7777", new Date(98,6,14)));
		friends.add(new Friend("�ڱ浿", "010-6666-6666", new Date(98,5,14)));
		friends.add(new Friend("���浿", "010-5555-5555", new Date(98,11,4)));
		//������ ������ ģ���� ���
		System.out.print("������ ������ ģ���� "); //�ۼ��Ѱ� �̹��� ģ��(������ MM-dd)
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		String nowStr = sdf.format(now); //"07-14"
		boolean none = true;
		for(Friend friend : friends) {
			Date birth = friend.getBirth();
			if(birth!=null && sdf.format(birth).equals(nowStr)) {
				System.out.print("\n" + friend);
				none = false;  //������ ģ�� ã�Ҵ�.
			}//if		 
//				if(birth!=null) { //������ ���� �ƴҶ�
//				String birthStr = sdf.format(birth);
//				if(birthStr.equals(nowStr)) {
//				System.out.print("\n" + friend);
//				searchOk = true; //������ ģ�� ã�Ҵ�
//				}//if		
//			}//if
		}//for
		if(none) {
			System.out.println("�����ϴ�.");
		}//if
		
		
		
		
		
	}//main
}//class













