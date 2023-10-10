package com.lec.ex.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.ex.dto.MemberDto;

public class MemberDao {
	public static final int EXISTENT = 0;
	public static final int NON_EXISTENT = 1;
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	private DataSource ds = null;
	//싱글톤
	private static MemberDao Instance = new MemberDao();
	public static MemberDao getInstance() {
		return Instance;
	}
	
	private MemberDao() {
		//ds에 커넥션풀에 있는 ds를 할당
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
//	private Connection getConnection() { //ds변수 안받으면 getConnetcion 으로 할당
//		Connection conn = null;
//		try {
//			Context ctx = new InitialContext();
//			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
//			conn = ds.getConnection();
//		} catch (NamingException e) {
//			System.out.println(e.getMessage());
//		}
//		return conn;
//	}
	// (1) 회원 MID 중복체크
	public int midConfirm(String mid) {
		int result = EXISTENT;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MVC_MEMBER WHERE mID=?";
		try {
			conn = ds.getConnection();  //import할때 sql 로
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = EXISTENT;
			}else {
				result = NON_EXISTENT;
			}
		}catch(SQLException e) {
			System.out.println(e.getMessage() + " - 중복체크");
		} finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// (2) 회원가입
	public int joinMember(MemberDto member) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)" + 
				    	"VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();  //import할때 sql 로
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMid());
			pstmt.setString(2, member.getMpw());
			pstmt.setString(3, member.getMname());
			pstmt.setString(4, member.getMemail());
			pstmt.setString(5, member.getMphoto());
			pstmt.setDate(6, member.getMbirth());
			pstmt.setString(7, member.getMaddress());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	// (3) 로그인
	public int loginCheck(String mid, String mpw) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MVC_MEMBER WHERE mID=? AND mPW = ?";
		try {
			conn = ds.getConnection();  //import할때 sql 로
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = SUCCESS;
			}
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// (4) MID로 DTO 가져오기 (로그인 성공시 SESSION에 SETATTRIBUTE하기 위함)
	public MemberDto getMember(String mid) {
		MemberDto member = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MVC_MEMBER WHERE mID=?";
		try {
			conn = ds.getConnection();  //import할때 sql 로
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//String mid;
				String mpw       = rs.getString("mpw");
				String mname     = rs.getString("mname");
				String memail    = rs.getString("memail");
				String mphoto    = rs.getString("mphoto");
				Date mbirth      = rs.getDate("mbirth");
				String maddress  = rs.getString("maddress");
				Timestamp mrdate = rs.getTimestamp("mrdate");
				member = new MemberDto(mid, mpw, mname, memail, mphoto, mbirth, maddress, mrdate);
			}
		}catch(SQLException e) {
			System.out.println(e.getMessage() + " - dto가져오기");
		} finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return member;
	}
	// (5) 회원정보수정( 특정 MID의 정보수정)
	public int modifyMember(MemberDto member) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MVC_MEMBER" + 
				" SET mPW = ?," + 
				"    mNAME = ?," + 
				"    mEMAIL = ?," + 
				"	 mPHOTO = ?," +
				"    mBirth = ?," + 
				"    mAddress = ?" + 
				"WHERE mID = ?";
		try {
			conn = ds.getConnection();  //import할때 sql 로
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMpw());
			pstmt.setString(2, member.getMname());
			pstmt.setString(3, member.getMemail());
			pstmt.setString(4, member.getMphoto());
			pstmt.setDate(5, member.getMbirth());
			pstmt.setString(6, member.getMaddress());
			pstmt.setString(7, member.getMid());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e.getMessage() + "- update 오류");
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// (6) 회원리스트(TOP-N) 구문
	public ArrayList<MemberDto> getMemberlist(int startRow, int endRow){
		ArrayList<MemberDto> members = new ArrayList<MemberDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM MVC_MEMBER ORDER BY mRDATE DESC) A)" + 
				    	"WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();  //import할때 sql 로
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//String mid;
				String mid       = rs.getString("mid");
				String mpw       = rs.getString("mpw");
				String mname     = rs.getString("mname");
				String memail    = rs.getString("memail");
				String mphoto    = rs.getString("mphoto");
				Date mbirth      = rs.getDate("mbirth");
				String maddress  = rs.getString("maddress");
				Timestamp mrdate = rs.getTimestamp("mrdate");
				MemberDto member = new MemberDto(mid, mpw, mname, memail, mphoto, mbirth, maddress, mrdate);
				members.add(member);
			}
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return members;
	}
	// (7) 회원수
	public int getMemberTotCnt() {
		int totCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) CNT FROM MVC_MEMBER";
		try {
			conn = ds.getConnection();  //import할때 sql 로
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totCnt = rs.getInt("cnt");
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return totCnt;
	}
	// (8) 회원탈퇴
	public int withdrawalMember(String mid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM MVC_MEMBER WHERE mID=?";
		try {
			conn = ds.getConnection();  //import할때 sql 로
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}	
}
