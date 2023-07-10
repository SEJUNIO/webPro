package startegy1_step5.modularization;

import startegy1_step4.interfaces.*;
public class LowRobot extends Robot {
	public LowRobot () {
		setFly(new FlyNo());
		setMissile(new MissileNo());
		setKnife(new KnifeNo());
	}
}
