package com.lec.ex03_point;
//x,y / infoPrint(좌표 x,y)
// Point3D P = new Point3D(1,2,3);
public class Point3D extends Point {
	private int z;

	public Point3D(int x, int y, int z) {
		System.out.println("매개변수 있는 Point3D생성자 - x,y,z초기화");
		setX(x); //this.x = x; protected만 가능
		setY(y); //this.y = y; protected만 가능
		this.z = z;
	}
	public void infoPrint3D() {
		System.out.println("좌표(x,y,z) : " + getX() + "," + getY() + ", " + z);
	}
	//public void infoPrint(); 
}
