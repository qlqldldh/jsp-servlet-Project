package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RqlectureDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	void Close() throws SQLException{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
	}
	
	public int insert(RqlectureVO rlv) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("insert into qcomment values(?,?,?)");
		
		pstmt.setInt(1, rlv.getRqno());
		pstmt.setString(2, rlv.getRqlec());
		pstmt.setString(3, rlv.getId());
		
		
		int ret = pstmt.executeUpdate();
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public ArrayList select() throws SQLException{
		ArrayList ret = new ArrayList();
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select * from rqlecture");
		rs=pstmt.executeQuery();
		
		ArrayList<String> temp;
		while(rs.next()) {
			temp=new ArrayList<>();
			for(int i=1;i<=3;i++) temp.add(rs.getString(i));
			ret.add(temp);
		}
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
//	public int delete(String id, String queno) throws SQLException{
//		conn=ConnectionHelper.getConn();
//		pstmt=conn.prepareStatement("delete from qcomment where id=? and queno=?");
//		pstmt.setString(1,id);
//		pstmt.setString(2,queno);
//		
//		int ret = pstmt.executeUpdate();
//		
//		Close();
//		ConnectionHelper.CloseConn(conn);
//		
//		return ret;
//	}
}
