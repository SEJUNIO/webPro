package com.lec.ex04_newException;

public interface ILendable {
	public byte STATE_BORRODWD =1;  // "������"���ǹ�
	public byte STATE_NORMAL  = 0;  // "���Ⱑ��"�� �ǹ�
	public void checkOut(String borrower); //����(�������� �Է�, �������� ����)
	public void checkIn() throws Exception;          //�ݳ�
}
