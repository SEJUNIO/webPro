package com.lec.ex4;
import com.lec.ex4_human.*;  //�ٸ� ���ϰ� ���̾������� ����Ʈ
import com.lec.ex4_human.kid.Kid;
public class HumanTestMain {
	public static void main(String[] args) {
		Woman woman1 = new Woman();
		Woman woman2 = new Woman();
		System.out.println("woman1�� woman2�� ������ :" +(woman1 == woman2) ); //����
		System.out.println("woman1�� woman2�� ������ :" +  woman1.equals(woman2)); //����
		Man man = new Man();
		Kid kid = new Kid("ȫ�ư�");
		Man kim = new Man("ȫ�浿", 22, 170, 59.0);
		Man sin = new Man("�ű浿");
		Man Kim2 = kim;
		System.out.println("kim�� kim2�� ������ ���� : " + kim.equals(Kim2) );
		sin.setHeight(165);
		sin.setWeight(57);
		System.out.println("kim�� bmi���� : " + kim.calculateBMI());
		System.out.println("sin�� bmi���� : " + sin.calculateBMI());
	}
}
