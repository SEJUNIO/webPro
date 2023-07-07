package com.lec.ex03_speaktv;

public class Tv  implements Ivolume {
	private int volumeLevel;
	public Tv() {
		volumeLevel = 5;
	}
	@Override
	public void volumeUp() {
		if(volumeLevel < Ivolume.TV_MAX_VOLUME) {
			volumeLevel++;
			System.out.println("TV ������ 1��ŭ �÷� ���� ������ " + volumeLevel);
		}else {
			System.out.println("TV ������ �ִ�ġ(" + Ivolume.TV_MAX_VOLUME+")���� �ø��� ����");
		}
		
	}

	@Override
	public void volumeUP(int level) {
		if(volumeLevel + level < Ivolume.TV_MAX_VOLUME) {
			volumeLevel += level; //volumeLevel = volumeLevel + level;
			System.out.println("TV ������" + level + "��ŭ �÷� ���� ������ " + volumeLevel);
		}else {
			int tempLevel = TV_MAX_VOLUME-volumeLevel;
			volumeLevel = TV_MAX_VOLUME;
			System.out.println("TV������" + tempLevel +"��ŭ �÷��� �ִ�ġ("+ TV_MAX_VOLUME+")�Դϴ�");
		}
		
	}

	@Override
	public void volumeDowm() {
		if(volumeLevel > TV_MIN_VOLUME) {
			volumeLevel--;
			System.out.println("TV������ 1��ŭ ���� ���� ���� " + volumeLevel);
		}else {
			System.out.println("TV������ �ּ�ġ(" + TV_MIN_VOLUME + ")�Դϴ�");
		}
		
	}

	@Override
	public void volumeDowm(int level) {
		if(volumeLevel-level > TV_MIN_VOLUME) {
			volumeLevel -= level;
			System.out.println("TV������ " +level + "��ŭ ���� ���� ������" + volumeLevel);
		}else {
			int tempLevel = volumeLevel - TV_MIN_VOLUME;
			volumeLevel = TV_MIN_VOLUME;
			System.out.println("TV������ " + tempLevel + "��ŭ ���� ������ �ּ�ġ(" + TV_MIN_VOLUME+")");
		}
		
	}

}
