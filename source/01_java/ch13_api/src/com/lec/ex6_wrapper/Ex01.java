package com.lec.ex6_wrapper;

import com.lec.ex4_object.Card;
public class Ex01 {
	public static void main(String[] args) {
		int i =10;
		Integer iObj = 10;    //new Integer(10) �ڵ�����
		Double dobj = 2.2; //���������� new Double(2.2) �ڵ�����
		i = iObj; //iObj.intValue();
		Card c1 = new Card("��Ʈ", 3);
		Card c2 = new Card("��Ʈ", 3);
		System.out.println(c1.equals(i));
		
	}
}