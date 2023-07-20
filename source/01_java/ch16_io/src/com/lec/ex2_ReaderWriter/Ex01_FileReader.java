package com.lec.ex2_ReaderWriter;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
// ����������(��Ʈ�� ��ü ����) -> �����͸� �д´�(read()�޼ҵ� ���) -> ������ �ݴ´�
public class Ex01_FileReader {
	public static void main(String[] args) {
		Reader reader = null;
		try {
			reader = new FileReader("txtFile/inTest.txt"); // 1. ������� ������ ����
			//reader = new FileReader("D:\\webpro\\source\\01_java\\ch16_io\\txtFile\\inTest.txt"); //������
			// 2. �����͸� �д´�
			while(true) {
				int i = reader.read(); //2����Ʈ ������ ����
				if(i==-1) break;
				System.out.print((char)i + "(" + i + ")");
			}	
			System.out.println("DONE");
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());			
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try { // 3. ������ �ݴ´�
				if (reader != null)
					reader.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}