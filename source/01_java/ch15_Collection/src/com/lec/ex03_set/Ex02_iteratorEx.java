package com.lec.ex03_set;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

import com.lec.ex01_list.Friend;

//itrator : 모든 collection 자료구조에 사용 가능
public class Ex02_iteratorEx {
	public static void main(String[] args) {
		// 1. list
		ArrayList<String> list = new ArrayList<String>();
		list.add("SAMPEL1"); list.add("SAMPLE2");
		for(String l : list) {
			System.out.println(l);
//			Iterator<String> iterator = list.iterator();
//			while(iterator.hasNext()) {
//				System.out.println(iterator.next());
//			}
//		}
		// 2. map
		System.out.println("= = = 2. map 계열 = = = ");
		HashMap<String, Friend> map = new HashMap<String, Friend>();
		map.put("홍길동", new Friend("홍길동", "010-9999-9999"));
		map.put("김동길", new Friend("김동길", "010-8888-9999"));
		Iterator<String> iterator = map.keySet().iterator();
		while(iterator.hasNext()) {
			String key = iterator.next();
			System.out.println(key + " : " + map.get(key));
			}
		// 3. set
		System.out.println(" = = = 3. set 계열 = = =");
		HashSet<Friend> set = new HashSet<Friend>() ;
		set.add(new Friend("홍길동", "010-9999-9999"));
		set.add(new Friend("김동길", "010-8888-9999"));
		Iterator<Friend> iterator2 = set.iterator();
		while(iterator2.hasNext()) {
			System.out.println(iterator2.next());
			}
		}
	}
}
