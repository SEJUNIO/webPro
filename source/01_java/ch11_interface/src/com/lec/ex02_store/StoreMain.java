package com.lec.ex02_store;
public class StoreMain {
	public static void main(String[] args) {
//		HeadQuarterStore headStore = new HeadQuarterStore("= ���� = ");
		HeadQuarterStore store1 = new StoreNum1("= ���ð� 1ȣ�� =");
		HeadQuarterStore store2 = new StoreNum2("= ���а� 1ȣ�� =");
		HeadQuarterStore store3 = new StoreNum3("= ���ǰ� 3ȣ�� =");
		HeadQuarterStore[] stores = {
					//new HeadQuarterStore("= ���� = "),
					new StoreNum1("= ���ð� 1ȣ�� ="),
					new StoreNum2("= ���а� 1ȣ�� ="),
					new StoreNum3("= ���ǰ� 3ȣ�� =")
		};// �迭
		for(HeadQuarterStore store : stores) {
			System.out.println(store.getStoreName());;
			store.kimchi();
			store.bude();
			store.bibim();
			store.sunde();
			store.gongibab();
		}//Ȯ�� for
		System.out.println("�����������������������");
		for(int i=0; i<stores.length; i++) {
			System.out.println(stores[i].getStoreName());
			stores[i].kimchi();
			stores[i].bude();
			stores[i].bibim();
			stores[i].sunde();
			stores[i].gongibab();
		} //�Ϲ� for
	}
}