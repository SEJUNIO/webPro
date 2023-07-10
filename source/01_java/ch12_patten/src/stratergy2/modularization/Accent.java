package stratergy2.modularization;

import stratergy2.interfaces.EngineLow;
import stratergy2.interfaces.FuelDiesel;
import stratergy2.interfaces.Km20;
public class Accent extends Car {
	public Accent() {
		setEngine(new EngineLow());
		setKm(new Km20());
		setFuel(new FuelDiesel());
	}
	@Override
	public void shape() {
		System.out.println("�׼�Ʈ ������ ��, ��Ʈ, �ڵ�� �̷���� �ֽ��ϴ�.");

	}

}
