package com.lec.quiz;

import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;

public class MemberTestMain_printWriter {
	public static void main(String[] args) {
		OutputStream os         = null;
		Writer       writer     = null;
		PrintWriter printWriter = null;
		try {
			printWriter = new PrintWriter("D:\\webpro\\source\\01_java\\ch16_io\\src\\com\\lec\\quiz\\member.txt");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		
		
		
		
	}
}
