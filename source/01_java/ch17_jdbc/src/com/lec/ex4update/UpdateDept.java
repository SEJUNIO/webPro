package com.lec.ex4update;
//����ڿ��� ������ �μ���ȣ�� �μ���, �ٹ����� �Է¹޾� update ����
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class UpdateDept {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection conn = null;
		Statement stmt  = null;
		Scanner scanner = new Scanner(System.in);
		System.out.print("������ �μ���ȣ�� ?");
		int deptno = scanner.nextInt();
		//�μ���ȣ�� ���� Ȯ��
		
		System.out.print("������ �μ����� ?");
		String dname = scanner.next();
		System.out.print("������ ��ġ�� ?");
		String loc = scanner.next();
		String sql = String.format("UPDATE DEPT SET DNAME='%s', LOC='%s' WHERE DEPTNO=%d", dname, loc, deptno);
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();
			int result = stmt.executeUpdate(sql);
			System.out.println(result>0? deptno + "�� �μ� ��������" : deptno+ "�� �μ��� ��� ���� ����");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
		
		
		
	}
}