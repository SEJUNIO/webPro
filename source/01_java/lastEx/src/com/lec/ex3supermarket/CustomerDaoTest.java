package com.lec.ex3supermarket;

import java.util.ArrayList;

public class CustomerDaoTest {
	public static void main(String[] args) {
		CustomerDao dao = CustomerDao.getInstance();
		int result;
		ArrayList<CustomerDto> customers;
		System.out.println("1. 회원가입 테스트");
//		String ctel = "010-4444-5555"; String cname = "허길동";
//		result = dao.insertCustomer(ctel, cname);
//		System.out.println(result == CustomerDao.SUCCESS ? cname +"님 회원가입 감사. 포인트 1000점 부여" :
//															cname+"님 회원가입 실패");
		System.out.println("2. 전화번호 검색 테스트");
		String searchTEL = "1234";
		customers = dao.ctelgetCustomers(searchTEL);
		if(customers.isEmpty()) {
			System.out.println(searchTEL + "전화번호로 검색된 고객이 없습니다.");
		}else {
			System.out.println("아이디\t핸드폰번호\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을 위한 추천 구매액");
			for(CustomerDto customer : customers) {
				System.out.println(customer);
			}
		}
		System.out.println("3. 물품구매");
		int cid=6;
		if(dao.getCustomer(cid)!=null) {
			int price = 500000;
			result = dao.buy(cid, price); //cid 고객이 price원 물품구매
			if(result == CustomerDao.SUCCESS) { //물품구매 성공
				System.out.println("물품 구매 감사합니다. 고객님의 정보가 아래와 같이 업데이트 되었습니다.");
				System.out.println("아이디\t핸드폰번호\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을 위한 추천 구매액");
				System.out.println(dao.getCustomer(cid));
			}
		}else {
			System.out.println(cid + "는 유효하지 않는 id라서 구매 불가");
		}
		System.out.println("4. 레벨별 출력");
		customers = dao.levelNameGetCustomers("normal");
		if(customers.size()==0) {
			System.out.println("해당 레벨은 없습니다.");
		}else {
			System.out.println("아이디\t핸드폰번호\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을 위한 추천 구매액");
			for(CustomerDto customer : customers) {
				System.out.println(customer);
			}
		}
		System.out.println("5. 전체 출력");
		customers = dao.getCustomers();
		if(customers.size()==0) {
			System.out.println("해당 레벨은 없습니다.");
		}else {
			System.out.println("아이디\t핸드폰번호\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을 위한 추천 구매액");
			for(CustomerDto customer : customers) {
				System.out.println(customer);
			}
		}
		System.out.println("6. 회원탈퇴");
		result = dao.deleteCustomer("010-9999-9999");
		System.out.println(result == CustomerDao.SUCCESS ? "삭제성공" : "유효한 번호가 아닙니다.");	
	}
}
