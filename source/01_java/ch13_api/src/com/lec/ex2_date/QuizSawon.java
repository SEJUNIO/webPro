package com.lec.ex2_date;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
public class QuizSawon {
	public static final String COMPUTER = "COMPUTER";
	public static final String PLANNING = "PLANNING";
	public static final String DESIGN   = "DESIGN";
	private String no;       // ���
	private String name;     // �̸�
	private String dept;     // �μ�
	private Date hiredate;   // �Ի���
	public QuizSawon(String no, String name, String dept) {
		this.no = no;
		this.name = name;
		this.dept = dept;
		hiredate = new Date();
	}
	public QuizSawon(String no, String name, String dept, int y, int m, int d) {
		this.no   = no;
		this.name = name;
		this.dept = dept;
		// Ư���� y�� m�� d�Ϸ� �ʱ�ȭ
		// hiredate = new Date(y-1900, m-1, d);
		hiredate = new Date(new GregorianCalendar(y, m-1, d).getTimeInMillis()); 
	}
	public String infoString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy��M��d��");
		return "[���]"+no+"\t[�̸�]"+name + "\t[�μ�]" + dept + "\t[�Ի���]" 
				+ sdf.format(hiredate);
	}
	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return "[���]"+no +"\t[�̸�]" + name + "\t[�μ�]" + dept + "\t[�Ի���]"
				+ sdf.format(hiredate);
	}
}