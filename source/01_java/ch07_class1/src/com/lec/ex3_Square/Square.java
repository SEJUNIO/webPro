package com.lec.ex3_Square;
//�Ӽ�, [������ �Լ�, ] �޼ҵ�, [setter&getter]
// Square s = new Square()
// Square s = new Square(10)
public class Square {
	private int side; //����Ÿ
	public Square( ) { //������ �Լ� : return Ÿ���� ���� Ŭ������� ���� �̸��� �Լ�
		System.out.println("�Ű����� ���� ������ �Լ� ȣ��");
	}
	public Square(int side) { //������ �Լ��� �뵵 : ������ �ʱ�ȭ
		this.side = side;
		System.out.println("�Ű����� �ִ� ������ �Լ� ȣ��");
	}
	public int area() {
		return side * side;
	}
	//s1, setSide 
	public void setSide(int side) {
		this.side = side;
	}
	public int getSide() {
		return side;
	}
}
