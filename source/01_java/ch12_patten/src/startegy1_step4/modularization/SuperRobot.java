package startegy1_step4.modularization;

import startegy1_step4.interfaces.*;
// actionWalk(), actionRun(), shape()
public class SuperRobot extends Robot {
	private FlyImpl fly = new FlyYes();
	private MissileImpl missile = new MissileYes();
	private KnifeImpl knife = new KnifeLazer();
	public SuperRobot() {
		setFly(new FlyYes());
		setMissile(new MissileYes());
		setKnife(new KnifeLazer());
	}
	@Override
	public void actionFly() {
		fly.fly();
	}
	@Override
	public void actionMissile() {
		missile.missile();
	}
	@Override
	public void actionKnife() {
		knife.knife();
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
