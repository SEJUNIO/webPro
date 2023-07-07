package com.lec.ex06_book;
// BOOK book = new Book("890-��01", "Java" "������");
public class Book implements ILendable {
	private String bookNo; 		//û����ȣ
	private String bookTitle;   //å�̸�
	private String writer;      //å����
	private String borrower;    //������
	private String checkOutDate;//������
	private byte state;         //������(1), ���Ⱑ��(0)
		
	public Book(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
//		borrower = null;
//		checkOutData = null;
//		state = 0;
	}

	@Override
	public void checkout(String borrower, String checkOutDate) { //����
		if(state == STATE_BORRODWD) { //�������� �����̸� �޼��� �Ѹ��� �޼ҵ� ��
			System.out.println(bookTitle +" ������ �������Դϴ�");
			return ;
		}
		//state�� 0(STATE NORMAL)�� ���� ����
		this.borrower = borrower;
		this.checkOutDate = checkOutDate;
		state = STATE_BORRODWD; //������ ���·� ��ȯ
		System.out.println(bookTitle + " ������ ����Ǿ����ϴ�");
		System.out.println("������ : " + borrower + "\t������ : " + checkOutDate);
	}

	@Override
	public void checkIn() { //�ݳ�
		if(state == STATE_NORMAL) { //���Ⱑ���� å�̸� �޼��� �Ѹ��� �޼ҵ� ��
			System.out.println(bookTitle + "������ �ݳ��� �Ϸ�� å�Դϴ�. Ȯ���ϼ���");
			return;
		}
		//state�� ������(1)�̶� �ݳ�ó��
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL;
		System.out.println(bookTitle + "������ �ݳ� �Ϸ�Ǿ����ϴ�");
	}

	@Override
	public void printState() { // "890-��1 Java (��������) ���Ⱑ�� "
//		if(state == STATE_BORRODWD) {
//			System.out.println(bookNo + "\t" + bookTitle + "(" + writer + "��) - ������");
//		}else if(state==STATE_NORMAL) {
//			System.out.println(bookNo + "\t" + bookTitle + "(" + writer + "��) - ���Ⱑ��");
//		}else {
//			System.out.println(bookNo + "\t" + bookTitle + "(" + writer + "��) - ���ɻ���");
//		}
	String msg = bookNo + "\t" + bookTitle + "(" + writer + "��)";
	msg += state==STATE_BORRODWD ? "������" : "���Ⱑ��";
	System.out.println(msg);
	}

	public String getBookNo() {
		return bookNo;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public String getWriter() {
		return writer;
	}

	public String getBorrower() {
		return borrower;
	}

	public String getCheckOutDate() {
		return checkOutDate;
	}

	public byte getState() {
		return state;
	}
}
