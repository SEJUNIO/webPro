package com.lec.ex09_store;

public class StoreNum3 extends HeadQuarterStore {

	public StoreNum3(String storeName) {
		super(storeName);
	}
	@Override
	public void kimchi() {
		System.out.println("��ġ� - 9,000��");
	}
	@Override
	public void bude() {
		System.out.println("�δ�� - 10,000��");
	}
	@Override
	public void bibim() {
		System.out.println("����� -10,000�� ");
	}
	@Override
	public void sunde() {
		System.out.println("���뱹 - 9,000��");
	}
}
