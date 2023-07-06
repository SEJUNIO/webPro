package com.lec.quiz;

public class Staff extends Person{
	public static int count=0;
	private String department;
	public Staff(String id, String name, String department) {
		super(id, name);
		this.department = department;
		++count;
		setNo("staff" + count);
	}
	@Override
	public String infoString() {
		return super.infoString() + "\t(ºÎ¼­)" + department;
	}

}
