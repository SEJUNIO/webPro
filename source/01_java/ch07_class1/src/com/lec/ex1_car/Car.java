package com.lec.ex1_car;
//클래스 => 객체(데이터,메소드) Car car = new Car();
public class Car {
	private String color; //차량색상    //private은 외부에선 쓸수 없으나
	private int cc; // 차량 배기량
	private int speed; //속도
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
	//color, cc, speed setter 메소드
	public void setColor(String color) {  //
		this.color = color;
	}
	public void setCc (int cc) {
		this.cc = cc;
	}
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	//color, cc, speed getter
	public String getColor() {
		return color;
	}
	public int getCc() {
		return cc;
	}
	public int getSpeed () {
		return speed;
	}
}
