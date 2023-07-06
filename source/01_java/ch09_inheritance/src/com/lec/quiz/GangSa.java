package com.lec.quiz;

public class GangSa extends Person {
	public static int count=0;
	private String subject;
	public GangSa(String id, String name, String subject) {
		super(id, name);
		this.subject = subject;
		++count;
		setNo("gangsa" + count);
	}
	@Override
	public String infoString( ) {
		return super.infoString() + "\t(°ú¸ñ)" + subject;
	}
}


