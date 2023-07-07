package com.lec.ex06_book;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Book [] books = {new Book("890-��01", "java", "������"),
					  new Book("890-��02", "oracle", "���浿"),
					  new Book("890-��03", "mysql", "���̵�"),
					  new Book("890-��04", "jdbc", "������"),
					  new Book("890-��05", "html", "�̿�ġ")};
		Scanner scanner = new Scanner(System.in);
		int fn ;  // ��ɹ�ȣ(1:����, 2:�ݳ� ,3:ålist���, 0:����)
		int idx;  // �����ϰų� �ݳ��� �� ��ȸ�� å�� index
		String bTitle, borrower, checkOutDate; //����ڿ��� �Է¹��� å�̸�, ������, ������
		do {
				System.out.print("1:���� | 2:�ݳ� | 3:ålist | 0:����");
				fn = scanner.nextInt(); //white-space���� �Էµ� ������ ����
			switch(fn) {
			case 1: //����1.å�̸��Է� 2. å��ȸ  3.å����Ȯ�� 4.������  5.������ 6.checkOut(������,������)�޼ҵ� ȣ��
				// 1. å�̸� �Է�
				System.out.println("������ å �̸���?");
				bTitle = scanner.next();  //white-space�ձ��� �Էµ� ��Ʈ���� ����
				// 2. å��ȸ
				for(idx=0; idx<books.length; idx++) {
					if(books[idx].getBookTitle().equals(bTitle)) {
						break; //for���� ��������
					}
				}
				if(idx == books.length) {
					System.out.println("���� �������� �ʴ� �����Դϴ�");
				}else { // book[idx] ������ ����				
				// 3. å ����Ȯ��
				if(books[idx].getState() == Book.STATE_BORRODWD) { //������
					System.out.println("�������� �����Դϴ�");
				}else {		 //books[idx] ������ ���� ó��		
					// 4. ������ �Է�
					System.out.print("������ ?");
					borrower = scanner.next();
					// 5. ������ �Է�
					System.out.println("�������� (07-07)?");
					checkOutDate = scanner.next(); 
					// 6. checkOut �޼ҵ� ȣ�� 
					books[idx].checkout(borrower, checkOutDate); 
				}
			}
				break;
			case 2: 
				System.out.println("�ݳ� ����"); break;
			case 3: 
				for(Book book : books) {
					book.printState();
				}
			}
		}while(fn!=0);{
		System.out.println("BYE");
	}
}
}
