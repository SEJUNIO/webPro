package singleton2;

public class SecondClass {
	public SecondClass() {
		System.out.println("SecondClass ������ ������ �ڡڡڡڡڡڡڡڡڡڡڡڡڡ�");
		SingletonClass singletonobject = SingletonClass.getInstance();
		System.out.println("�̱��� ��ü�� i����" + singletonobject.getI());
		System.out.println("SecondClass ������ ���� �� �ڡڡڡڡڡڡڡڡڡڡ�");
		
	}
}
