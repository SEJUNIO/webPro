package com.lec.quiz;

public class Quiz1 {
	private int serialNo;  //이름 앞에 갈 번호
	public static int count = 0; //초기값 1부터 공유
	private String name;
	private int kor;
	private int eng;
	private int mat;
	private int tot;
	private double avg;
	public Quiz1() {}
	//생성자 함수
	public Quiz1(String name, int kor, int eng, int mat) {
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		tot = kor + eng + mat;
		avg = tot/3.0;
		serialNo = ++count;
	}
	public static void staticMethod(){
		System.out.println("static 메소드");
	}
	public void print() {
		System.out.printf("\t%d \t%s \t%d \t%d \t%d \t%d \t%.2f\n",serialNo, name, kor, eng, mat, tot, avg);
	}
	public String infoString() {
		return String.format("\t%d \t%s \t%d \t%d \t%d \t%d \t%.2f\n",serialNo, name, kor, eng, mat, tot, avg);
	}
	public int getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}
	public static int getCount() {
		return count;
	}
	public String getName() {
		return name;
	}
	public int getKor() {
		return kor;
	}
	public int getEng() {
		return eng;
	}
	public int getMat() {
		return mat;
	}
	public int getTot() {
		return tot;
	}
	public double getAvg() {
		return avg;
	}
	
	
	
	
	
	
	
	
	
	
	
}