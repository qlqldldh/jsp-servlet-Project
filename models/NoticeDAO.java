package models;

import java.sql.*;
import java.util.ArrayList;

public class NoticeDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	void Close() throws SQLException{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
	}
	
	public int insert(NoticeVO nv) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("insert into notice values(?,?,?)");
		String[] strs = nv.toString().split(",");
		
		for(int i=1;i<=3;i++) pstmt.setString(i, strs[i-1]);
		int ret = pstmt.executeUpdate();
		
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public ArrayList selectList() throws SQLException{
		ArrayList ret = new ArrayList();
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select rownum, title,uldate from (select * from notice order by uldate)");
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
	
	public ArrayList<String> selectDetail(String title) throws SQLException{
		ArrayList<String> ret = new ArrayList<>();
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select * from notice where title=?");
		pstmt.setString(1, title);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			for(int i=1;i<=3;i++) ret.add(rs.getString(i));
		}
		
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
}

