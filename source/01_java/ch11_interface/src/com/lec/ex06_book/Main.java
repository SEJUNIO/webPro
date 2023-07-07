package com.lec.ex06_book;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Book [] books = {new Book("890-ㅁ01", "java", "신윤권"),
					  new Book("890-ㅁ02", "oracle", "오길동"),
					  new Book("890-ㅁ03", "mysql", "마이동"),
					  new Book("890-ㅁ04", "jdbc", "제갈동"),
					  new Book("890-ㅁ05", "html", "이에치")};
		Scanner scanner = new Scanner(System.in);
		int fn ;  // 기능번호(1:대출, 2:반납 ,3:책list출력, 0:종료)
		int idx;  // 대출하거나 반납할 때 조회된 책의 index
		String bTitle, borrower, checkOutDate; //사용자에게 입력받을 책이름, 대출인, 대출일
		do {
				System.out.print("1:대출 | 2:반납 | 3:책list | 0:종료");
				fn = scanner.nextInt(); //white-space까지 입력된 정수를 받음
			switch(fn) {
			case 1: //대출1.책이름입력 2. 책조회  3.책상태확인 4.대출인  5.대출일 6.checkOut(대출인,대출일)메소드 호출
				// 1. 책이름 입력
				System.out.println("대출할 책 이름은?");
				bTitle = scanner.next();  //white-space앞까지 입력된 스트링을 받음
				// 2. 책조회
				for(idx=0; idx<books.length; idx++) {
					if(books[idx].getBookTitle().equals(bTitle)) {
						break; //for문을 빠져나감
					}
				}
				if(idx == books.length) {
					System.out.println("현재 보유하지 않는 도서입니다");
				}else { // book[idx] 도서를 대출				
				// 3. 책 상태확인
				if(books[idx].getState() == Book.STATE_BORRODWD) { //대출중
					System.out.println("대출중인 도서입니다");
				}else {		 //books[idx] 도서를 대출 처리		
					// 4. 대출인 입력
					System.out.print("대출인 ?");
					borrower = scanner.next();
					// 5. 대출일 입력
					System.out.println("대출일은 (07-07)?");
					checkOutDate = scanner.next(); 
					// 6. checkOut 메소드 호출 
					books[idx].checkout(borrower, checkOutDate); 
				}
			}
				break;
			case 2: 
				System.out.println("반납 로직"); break;
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
