package stratergy2.modularization;

import stratergy2.interfaces.EngineHigh;
import stratergy2.interfaces.FuelGasoline;
import stratergy2.interfaces.Km10;
public class Genesis extends Car {
	public  Genesis() {
		setEngine(new EngineHigh());
		setKm(new Km10());
		setFuel(new FuelGasoline());
	}
	@Override
	public void shape() {
		System.out.println("���׽ý� ������ ��, ��Ʈ, �ڵ�� �̷���� �ֽ��ϴ�.");

	}

}
