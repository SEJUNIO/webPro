package com.lec.ex02_store;
//추상클래스 : 추상메소드가 1개 이상 있을때
//추상메소드 : 메소드 선언하고 구현은 없어. 구현은 상속받은 클래스가 함(상속받은클래스에게 오버라이드 강요)
public interface HeadQuarterStore {
	public void kimchi();  //추상메소드 : 메소드 명만 선언하고 구현은 없어
	public void bude();
	public void bibim();
	public void sunde();
	public void gongibab();
	public String getStoreName(); 
		}
	