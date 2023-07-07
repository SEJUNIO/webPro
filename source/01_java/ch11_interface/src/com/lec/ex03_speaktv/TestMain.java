package com.lec.ex03_speaktv;

public class TestMain {
	public static void main(String[] args) {
		Ivolume speaker = new Speaker();
		Ivolume tv      = new Tv();
		Ivolume[] devices = {speaker, tv};
		for(Ivolume device : devices) {
			device.volumeUp();
			device.volumeUP(50);
			device.volumeDowm();
			device.volumeDowm(50);
			device.setMute(true);
			device.setMute(false);
		}
		Ivolume.changeBattery(); // static 
	}
		
}
