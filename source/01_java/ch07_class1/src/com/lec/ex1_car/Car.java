package com.lec.ex1_car;
//Ŭ���� => ��ü(������,�޼�Ʈ) Car car = new Car();
public class Car {
	String color; //��������
	int cc; // ���� ��ⷮ
	int speed; //�ӵ�
	public void park() {
		speed =0;
		System.out.println(color + " �� �� ������. ���� �ӵ���" + speed);
	}
	public void drive() {
		speed = 60;
		System.out.println(color + "�� �� ������. ���� �ӵ��� " + speed);
	}
	public void race() {
		speed = 120;
		System.out.println(color+ "�� �� ���̽���. ���ݼӵ��� " + speed );
	}
}
