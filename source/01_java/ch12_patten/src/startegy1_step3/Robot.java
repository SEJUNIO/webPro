package startegy1_step3;

public abstract class Robot {
	public abstract void actionFly();
	public abstract void actionMissile();
	public abstract void actionKnife();
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
	
	
	
	
	
}
