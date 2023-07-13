package com.lec.ex4_quiz;

public class Point3D {
	private double x;
	private double y;
	private double z;
	
	public Point3D() {}
	public Point3D(double x, double y, double z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}
	@Override
	public String toString() {
		return "ÁÂÇ¥°ªÀº : ["+x+","+y+","+z+"]";			
	}
	@Override
	public boolean equals(Object obj) {
		if(obj!=null && getClass() == getClass()) {
			Point3D other = (Point3D) obj;
			return x==other.x && y==other.y && z==other.z;
		}
		return false;
	}

}

