package com.lec.ex3insert;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

//사용자에게 부서번호, 부서명, 근무지를 입력받아 dept테이블에 insert
public class insertDept {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection conn = null;
		Statement stmt = null;
		Scanner scanner = new Scanner(System.in);
		System.out.println("입력할 부서번호는 (숫자 2자리 이내)? ");
		int deptno = scanner.nextInt();
		System.out.println("입력할 부서명은 ?");
		String dname = scanner.next();
		System.out.println("입력할 부서위치는 ?");
		String loc = scanner.next();
		//String sql = "INSERT INTO DEPT VALUES ("+deptno+",'"+dname+"','"loc"')";
		String sql = String.format("INSERT INTO DEPT VALUES(%d, '%s', '%s')", deptno, dname,loc);
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();
			int result = stmt.executeUpdate(sql);   //executeUpdate() : insert, update, delete문 전송-결과 int
													//executeQuery() : select문 전송 - 결과 resultSet
			System.out.println(result>0? "입력성공" : "입력실패");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println("중복된 부서번호이거나 부서명이나 위치를 너무 길게 입력한 경우 : "+ e.getMessage());
		}	finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
