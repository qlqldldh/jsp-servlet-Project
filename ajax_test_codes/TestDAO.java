package models;

import java.sql.*;
import java.util.ArrayList;

public class TestDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs= null;
	
	void Close() throws SQLException{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
	}
	
	public int insert(int number, int id) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("insert into test values(?,?)");
		
		pstmt.setInt(1, number);
		pstmt.setInt(2, id);
		
		int ret = pstmt.executeUpdate();
		
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public ArrayList<TestVO> select() throws SQLException{
		ArrayList<TestVO> ret = new ArrayList<>();
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select * from test order by nums");
		rs=pstmt.executeQuery();
		TestVO tv;
		while(rs.next()) {
			tv=new TestVO();
			tv.setNums(rs.getInt(1));
			tv.setId(rs.getInt(2));
			ret.add(tv);
		}
		
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
}
