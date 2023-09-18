package com.lec.customer;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CustomerDao {
	public static final int CUSTOMER_EXISTENT = 0;
	public static final int CUSTOMER_NONEXISTENT = 1;
	public static final int LOGIN_SUCCESS = 1;
	public static final int	LOGIN_FAIL_PW = 0;
	public static final int LOGIN_FAIL_ID = -1;
	public static final int SUCCESS = 1;
	public static final int FAIL    = 0;

	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return  conn;
		//1. 회원가입시 ID 중복체크 : 
}}