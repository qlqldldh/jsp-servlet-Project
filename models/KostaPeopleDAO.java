package models;

import java.sql.*;
import javax.sql.*;
import java.util.ArrayList;

public class KostaPeopleDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public int insert(KostaPeopleVO kpv) throws SQLException {
		conn = ConnectionHelper.getConn();
		int ret = 0;
		pstmt = conn.prepareStatement("insert into kostapeople values(?,?,?,?,?)");

		pstmt.setString(1, kpv.getId());
		pstmt.setString(2, kpv.getPassword());
		pstmt.setString(3, kpv.getName());
		pstmt.setInt(4, kpv.getAge());
		pstmt.setString(5, kpv.getEmail());

		ret = pstmt.executeUpdate();

		ConnectionHelper.CloseAll(conn, pstmt, rs);

		return ret;
	}

	public ArrayList select() throws SQLException { // 출력 시 DB Column의 dataType에 관계 없이 모두 String 으로 반환
		conn = ConnectionHelper.getConn();
		ArrayList ret = new ArrayList();
		pstmt = conn.prepareStatement("select * from kostapeople");
		rs = pstmt.executeQuery();
		ArrayList<String> temp;

		while (rs.next()) {
			temp = new ArrayList<>();
			for (int i = 1; i <= 5; i++)
				temp.add(rs.getString(i));
			ret.add(temp);
		}
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		return ret;
	}

	public boolean hasLogData(String id, String pwd) throws SQLException {
		conn = ConnectionHelper.getConn();
		pstmt = conn.prepareStatement("select id, password from kostapeople");
		rs = pstmt.executeQuery();
		while (rs.next()) {
			if (rs.getString(1).equals(id) && rs.getString(2).equals(pwd)) {
				ConnectionHelper.CloseAll(conn, pstmt, rs);
				return true;
			}
		}
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		return false;
	}

	public int update(String id, String pwd) throws SQLException { // id : from session // pwd : from a user --
																	// password를 바꾸는 모듈에 사용
		conn = ConnectionHelper.getConn();
		int ret;
		pstmt = conn.prepareStatement("update kostapeople set password=? where id=?");
		pstmt.setString(1, pwd);
		pstmt.setString(2, id);
		ret = pstmt.executeUpdate();
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		return ret;
	}

	public int delete(String id, String pwd) throws SQLException { // id, password : from session // if ret==0 -> alert
																	// to user
		conn = ConnectionHelper.getConn();
		int ret = 0;
		if (hasLogData(id, pwd)) {
			pstmt = conn.prepareStatement("delete from kostapeople where id=?");
			pstmt.setString(1, id);
			ret = pstmt.executeUpdate();
		}
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		return ret;
	}
}
