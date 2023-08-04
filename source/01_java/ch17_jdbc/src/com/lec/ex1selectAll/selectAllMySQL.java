package com.lec.ex1selectAll;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

public class selectAllMySQL {
	public static void main(String[] args) {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/kimdb?serverTimezone=UTC";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM PERSONAL";
		try {
			Class.forName(driver);  // 1. ����̹��ε�
			conn = DriverManager.getConnection(url, "root", "mysql"); // 2. DB����
			stmt = conn.createStatement(); // 3. SQL���۰�ü ����
			rs   = stmt.executeQuery(sql); // 4. SQL���� + 5. SQL�� ��� �ޱ�
		//6. ��� �޾� ���ϴ� ���� ����
			System.out.println("���\t�̸�\t��å\t\t�����\t�Ի���\t\t�޿�\t��\t�μ���ȣ"); // Ÿ��Ʋ
			while(rs.next()) {
				int pno = rs.getInt("pno");
				String pname = rs.getString("pname");
				String job   = rs.getString("job");
				String manager  = rs.getString("manager");
				Date startdate  = rs.getDate("startdate");
				Timestamp startdate1 = rs.getTimestamp("startdate");
				int pay = rs.getInt("pay");
				int bonus = rs.getInt("bonus");
				int dno = rs.getInt("dno");
				if(job.length() >=8) {
					System.out.printf("%d\t%s\t%s\t%s\t%TF\t%d\t%d\t%d\n",
							pno, pname, job, manager, startdate, pay, bonus, dno);
				}else {
					System.out.printf("%d\t%s\t%s\t\t%s\t%TF\t%d\t%d\t%d\n",
							pno, pname, job, manager, startdate, pay, bonus, dno);
				}
				
			}//while
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally { //7. DB��������
			try {
				if(rs!=null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}// try-catch-finally
	} //main
} //class
