package startegy1_step5.modularization;
import startegy1_step4.interfaces.FlyHigh;
import startegy1_step4.interfaces.KnifeToy;

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
		System.out.println("SuperRobot 높이 아주 높이 날수 있는 기능으로 업그레이드");
			superRobot.setFly(new FlyHigh());
			superRobot.shape();
			superRobot.actionFly();
		System.out.println("LowRobot의 장난감 검이 있는 기능으로 업그레이드");
			lowRobot.setKnife(new KnifeToy());
			lowRobot.shape();
			lowRobot.actionFly();
		} //main
	}
