package startegy1_step5.modularization;

import startegy1_step4.interfaces.*;
// actionWalk(), actionRun(), shape()
public class SuperRobot extends Robot {
	public SuperRobot() {
		setFly(new FlyYes());
		setMissile(new MissileYes());
		setKnife(new KnifeLazer());
	}
}
