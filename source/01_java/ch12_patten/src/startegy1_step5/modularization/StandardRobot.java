package startegy1_step5.modularization;

import startegy1_step4.interfaces.*;
public class StandardRobot extends Robot {
	public StandardRobot () {
		setFly(new FlyNo());
		setMissile(new MissileYes());
		setKnife(new KnifeWood());
	}
}
