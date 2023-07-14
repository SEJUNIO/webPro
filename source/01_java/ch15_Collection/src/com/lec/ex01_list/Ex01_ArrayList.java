package com.lec.ex01_list;

import java.util.ArrayList;
import java.util.Arrays;
public class Ex01_ArrayList {
	public static void main(String[] args) {
		String[] array = new String[3];
			array[0] = "str0"; array[1] ="str1"; array[2] ="str2";
			array[1] = "str1111";
		System.out.println(Arrays.toString(array));
		for(String arr : array) {
			System.out.println(arr);
		}
		for(int i=0; i<array.length; i++) {
			System.out.println(i + "번 인덱스 값 : "+array[i]);
			}
		System.out.println("==========ArrayList=========");
		ArrayList<String> arrayList = new ArrayList<String>();
		arrayList.add("str0"); //0번인덱스
		arrayList.add("str1"); //1번인덱스 ->2번 인덱스
		arrayList.add("str2"); //2번인덱스 ->3번 인덱스
		arrayList.add(1, "str1111"); //1번 인덱스
		arrayList.set(2, "str2222"); //2번 인덱스값 수정
		System.out.println("arrayList의 사이즈 : " +arrayList.size()); //많이사용
			arrayList.add("str4");
		System.out.println("arrayList의 사이즈 : " +arrayList.size());
		System.out.println(arrayList);
		for(String temp : arrayList) { //확장for문
			System.out.println(temp);
		}
		for(int i=0; i<arrayList.size(); i++) {
			System.out.println(i + "번 인덱스값 : " + arrayList.get(i));
		}
		arrayList.remove(2); //2번인덱스의 값이 제거(3번인덱스 ->2번인덱스로, 4번인덱스는 3번인덱스로)
		arrayList.remove("str2222"); //str2222값 제거
		arrayList.remove(arrayList.size()-1); //맨마지막 인덱스 값 제거
		System.out.println("2번 인덱스 값 remove 후");
		for(int i=0; i<arrayList.size(); i++) {
			System.out.println(i + "번 인덱스 값 : " +arrayList.get(i)); //array[i]
		}
		arrayList.clear(); //arrayList의 모든데이터 제거
		System.out.println(arrayList.size()==0? "데이터 제거 완료" : "데이터 있음");
		System.out.println(arrayList.isEmpty()? "데이터 제거 완료" : "데이터 있음");
		arrayList = null;
		//System.out.println(arrayList.size());  //NullPointException
		}
	}

