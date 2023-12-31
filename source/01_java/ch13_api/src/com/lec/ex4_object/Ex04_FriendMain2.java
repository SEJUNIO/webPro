package com.lec.ex4_object;
//생일(MM-dd) 검색 
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;
public class Ex04_FriendMain2 {
	public static void main(String[] args) {
		Friend[] friends ={ new Friend("홍길동", "010-9999-9999", "서울 서대문구",
					new Date(new GregorianCalendar(1998, 11, 12).getTimeInMillis())),
						 	new Friend("신길동", "010-8888-9999", "서울 마포구",
					new Date(new GregorianCalendar(1996, 6, 22).getTimeInMillis())),
						 	new Friend("박미주", "010-8888-1234", "서울 여의도구",
					new Date(new GregorianCalendar(1997, 6, 2).getTimeInMillis())),
						 	new Friend("박성광", "010-8888-7777", "안양 만안구",
					new Date(new GregorianCalendar(1981, 7, 22).getTimeInMillis())),
						 	new Friend("윤동주", "010-8888-5555", "함북 청진시",
					new Date(new GregorianCalendar(1996, 6, 2).getTimeInMillis()))};
				Scanner scanner = new Scanner(System.in);		 
				//검색할 생일 입력(07-22) => 배열 검색(0번째 인덱스부터 생일중에 MM-dd만 추출한 정보를 비교후 같으면 출력)
				while(true) {
					boolean searchOk = false; //못 찾았다를 초기화
					System.out.print("검색할 생일을 00-00로 입력(단, 종료를 원하시면 x를 입력하시오) : ");
					String searchWord = scanner.next(); //07-22
					if(searchWord.equalsIgnoreCase("x")) break;
					for(Friend friend : friends) {
						Date birth = friend.getBirthday();
						SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
						String birthStr = sdf.format(birth); 
						if(searchWord.equals(birthStr) ) {
							System.out.println(friend);
							searchOk = true;
						}//if
					}//for
					if(!searchOk) { //해당생일의 친구를 못찾음   //searchOk ==false : 도 참이 아닌 결과가 나오지만 !searchOk : 이게 더 가독성 좋음
						System.out.println("해당 생일의 친구는 없습니다");
					} //if
				}//while
				scanner.close();
			} //main
}//class

