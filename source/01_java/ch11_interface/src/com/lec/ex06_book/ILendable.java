package com.lec.ex06_book;

public interface ILendable {
	public byte STATE_BORRODWD =1;  // "������"���ǹ�
	public byte STATE_NORMAL  = 0;  // "���Ⱑ��"�� �ǹ�
	public void checkout(String borrower, String checkOutData); //����
	public void checkIn();          //�ݳ�
	public void printState();       // "å��ȣ å�̸�(����) ���Ⱑ�ɿ���" ���
}
