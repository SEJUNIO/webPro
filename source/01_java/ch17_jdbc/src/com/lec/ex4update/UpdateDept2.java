package com.lec.ex4update;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

// ������ �μ���ȣ�� �޾� ���翩�θ� Ȯ���� ��, �μ���, �ٹ����� �Է¹޾� update ����
public class UpdateDept2 {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection conn = null;
		Statement stmt  = null;
		ResultSet rs = null;
		Scanner scanner = new Scanner(System.in);
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();		
			System.out.print("������ �μ���ȣ�� ?");
			int deptno = scanner.nextInt();
			String selectSQL = "SELECT * FROM DEPT WHERE DEPTNO=" + deptno;
			rs = stmt.executeQuery(selectSQL);
			if(rs.next()) {
				System.out.print("������ �μ����� ?");
				String dname = scanner.next();
				System.out.print("������ ��ġ�� ?");
				String loc = scanner.next();
				String updateSQL =String.format("UPDATE DEPT SET DNAME='%s', LOC='%s' WHERE DEPTNO=%d",
															dname, loc, deptno);
				int result = stmt.executeUpdate(updateSQL);
				if(result>0) {
					System.out.println(deptno+"�� �μ� ���� ����");
				}
			}else {
				System.out.println(deptno + "�� �μ��� ��ȿ�� �μ���ȣ�� �ƴմϴ�.");
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		scanner.close();
	}
}
