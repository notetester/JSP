package board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.sql.DataSource;

import util.JdbcUtil;

import javax.naming.InitialContext;


public class BoardDAO {
	
	private static BoardDAO instance = new BoardDAO();
	private BoardDAO() {
		try {
			InitialContext ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("클래스 로딩중 에러");
		}
	}
	public static BoardDAO getInstance() {
		return instance;
	}
	private DataSource ds;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public void regist(String writer,String title,String content) {
		String sql="insert into testboard(writer,title,content) values(?,?,?)";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,writer);
			pstmt.setString(2,title);
			pstmt.setString(3,content);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn,pstmt,null);
		}
	}
	
	public ArrayList<BoardVO> getList(int pageNum,int amount) {
		ArrayList<BoardVO> list=new ArrayList<BoardVO>();
		String sql="SELECT*FROM(SELECT ROWNUM RN,BNO,WRITER,TITLE,CONTENT,REGDATE,HIT FROM(SELECT*FROM TESTBOARD ORDER BY BNO DESC))WHERE RN>? AND RN<=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,(pageNum-1)*amount);
			pstmt.setInt(2,pageNum*amount);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int bno=rs.getInt("BNO");
				String writer=rs.getString("WRITER");
				String title=rs.getString("TITLE");
				String content=rs.getString("CONTENT");
				Timestamp regdate=rs.getTimestamp("REGDATE");
				int hit=rs.getInt("HIT");
				BoardVO vo=new BoardVO(bno, writer, title, content, regdate, hit);
				list.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn,pstmt,rs);
		}
		return list;
	}

	public BoardVO getContent(String bno) {
		BoardVO vo=new BoardVO();
		String sql="select * from testboard where bno=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,Integer.parseInt(bno));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setBno(rs.getInt("BNO"));
				vo.setWriter(rs.getString("WRITER"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setContent(rs.getString("CONTENT"));
				vo.setRegdate(rs.getTimestamp("REGDATE"));
				vo.setHit(rs.getInt("HIT"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn,pstmt,rs);
		}
		return vo;
	}
	
	public void update(String bno,String writer,String title,String content) {
		String sql="update testboard set writer=?, title=?, content=? where bno=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,writer);
			pstmt.setString(2,title);
			pstmt.setString(3,content);
			pstmt.setInt(4,Integer.parseInt(bno));
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn,pstmt,null);
		}
	}
	
	public void delete(String bno) {
		String sql="delete testboard where bno=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,Integer.parseInt(bno));
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn,pstmt,null);
		}
	}
	
	public void upHit(String bno) {
		String sql="update testboard set hit=hit+1 where bno=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,Integer.parseInt(bno));
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn,pstmt,null);
		}
	}
	
	public int getTotal() {
		int total=0;
		String sql="SELECT COUNT(*) AS TOTAL FROM TESTBOARD";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				total=rs.getInt("total");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn,pstmt,rs);
		}
		return total;
	}
	
	public ArrayList<BoardVO> getUserWriteList(int pageNum,int amount,String writer) {
		ArrayList<BoardVO> list=new ArrayList<BoardVO>();
		String sql="SELECT*FROM(SELECT ROWNUM RN,BNO,WRITER,TITLE,CONTENT,REGDATE,HIT FROM(SELECT*FROM TESTBOARD WHERE WRITER=? ORDER BY BNO DESC))WHERE RN>? AND RN<=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,writer);
			pstmt.setInt(2,(pageNum-1)*amount);
			pstmt.setInt(3,pageNum*amount);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int bno=rs.getInt("BNO");
				writer=rs.getString("WRITER");
				String title=rs.getString("TITLE");
				String content=rs.getString("CONTENT");
				Timestamp regdate=rs.getTimestamp("REGDATE");
				int hit=rs.getInt("HIT");
				BoardVO vo=new BoardVO(bno, writer, title, content, regdate, hit);
				list.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn,pstmt,rs);
		}
		return list;
	}
	
	public int getUserWriteTotal(String writer) {
		int total=0;
		String sql="SELECT COUNT(*) AS TOTAL FROM TESTBOARD WHERE WRITER=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,writer);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				total=rs.getInt("total");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn,pstmt,rs);
		}
		return total;
	}
}
