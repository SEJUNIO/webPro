package com.lec.ex4_shape;

import cons.Constant;

public class Circle extends Shape{
	private int r;
	private final double PI = 3.141592;
	public Circle() {}
	public Circle(int r) {
		this.r =r;
	}
	@Override
	public double area() {
		return Constant.PI *r *r;
	}
	@Override
	public void draw() {
		System.out.print("¿ø");
		super.draw();
	}
	
	
	
}
