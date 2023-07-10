package startegy1_step4.modularization;

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
			robot.actionFly();
			robot.actionMissile();
			robot.actionKnife();
			} //for
		} //main
	}
