package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.DBConnection;

public class BookDao {
	public boolean insert(Book book) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select nvl(max(seq),0) from book");
			rs=pstmt.executeQuery();
			rs.next();
			int maxseq=rs.getInt(1);
			maxseq++;
			pstmt.close();
			pstmt = conn.prepareStatement
					("insert into book (seq,writer,title,content,regdate)"
					+"values(?,?,?,?,sysdate)");
			pstmt.setInt(1, maxseq);
			pstmt.setString(2, book.getWriter());
			pstmt.setString(3, book.getTitle());
			pstmt.setString(4, book.getContent());
			//pstmt.setString(5, book.getContent());
			return pstmt.executeUpdate() > 0;
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return false;
	}
}
