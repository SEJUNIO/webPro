package com.lec.ex1_car;
//클래스 => 객체(데이터,메소트) Car car = new Car();
public class Car {
	String color; //차량색상
	int cc; // 차량 배기량
	int speed; //속도
	public void park() {
		speed =0;
		System.out.println(color + " 색 차 주차함. 지금 속도는" + speed);
	}
	public void drive() {
		speed = 60;
		System.out.println(color + "색 차 운전함. 지금 속도는 " + speed);
	}
	public void race() {
		speed = 120;
		System.out.println(color+ "색 차 레이싱함. 지금속도는 " + speed );
	}
}
