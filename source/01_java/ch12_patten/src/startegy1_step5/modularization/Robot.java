package startegy1_step5.modularization;

import startegy1_step4.interfaces.*;
// 1. 변수추가(fly,missile,knife) 2 . setter추가  3. 추상메소드였던 메소드를 구현
public abstract class Robot {
	private FlyImpl fly;
	private MissileImpl missile;
	private KnifeImpl knife;
	public void actionFly() {
		fly.fly();
	}
	public void actionMissile() {
		missile.missile();
	}
	public void actionKnife() {
		knife.knife();
	}
	public void actionWalk() {
		System.out.println("걸을 수 있다.");
	}
	public void actionRun() {
		System.out.println("뛸 수 있습니다");
	}
	public void shape () {//" LowRobot은 팔, 다리, 몸통, 머리가 있습니다" 출력
		String className = getClass().getName(); //"strategy1. step2.SuperRobot"
		int idx = className.lastIndexOf(".");      //맨마지막에 나오는 "."의 위치 15
		String name = className.substring(idx+1); //16번째부터 끝까지 문자열을 추출
		System.out.println(name + "의 외형은 팔, 다리, 몸통, 머리가 있습니다");
	}
	public void setFly(FlyImpl fly) {
		this.fly = fly;
	}
	public void setMissile(MissileImpl missile) {
		this.missile = missile;
	}
	public void setKnife(KnifeImpl knife) {
		this.knife = knife;
	}
	
	
	
	
	
}
