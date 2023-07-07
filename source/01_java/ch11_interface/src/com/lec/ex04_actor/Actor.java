package com.lec.ex04_actor;

public class Actor implements IPoliceMan, IChef, IFireFighter {
	private String name;
	public Actor(String name) {
		this.name = name;
	}

	@Override
	public void outFire() {
		System.out.println(name + "는(은) 소방관 입니다. 불을끕니다");

	}

	@Override
	public void SaveMan() {
		System.out.println(name + "는(은) 소방관 입니다. 사람을구합니다");

	}

	@Override
	public void makePizza() {
		System.out.println(name + "는(은) 요리사 입니다. 피자를굽습니다");

	}

	@Override
	public void makeSpaghetti() {
		System.out.println(name + "는(은) 요리사 입니다. 스파게티를만듭니다");

	}

	@Override
	public void canCatchCriminal() {
		System.out.println(name + "는(은) 경찰관 입니다. 범인을잡습니다");

	}

	@Override
	public void canSearch() {
		System.out.println(name + "는(은) 경찰관 입니다. 물건을 찾습니다");

	}

}
