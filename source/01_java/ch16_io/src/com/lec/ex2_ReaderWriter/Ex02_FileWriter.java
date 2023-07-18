package com.lec.ex2_ReaderWriter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
public class Ex02_FileWriter {
	public static void main(String[] args) {
		Writer writer = null;
		try {
			writer = new FileWriter("src/com/lec/ex2_ReaderWriter/outTest.txt", true); //<1> //��������Ʈ ����
//			char[] msg = {'��','��','!',' ','H','i', '\n'};
//			for(char m :msg) {
//				writer.write(m); // <2>
//			}
			String msg = "�ȳ�! Hi\n�帶ö �ǰ������ϼ���\n";
			writer.write(msg);
			msg = "�����ֱ��� ��´��. ��θ�� �ǼۻǼ�\n";
			writer.write(msg);
			System.out.println("���� Ǯ�� �Ϸ�");
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(writer != null) writer.close();   //<3>
			}catch(IOException e) {
				System.out.println(e.getMessage()); 
			}
		}
	}
}
