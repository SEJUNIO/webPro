package com.lec.ex4_human;
//������ ,�������Լ�, �޼ҵ�, setter&getter 
//Man kim = new Man("ȫ�浿", 22, 180, 68); // �������Լ��� �����ε�
//Man kim = new Man();
//Man kim = new Man("ȫ�浿");
//Man kim = new Man(180); //int
//Man kim = new Man(68.0); //double
//Man kim = new Man();
public class Man {
	private String name;      //�̸�����
	private int age;          //���ڵ���
	private int height;       //���ڵ���
	private double weight;    //�Ҽ��� ����
	//�����ڰ� ������ �Լ��� �� ����� �����Ϸ��� ����Ʈ ������ �Լ� �ڵ� ����.
	//�����ڰ� ������ �Լ��� �ϳ��̻� ����� �����Ϸ��� ����Ʈ ������ �Լ��� �ȸ���
	public Man() {
		System.out.println("�Ű����� ���� Man ������ �Լ�");
	}
	public Man(String name, int age, int height, double weight ) {
		this.name = name;
		this.age = age;
		this.height = height;
		this.weight = weight;
		System.out.println("������ 4�� �ʱ�ȭ�ϴ� Man ������ �Լ�");
	}
	public Man(String name) {
		this.name = name;
		System.out.println("�̸��� �ʱ�ȭ�ϴ� Man ������ �Լ�");
	}
	public Man(int height) {
		this.height = height;
		System.out.println("Ű�� �ʱ�ȭ�ϴ� Man ������ �Լ�");
	}
	public Man(double weight) {
		this.weight = weight;
		System.out.println("�����Ը� �ʱ�ȭ �ϴ� Man ������ �Լ�");
	}
	// �޼ҵ� : Ű�� �����Ը� �̿��Ͽ� BMI������ return �ϴ� �޼ҵ�  180/68.1 => 68.1/(1.8*1.8)
	public double calculateBMI() { //��ü���� height�� weight�� �̿��ؼ� BMI���� return
		double result = weight / ( (height*0.01) * (height*0.01) );
		return result;
	}
	//setter & getter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
