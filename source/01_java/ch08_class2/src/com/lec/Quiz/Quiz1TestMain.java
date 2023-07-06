package com.lec.quiz;
public class Quiz1TestMain {
	public static void main(String[] args) {
		Quiz1 s1 = new Quiz1("정우성", 90, 80,95);
		Quiz1 s2 = new Quiz1("김하늘", 100, 80,95);
		Quiz1 s3 = new Quiz1("황정민", 95, 80,90);
		Quiz1 s4 = new Quiz1("강동원", 95, 90,99);
		Quiz1 s5 = new Quiz1("유아인", 90, 90,90);
		Quiz1 [] quiz1= {s1,s2,s3,s4,s5};
		String title[] = {"이름","국어","영어","수학","총점","평균"};
		int [] total = new int[5];
		line();
		System.out.println("\t\t\t성적표");
		line('-');
		for(String t : title ) {
			System.out.print("\t" + t);
		}
		System.out.println();
		line('-');
		for(int idx=0; idx<quiz1.length; idx++) {
			System.out.println(quiz1[idx].infoString());
			total[0] +=quiz1[idx].getKor();
			total[1] +=quiz1[idx].getEng();
			total[2] +=quiz1[idx].getMat();
			total[3] +=quiz1[idx].getTot();
			total[4] +=quiz1[idx].getAvg();			
		}
		line('-');
		System.out.print("\t총점");
		for(int tot : total) {
			System.out.printf("\t%d", tot);
		}
		System.out.print("\n\t평균");
		for(int tot : total) {
			System.out.printf("\t%.1f", (double)tot/quiz1.length);
		}
		System.out.println();
		
		line();
	}
	private static void line(char c) {
			for(int i=0; i<65; i++) {
				System.out.print(c);
			}
		System.out.println();
	}

	private static void line() {
		for(int i=0; i<65; i++) {
			System.out.print('■');
		}
		System.out.println();
		
	}
}

