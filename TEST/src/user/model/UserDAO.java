package user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import util.JdbcUtil;

import javax.naming.InitialContext;


public class UserDAO {
	private static UserDAO instance = new UserDAO();
	private UserDAO() {
		try {
			InitialContext ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("클래스 로딩중 에러");
		}
	}
	public static UserDAO getInstance() {
		return instance;
	}
	private DataSource ds;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	public int checkId(String id) {
		
		int result = 0;
		
		String sql ="select * from testusers where id = ?";
		
		try {
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return result;
	}

	public int insert(UserVO vo) {
		int result = 0;
		
		String sql = "insert into testusers(id,password,name,hp1,hp2,hp3,email1,email2,addrbasic,addrdetail) values(?,?,?,?,?,?,?,?,?,?)";
		
		try {
			
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId() );
			pstmt.setString(2, vo.getPassword() );
			pstmt.setString(3, vo.getName() );
			pstmt.setString(4, vo.getHp1() );
			pstmt.setString(5, vo.getHp2() );
			pstmt.setString(6, vo.getHp3() );
			pstmt.setString(7, vo.getEmail1() );
			pstmt.setString(8, vo.getEmail2() );
			pstmt.setString(9, vo.getAddrbasic() );
			pstmt.setString(10, vo.getAddrdetail() );
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, null);
		}
		
		
		return result;
	}
	

	public int login(String id, String password) {
		
		int result= 0;
		
		String sql = "select * from testusers where id = ? and password = ?";
		
		try {
			
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else {
				result = 0;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
			
		}
		return result;
	}

	public UserVO getInfo(String id) {
		
		UserVO vo = new UserVO();
		
		String sql = "select * from testusers where id = ?" ;
		
		try {
			
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				vo.setId( rs.getString("id") );
				vo.setPassword(rs.getString("password"));
				vo.setName( rs.getString("name") );
				vo.setHp1(rs.getString("hp1") );
				vo.setHp2(rs.getString("hp2") );
				vo.setHp3(rs.getString("hp3") );
				vo.setEmail1(rs.getString("email1") );
				vo.setEmail2(rs.getString("email2") );
				vo.setAddrbasic(rs.getString("addrbasic") );
				vo.setAddrdetail(rs.getString("addrdetail") );
				vo.setRegdate(rs.getTimestamp("regdate"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}
	

	public int update(UserVO vo) {
		int result = 0;
		
		String sql = "update testusers set password=?,name=?,hp1=?,hp2=?,hp3=?,email1=?,email2=?,addrbasic=?,addrdetail=? where id=?";
		
		try {
			
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPassword() );
			pstmt.setString(2, vo.getName() );
			pstmt.setString(3, vo.getHp1() );
			pstmt.setString(4, vo.getHp2() );
			pstmt.setString(5, vo.getHp3() );
			pstmt.setString(6, vo.getEmail1() );
			pstmt.setString(7, vo.getEmail2() );
			pstmt.setString(8, vo.getAddrbasic() );
			pstmt.setString(9, vo.getAddrdetail() );
			pstmt.setString(10, vo.getId() );
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, null);
		}
		
		
		return result;
	}

	public int delete(String id) {
		int result = 0;
		
		String sql = "delete testusers where id=?";
		
		try {
			
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, null);
		}
		
		
		return result;
	}
	
	
	
	
	
	
	
	
}
