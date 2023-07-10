package stratergy2.modularization;

import stratergy2.interfaces.EngineMid;
import stratergy2.interfaces.FuelGasoline;
import stratergy2.interfaces.Km15;
public class Sonata extends Car {
	public Sonata() {
		setEngine(new EngineMid());
		setKm(new Km15());
		setFuel(new FuelGasoline());
	}

	@Override
	public void shape() {
		System.out.println("�ҳ�Ÿ ������ ��, ��Ʈ, �ڵ�� �̷���� �ֽ��ϴ�.");
		
	}
}
