package com.lec.ex0Conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnMySQL {
	public static void main(String[] args) {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/kimdb?serverTimezone=UTC";
		Connection conn = null;
		try {
			Class.forName(driver); // 1. 드라이버 로드
			System.out.println("1. 드라이버 로드 성공");
			conn = DriverManager.getConnection(url,"root", "mysql"); //2. DB 연결객체
			System.out.println("2. MySQL 연결 성공");
		} catch (ClassNotFoundException e) {
			System.err.println("드라이버 로드 실패 : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(conn!=null) conn.close(); // 마지막 단계 DB연결 해제
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			
		}
	}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	} //main
}// class
