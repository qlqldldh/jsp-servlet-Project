package models;

import java.sql.*;
import java.util.ArrayList;

public class KLectureDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	void Close() throws SQLException{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
	}
	
	public int insert(KLectureVO klv) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("insert into klecture values(?,?,?,?,?,?,?)");
		
		pstmt.setInt(1, klv.getLecno());
		pstmt.setString(2, klv.getName());
		pstmt.setString(3, klv.getForWho());
		pstmt.setString(4, klv.getIsFree());
		pstmt.setInt(5, klv.getLecDur());
		pstmt.setInt(6, klv.getKtno());
		pstmt.setString(7, klv.getCrsName());
		int ret = pstmt.executeUpdate();
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public ArrayList select() throws SQLException{
		ArrayList ret=new ArrayList();
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select * from klecture");
		rs=pstmt.executeQuery();
		ArrayList<String> temp;
		while(rs.next()) {
			temp=new ArrayList<>();
			
			for(int i=1;i<=7;i++) temp.add(rs.getString(i));
			ret.add(temp);
		}
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public ArrayList<String> selectNameByCrs(String crs) throws SQLException{
		ArrayList<String> ret=new ArrayList<>();
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select crsname, name from klecture");
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			if(rs.getString(1)!=null && crs.equals(rs.getString(1)))
				ret.add(rs.getString(2));
		}
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public int getNoByName(String name) throws SQLException{
		int ret=0;
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select lecno from klecture where name=?");
		pstmt.setString(1, name);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			ret=rs.getInt(1);
		}
		
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public boolean hasLect(String lecture) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select lecno from klecture where name=?");
		pstmt.setString(1, lecture);
		rs=pstmt.executeQuery();
		int cnt=0;
		while(rs.next()) {
			cnt+=1;
		}
		if(cnt==0) return false;
		return true;
	}
	
}








