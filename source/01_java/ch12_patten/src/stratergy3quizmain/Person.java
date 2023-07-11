package stratergy3quizmain;

import stratergy3quiz.GetImpl;
import stratergy3quiz.JobImpl;
public class Person {
	private String id;
	private String name;
	private JobImpl job;
	private GetImpl get;	
	public Person(String id, String name) {
		this.id = id;
		this.name = name;
	}
	public void job() {
		job.job();
	}
	public void get() {
		get.get();
	}
	public void print() {
		System.out.print("[ID]"+ id + "\t[NAME]" + name);
	}
	public void setGet(GetImpl get) {
		this.get = get;
	}
	public void setJob(JobImpl job) {
		this.job = job;
	}
}
