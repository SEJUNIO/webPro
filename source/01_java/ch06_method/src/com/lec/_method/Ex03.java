package com.lec._method;
public class Ex03 {
	public static void main(String[] args) {
		System.out.println("-9�� ���밪�� : " + Arithmetic.abs(-9)); //����ƽ�޼ҵ�� ��Ű���ȿ� �ٸ������̾ ��밡���ϳ� �Ϲݸ޼ҵ�� �ٸ������ �ִ�.
		Arithmetic ar = new Arithmetic();
		int tot = ar.sum(11,100);  //ar�� Arithmetic ���θ�
		System.out.println("11���� 100���� ��������" +  tot );
		System.out.println(ar.evenOdd(tot));
		tot = ar.sum(10);
		System.out.println("10������ ���� " + tot);
		
	}
}
