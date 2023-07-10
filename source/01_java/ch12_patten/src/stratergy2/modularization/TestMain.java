package stratergy2.modularization;

import stratergy2.interfaces.FuelHybrid;
import stratergy2.interfaces.Km20;
public class TestMain {
	public static void main(String[] args) {
		Car [] cars = {new Accent(), new Genesis(), new Sonata()};
		for(int idx=0; idx<cars.length; idx++) {
			cars[idx].shape();
			cars[idx].drive();
			cars[idx].isEngine();
			cars[idx].isKmperLiter();
			cars[idx].isFuel();
		} 
		System.out.println("�ҳ�Ÿ�� ���Ḧ hybrid��, ���� 20km/l�� ���׷��̵�");
		cars[2].setFuel(new FuelHybrid());
		cars[2].setKm(new Km20());
		for(int idx=0; idx<cars.length; idx++) {
			cars[idx].shape();
			cars[idx].drive();
			cars[idx].isEngine();
			cars[idx].isKmperLiter();
			cars[idx].isFuel();
		} //for
	} // main
} //class
