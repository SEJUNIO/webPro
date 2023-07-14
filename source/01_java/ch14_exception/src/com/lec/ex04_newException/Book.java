package com.lec.ex04_newException;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;
// BOOK book = new Book("890-ㅁ01", "Java" "신윤권");
public class Book implements ILendable {
	private String bookNo; 		//청구번호
	private String bookTitle;   //책이름
	private String writer;      //책저자
	private String borrower;    //대출인
	private Date checkOutDate;  //대출일
	private byte state;         //대출중(1), 대출가능(0)
		
	public Book(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
//		borrower = null;
//		checkOutData = null;
//		state = 0;
	}

	@Override
	public void checkOut(String borrower) { //대출
		if(state == STATE_BORRODWD) { //대출중인 상태이면 메세지 뿌리고 메소드 끝
			System.out.println(bookTitle +" 도서는 대출중입니다");
			return ;
		}
		//state가 0(STATE NORMAL)라서 대출 진행
		this.borrower = borrower;
		checkOutDate = new Date();
		state = STATE_BORRODWD; //대출중 상태로 전환
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		System.out.println(bookTitle + " 도서가 대출되었습니다");
		System.out.println("대출인 : " + borrower + "\t대출일 : " + sdf.format(checkOutDate));
	}

	@Override
	public void checkIn() throws Exception { //반납
		if(state == STATE_NORMAL) { //대출가능한 책이면 메세지 뿌리고 메소드 끝
			//강제로 예외 발생
			throw new Exception(bookTitle + "도서는 반납이 완료된 책입니다. 확인하세요＃");
		}
		//현재 날짜를 시스템으로부터 가져와서 대출일(checkOutDate)과 현재의 날짜차이를 계산 => 14일 지났으면 연체 떼끼
		//checkOutDate~지금까지의 날짜 계산
		Date now = new Date();
		long checkOutDateMilli = checkOutDate.getTime(); //1970.1.1 ~대출일까지의 밀리 세컨
		long nowmilli          = now.getTime();  //1970.1.1 ~now 까지의 밀리세컨
		long diff = nowmilli - checkOutDateMilli; // 대출일 ~now까지의 밀리세컨 
		int day = (int)diff / (1000 * 60 * 60 * 24); //대출일~ now까지의 날짜 수
		if(day > 14) {  //연체
			day -= 14; //연체일
			System.out.println(day + "일 만큼 연체되어" + (day*100) +"원 연체료 부가됩니다. 연체료를 받으셨나요?");
			Scanner scanner = new Scanner(System.in);
			String answer = scanner.next().trim();
			if(!answer.equalsIgnoreCase("y")) {
				System.out.println("연체료를 미납하시면 반납처리 안 됩니다.");
				return;
			}	
		}
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL; //state가 대출중(1)이라 반납처리
		System.out.println(bookTitle + "도서가 반납 완료되었습니다");
	}
	@Override
	public String toString() {
		String msg = bookNo + "\t" + bookTitle + "(" + writer + "저)";
		return msg += state==STATE_BORRODWD ? "대출중(대출일:"+checkOutDate + ")" : "대출가능";
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

	public String getDate() {
		return getDate();
	}

	public byte getState() {
		return state;
	}
	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}
}
