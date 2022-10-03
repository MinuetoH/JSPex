package model;

import java.awt.geom.RectangularShape;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
	//mem 내용을 db에 insert
	public boolean insert(Member mem) {
		//1. Connection 객체
		Connection conn = DBConnection.getConnection();
		//2. Statement 객체
		/*
		 * PrepareStatement : Statement의 하위 인터페이스
		 *                    미리 sql 문장을 db에 전송
		 *                    파라미터로 값을 전달 방식
		 */
		PreparedStatement pstmt = null;
		String sql = "insert into member"
				+ " (id,pass,name,gender,tel,email,picture)"
				+ " values (?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, mem.getId());    //1 : 첫번째 ?
			pstmt.setString(2, mem.getPass());  //2 : 두번째 ?
			pstmt.setString(3, mem.getName());
			pstmt.setInt(4, mem.getGender());
			pstmt.setString(5, mem.getTel());
			pstmt.setString(6, mem.getEmail());
			pstmt.setString(7, mem.getPicture());
			//executeUpdate() : select 외에 사용되는 메서드
			//                  변경되는 레코드 갯수 리턴

			//sql문장실행. 회원정보가 db insert됨
			int cnt = pstmt.executeUpdate(); 
			if (cnt > 0) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//return구문 실행되도 실행됨.
			DBConnection.close(conn, pstmt, null);
		}
		return false;			
	}
	public Member selectOne(String id) {
		Connection conn = DBConnection.getConnection();
		String sql = "select * from member where id= ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sql);
			//ResultSet executeQuery : select 구문 
			rs = pstmt.executeQuery();
			if(rs.next()) {	//id에 해당하는 레코드 존재?
				Member mem = new Member();
				mem.setId(rs.getString("id"));
				mem.setPass(rs.getString("pass"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getInt("gender"));
				mem.setTel(rs.getString("tel"));
				mem.setEmail(rs.getString("email"));
				mem.setPicture(rs.getString("picture"));
				return mem;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}
}