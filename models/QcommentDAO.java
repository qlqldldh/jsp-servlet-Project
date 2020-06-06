package models;

import java.sql.*;
import java.util.ArrayList;

public class QcommentDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	void Close() throws SQLException{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
	}
	
	public int insert(QcommentVO qcv) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("insert into qcomment values(?,?,?,?,?,sysdate)");
		
		pstmt.setInt(1, qcv.getQueno());
		pstmt.setString(2, qcv.getTitle());
		pstmt.setString(3, qcv.getId());
		pstmt.setInt(4, qcv.getLecno());
		pstmt.setString(5, qcv.getContents());
		
		int ret = pstmt.executeUpdate();
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public ArrayList select() throws SQLException{
		ArrayList ret = new ArrayList();
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select * from qcomment");
		rs=pstmt.executeQuery();
		
		ArrayList<String> temp;
		while(rs.next()) {
			temp=new ArrayList<>();
			for(int i=1;i<=5;i++) temp.add(rs.getString(i));
			ret.add(temp);
		}
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public ArrayList selectList() throws SQLException{
		ArrayList ret = new ArrayList();
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select rownum, name, title, id, uldate from (select l.name, q.title, q.id, q.uldate from qcomment q join klecture l on q.lecno=l.lecno order by q.uldate desc)");
		rs = pstmt.executeQuery();
		
		ArrayList<String> temp;
		while(rs.next()) {
			temp=new ArrayList<>();
			for(int i=1;i<=5;i++) temp.add(rs.getString(i));
			ret.add(temp);
		}
		
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public ArrayList<String> selectDetail(String title) throws SQLException{
		ArrayList<String> ret = new ArrayList<>();
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select title,id, uldate, contents from qcomment where title=?");
		pstmt.setString(1, title);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			for(int i=1;i<=4;i++) ret.add(rs.getString(i));
		}
		
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public int getQueNo() throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select count(*) from qcomment");
		rs=pstmt.executeQuery();
		
		int ret = 30000;
		while(rs.next()) {
			ret+=rs.getInt(1);
		}
		
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret+1;
	}
	
	public int delete(String id, String queno) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("delete from qcomment where id=? and queno=?");
		pstmt.setString(1,id);
		pstmt.setString(2,queno);
		
		int ret = pstmt.executeUpdate();
		
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
}
