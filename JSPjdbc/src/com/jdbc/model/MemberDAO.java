package com.jdbc.model;

import java.sql.*;

public class MemberDAO {

	/*
	 * 1. DAO는 클래스를 단순히 DB연동기능을 수행하면 되기 때문에
	 * 불필요하게 여러개 생성되도록 구성할 필요가 없기 때문에 싱글톤 패턴으로 생성합니다.
	 */
	//1. 스스로 객체를 생성하고 1개로 제한
	private static MemberDAO instance = new MemberDAO();
	
	//2. 직접 생성할 수 없도록 생성자에 private을 붙임
	private MemberDAO() {
		//객체가 생성될때 JDBC드라이버 로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.println("클래스 로딩중 에러");
		}
		
	}
	//3. 외부에서 객체생성을 요구할 때 getter메서드를 통해 반환함
	public static MemberDAO getInstance() {
		return instance;
	}
	
	
	//DAO에 회원관리에 필요한 기능을 메서드로 생성, DB관련변수를 멤버변수로 선언
	private String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	private String uid = "JSP";
	private String upw = "JSP";
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	//회원가입 메서드
	public int join(MemberVO vo) {
		int result = 0;

		String sql = "insert into members values(?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId() );
			pstmt.setString(2, vo.getPw() );
			pstmt.setString(3, vo.getName() );
			pstmt.setString(4, vo.getPhone1() );
			pstmt.setString(5, vo.getPhone2() );
			pstmt.setString(6, vo.getPhone3() );
			pstmt.setString(7, vo.getGender() );
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
			}
		}
		
		return result;
	}
	
	//로그인메서드
	public int login(String id ,String pw) {
		int result = 0;
		
		String sql = "select * from members where id = ? and pw = ?";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id );
			pstmt.setString(2, pw );
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1; //성공의 의미로 1반환
			} else {
				result = 0; //실패의 의미로 0반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				
			}
		}
		
		return result;
	}
	
	//회원정보를 가지고 오는 메서드
	public MemberVO getInfo(String id) {
		MemberVO vo = null;
		
		String sql = "select * from members where id = ?";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				String name = rs.getString("name");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender = rs.getString("gender");
				
				vo = new MemberVO(id, null, name, phone1, phone2, phone3, gender);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
			}
		}
		
		
		return vo;
	}
	
	
	
	
	
	
}
