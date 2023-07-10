package startegy1_step2;

public class NewRobotTestMain {
	public static void main(String[] args) {
		Robot superRobot = new SuperRobot();
		Robot standardRobot = new StandardRobot();
		Robot lowRobot = new LowRobot();
		Robot[] Robots = {superRobot, standardRobot, lowRobot};
		for(Robot robot : Robots) {
			robot.shape();			
			robot.actionWalk();
			robot.actionRun();
			if(robot instanceof SuperRobot) {
				SuperRobot tempRobot = (SuperRobot)robot;
				tempRobot.actionFly();
				tempRobot.actionMissile();
				tempRobot.actionKnife();
			}else if(robot instanceof StandardRobot) {
				StandardRobot tempRobot = (StandardRobot)robot;
				tempRobot.actoinFly();
				tempRobot.actionMissile();
				tempRobot.actionKnife();
			}else if(robot instanceof LowRobot) {
				LowRobot tempRobot = (LowRobot)robot;
				tempRobot.actoinFly();
				tempRobot.actionMissile();
				tempRobot.actionKnife();
			} //if
		} //for
	}//main
}
