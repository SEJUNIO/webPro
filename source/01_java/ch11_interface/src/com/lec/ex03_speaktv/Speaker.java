package com.lec.ex03_speaktv;

public class Speaker  implements Ivolume {
	private int volumeLevel;
	public Speaker() {
		volumeLevel = 10;
	}
	@Override
	public void volumeUp() {
		if(volumeLevel < Ivolume.SPEAKER_MAX_VOLUME) {
			volumeLevel++;
			System.out.println("SPEAKER ������ 1��ŭ �÷� ���� ������ " + volumeLevel);
		}else {
			System.out.println("SPEAKER ������ �ִ�ġ(" + Ivolume.SPEAKER_MAX_VOLUME+")���� �ø��� ����");
		}
		
	}

	@Override
	public void volumeUP(int level) {
		if(volumeLevel + level < Ivolume.SPEAKER_MAX_VOLUME) {
			volumeLevel += level; //volumeLevel = volumeLevel + level;
			System.out.println("SPEAKER ������" + level + "��ŭ �÷� ���� ������ " + volumeLevel);
		}else {
			int tempLevel = SPEAKER_MAX_VOLUME-volumeLevel;
			volumeLevel = SPEAKER_MAX_VOLUME;
			System.out.println("SPEAKER ������" + tempLevel +"��ŭ �÷��� �ִ�ġ("+ SPEAKER_MAX_VOLUME+")�Դϴ�");
		}
		
	}

	@Override
	public void volumeDowm() {
		if(volumeLevel > SPEAKER_MIN_VOLUME) {
			volumeLevel--;
			System.out.println("SPEAKER ������ 1��ŭ ���� ���� ���� " + volumeLevel);
		}else {
			System.out.println("SPEAKER ������ �ּ�ġ(" + SPEAKER_MIN_VOLUME + ")�Դϴ�");
		}
		
	}

	@Override
	public void volumeDowm(int level) {
		if(volumeLevel-level > SPEAKER_MIN_VOLUME) {
			volumeLevel -= level;
			System.out.println("SPEAKER������ " +level + "��ŭ ���� ���� ������" + volumeLevel);
		}else {
			int tempLevel = volumeLevel - SPEAKER_MIN_VOLUME;
			volumeLevel = SPEAKER_MIN_VOLUME;
			System.out.println("SPEAKER������ " + tempLevel + "��ŭ ���� ������ �ּ�ġ(" + SPEAKER_MIN_VOLUME+")");
		}
		
	}

}
