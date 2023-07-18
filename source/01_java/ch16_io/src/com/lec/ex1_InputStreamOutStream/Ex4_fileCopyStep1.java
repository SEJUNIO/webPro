package com.lec.ex1_InputStreamOutStream;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
//���� ī�� D:/webpro/Download/01.java/bts_7.mp4(7,460,545 byte)
public class Ex4_fileCopyStep1 {
	public static void main(String[] args) {
		long start = System.currentTimeMillis(); //1970.1.1���� ���۽��������� �и�����
		//file Copy ����
		InputStream is =null;
		OutputStream os =null;
		try {
			is = new FileInputStream("D:/webpro/Download/01_java/bts_7.mp4");
			os = new FileOutputStream("D:/webpro/Download/01_java/bts_copy.mp4");
			int cnt = 0;
			while(true) {
				int i = is.read(); //read&write : 7,460,545�� ����
				if(i==-1)break;
				os.write(i); //write
				cnt++;
				if(cnt%1000000==0) {     //100������ ���� �������� 0�̸�
					System.out.println(cnt +"/7,460,545 : " +(int)(cnt/7460545.0 *100) +"%����");
				}
			}
			System.out.println(cnt + "�� while�� �����Ͽ� ���� ����");
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(os!=null) is.close();
			}catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		long end = System.currentTimeMillis();   //1970,1,1���� ������ ���������� �и�����
		System.out.println((end-start)/1000.0 + "�� �ɸ�");
		
		
		
		
	}
}
