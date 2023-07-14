package com.lec.ex04_newException;

public interface ILendable {
	public byte STATE_BORRODWD =1;  // "대출중"을의미
	public byte STATE_NORMAL  = 0;  // "대출가능"을 의미
	public void checkOut(String borrower); //대출(대출인은 입력, 대출일은 현재)
	public void checkIn() throws Exception;          //반납
}
