package com.lec.ex03_point;
//x,y / infoPrint(��ǥ x,y)
// Point3D P = new Point3D(1,2,3);
public class Point3D extends Point {
	private int z;

	public Point3D(int x, int y, int z) {
		System.out.println("�Ű����� �ִ� Point3D������ - x,y,z�ʱ�ȭ");
		setX(x); //this.x = x; protected�� ����
		setY(y); //this.y = y; protected�� ����
		this.z = z;
	}
	public void infoPrint3D() {
		System.out.println("��ǥ(x,y,z) : " + getX() + "," + getY() + ", " + z);
	}
	//public void infoPrint(); 
}
