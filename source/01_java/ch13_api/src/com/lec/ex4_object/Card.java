package com.lec.ex4_object;
//데이터 -생성자-메소드(일반메소드-setter & getter  -오버라이드 메소드)
//new Card("하트", 3)
public class Card {
	private String kind;
	private int num;
	public Card(String kind, int num) {
		this.kind = kind;
		this.num = num;
	}
	@Override
	public String toString() {
		return "카드 : " + kind + "-" + num; 
	}
	@Override
	public boolean equals(Object obj) {
		//c1.equqls(c2) => c1은 this, c2는 obj
		//this//내객체의
		//kind와obj.kind가 같은지 chk =>kindChk(true/false)
		//(this.)num과 obj.num이 같은 chk => numChk(true/false)
		//return kindChk && numChk
		if(obj!=null && obj instanceof Card) {
			Card c2 = (Card)obj;
			boolean kindChk = kind.equals(c2.kind);
			boolean numChk = (num == c2.num);
			return kindChk && numChk;
		}
		return false;
	}
	
	
	
	
	
	
	
}   
	
	

