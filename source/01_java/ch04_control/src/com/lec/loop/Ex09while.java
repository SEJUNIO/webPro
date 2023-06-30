package com.lec.loop;
<<<<<<< HEAD
//1~10까지 숫자 중 3의 배수들의 합을 출력
=======
<<<<<<< HEAD
//1~10까지 숫자 중 3의 배수들의 합을 출력
public class Ex09while {
	public static void main(String[] args) {
		int tot = 0;
		int i=1; //초기값
		while(i<=10) {
			if(i%3 == 0 ) {
				tot += i;
			} //if
			i++;
		} //while
		System.out.println("1~10까지 3의 배수의 합 : " + tot);
	}//main
=======
//1~10까지 숫자 중 3의배수들의 합을 출력
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
public class Ex09while {
	public static void main(String[] args) {
		int tot = 0;
		int i=1; //초기값
		while(i<=10) {
			if(i%3 == 0 ) {
				tot += i;
			} //if
			i++;
<<<<<<< HEAD
		} //while
		System.out.println("1~10까지 3의 배수의 합 : " + tot);
	}//main
=======
		} // while 
		System.out.println("1~10까지 3의 배수의 합 : " + tot );
	} //main
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
}
