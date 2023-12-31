package com.lec.ex03_speaktv;
//인터페이스 : 작업명세서 역할  (JSP - Spring)
//인터페이스 : 상수(final 변수)와 추상메소드만 (예외 : default메소드, static 메소드)
public interface Ivolume {
	public int TV_MAX_VOLUME = 50;
	public int SPEAKER_MAX_VOLUME = 100;
	public int TV_MIN_VOLUME = 2;
	public int SPEAKER_MIN_VOLUME = 0;
	public void volumeUp(); // 볼륨을 1씩 up
	public void volumeUP(int level) ; // 볼륨을 level만큼 up
	public void volumeDowm();  // 볼륨을 1만큼 Down
	public void volumeDowm(int level); // 볼륨을 level만큼 Down
	public default void setMute(boolean mute){ //디폴트 메소드
		if(mute) {
			System.out.println("무음");
		}else {
			System.out.println("무음 해제");
		}
	}
	public static void changeBattery() { // static 메소드
		System.out.println("건전지를 교환합니다");
	}
 }
