package com.lec.loop;
<<<<<<< HEAD
/* i가 1일때 누적합은 1이다
   i가 2일때 누적합은 3이다 
   ...*/
=======
<<<<<<< HEAD
/* i가 1일때 누적합은 1이다
   i가 2일때 누적합은 3이다 
   ...*/
public class Ex08_while {
	public static void main(String[] args) {
		int tot = 0;
		int i=1;
		while(i<10) {
			tot += i;
			System.out.printf("i가 %d일 때까지 누적합은 %d이다\n",i,tot);
			i++;
		}
//		for(int i=1; i<=10; i++) {
//			tot +=i; // tot=tot+i
//			System.out.printf("i가 %d일 때까지 누적합은 %d이다\n",i,tot);
//		}//for
	} //main
=======
/* i가 1일때 누적합은 1이다.
/* i가 2일때 누적합은 3이다.
/* i가 3일때 누적합은 6이다.
/* i가 4일때 누적합은 10이다.
/* i가 5일때 누적합은 15이다.
/* i가 6일때 누적합은 21이다.
/* i가 7일때 누적합은 28이다.
/* i가 8일때 누적합은 36이다.
/* i가 9일때 누적합은 45이다.
/* i가 10일때 누적합은 55이다.*/
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
public class Ex08_while {
	public static void main(String[] args) {
		int tot = 0;
		int i=1;
		while(i<10) {
			tot += i;
			System.out.printf("i가 %d일 때까지 누적합은 %d이다\n",i,tot);
			i++;
		}
//		for(int i=1; i<=10; i++) {
<<<<<<< HEAD
//			tot +=i; // tot=tot+i
//			System.out.printf("i가 %d일 때까지 누적합은 %d이다\n",i,tot);
//		}//for
	} //main
=======
//			tot += i; //tot=tot+1
//			System.out.printf("i가%2d일 때까지 누적합은 %d이다\n", i, tot);
//		
	}
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
}
