package startegy1_step5.modularization;

import startegy1_step4.interfaces.*;
// 1. �����߰�(fly,missile,knife) 2 . setter�߰�  3. �߻�޼ҵ忴�� �޼ҵ带 ����
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
		System.out.println("���� �� �ִ�.");
	}
	public void actionRun() {
		System.out.println("�� �� �ֽ��ϴ�");
	}
	public void shape () {//" LowRobot�� ��, �ٸ�, ����, �Ӹ��� �ֽ��ϴ�" ���
		String className = getClass().getName(); //"strategy1. step2.SuperRobot"
		int idx = className.lastIndexOf(".");      //�Ǹ������� ������ "."�� ��ġ 15
		String name = className.substring(idx+1); //16��°���� ������ ���ڿ��� ����
		System.out.println(name + "�� ������ ��, �ٸ�, ����, �Ӹ��� �ֽ��ϴ�");
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