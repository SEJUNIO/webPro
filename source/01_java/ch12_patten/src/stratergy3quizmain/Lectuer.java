package stratergy3quizmain;

import stratergy3quiz.GetSalary;
import stratergy3quiz.JobLec;
public class Lectuer extends Person {
	private String subject;
	public Lectuer(String id, String name, String subject) {
		super(id, name);
		this.subject = subject;
		setJob(new JobLec());
		setGet(new GetSalary());
	}
	@Override
	public void print() {
		super.print();
		System.out.println("\t[강의과목]"+subject);
		
	}	
}


