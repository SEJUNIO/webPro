package com.lec.loop;
/* * * * * 5��
 * * * * 4��
 * * * 3��
 * * 2��
 */
public class Ex03_for_star {
	public static void main(String[] args) {
		for(int i=5; i>=1; i--) { //5�� �ݺ�
			for(int j=1; j<=i; j++) { //1���ݺ�
				System.out.print("* ");
			}
			System.out.println(); //���ุ
		}
	}
}
