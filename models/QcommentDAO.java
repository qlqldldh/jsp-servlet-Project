package models;

import java.sql.*;
import java.util.ArrayList;

public class QcommentDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	public int insert(QcommentVO qcv) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("insert into qcomment values(?,?,?,?,?,to_char(sysdate,'yyyy-mm-dd hh24:mi:ss'))");
		
		pstmt.setInt(1, qcv.getQueno());
		pstmt.setString(2, qcv.getTitle());
		pstmt.setString(3, qcv.getId());
		pstmt.setInt(4, qcv.getLecno());
		pstmt.setString(5, qcv.getContents());
		
		int ret = pstmt.executeUpdate();
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		
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
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		
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
		
		ConnectionHelper.CloseAll(conn, pstmt, rs);
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
		
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		return ret;
	}
	
	public int getNewQueNo() throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select queno from qcomment order by queno desc");
		rs=pstmt.executeQuery();
		
		int ret = 0;
		while(rs.next()) {
			ret = rs.getInt(1);
			break;
		}
		
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		return ret+1;
	}
	
	public int getQueno(String title, String id, String contents) throws SQLException{ // 여기부터  title, id, contents
		int ret = 0;
		
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select queno from qcomment where title=? and id=? and contents=?");
		pstmt.setString(1, title);
		pstmt.setString(2, id);
		pstmt.setString(3, contents);
		
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			ret = rs.getInt(1);
			break;
		}
		
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		return ret;
	}
	
	public int delete(String id, String queno) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("delete from qcomment where id=? and queno=?");
		pstmt.setString(1,id);
		pstmt.setString(2,queno);
		
		int ret = pstmt.executeUpdate();
		
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		return ret;
	}
	
}
