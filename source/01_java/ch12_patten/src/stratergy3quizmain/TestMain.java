package stratergy3quizmain;

public class TestMain {
	public static void main(String[] args) {
		Student st1 = new Student("ere", "홍길동", "국비자바");
		Student st2 = new Student("dbd", "김길동", "자바단기");
		Lectuer l1 = new Lectuer("aaa", "유길동", "빅데이터");
		Lectuer l2 = new Lectuer("bdc", "홍길동", "웹프로그래밍");
		Staff s1  = new Staff("sss", "유용현", "관리");
		Person[] person = {st1, st2, l1, l2, s1};
		for(Person p : person) {
			//System.out.println(p);
			p.print();
			p.job();
			p.get();
		}
	}
}
