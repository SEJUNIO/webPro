package com.lec.ex2_date;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
public class Ex06 {
	public static void main(String[] args) {
		//Date birth = new Date(1996-1990, 0, 20);
		Date birth = new Date(new GregorianCalendar(1996, 0, 20).getTimeInMillis());
		SimpleDateFormat sdf1 = new SimpleDateFormat("»ý³â¿ùÀÏÀº yyyy³â MM¿ùddÀÏ");
		SimpleDateFormat sdf2 = new SimpleDateFormat("MM-dd");
		System.out.println(sdf1.format(birth));
		System.out.println(sdf2.format(birth));
	}
}