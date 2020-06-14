package models;

import java.sql.*;
import java.util.ArrayList;

public class TestDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	public int insert(TestVO tv) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("insert into test values(?,?)");
		
		pstmt.setInt(1, tv.getNums());
		pstmt.setInt(2, tv.getId());
		
		int ret = pstmt.executeUpdate();
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		
		return ret;
	}
	
	public ArrayList<TestVO> select() throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select * from test order by id");
		rs=pstmt.executeQuery();
		
		ArrayList<TestVO> ret = new ArrayList<>();
		TestVO tv;
		while(rs.next()) {
			tv=new TestVO();
			
			tv.setNums(rs.getInt(1));
			tv.setId(rs.getInt(2));
			ret.add(tv);
		}
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		return ret;
	}
	
}
