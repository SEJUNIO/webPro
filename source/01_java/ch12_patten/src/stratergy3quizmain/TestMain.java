package stratergy3quizmain;

public class TestMain {
	public static void main(String[] args) {
		Student st1 = new Student("ere", "ȫ�浿", "�����ڹ�");
		Student st2 = new Student("dbd", "��浿", "�ڹٴܱ�");
		Lectuer l1 = new Lectuer("aaa", "���浿", "������");
		Lectuer l2 = new Lectuer("bdc", "ȫ�浿", "�����α׷���");
		Staff s1  = new Staff("sss", "������", "����");
		Person[] person = {st1, st2, l1, l2, s1};
		for(Person p : person) {
			//System.out.println(p);
			p.print();
			p.job();
			p.get();
		}
	}
}
