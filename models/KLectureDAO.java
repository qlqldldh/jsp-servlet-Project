package models;

import java.sql.*;
import java.util.ArrayList;
import models.Pair;

public class KLectureDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	public int getNewLecno() throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select lecno from klecture order by lecno desc");
		rs=pstmt.executeQuery();
		
		int ret = 0;
		while(rs.next()) {
			ret=rs.getInt(1);
			break;
		}
		
		ConnectionHelper.CloseAll(conn, pstmt, rs);		
		return ret+1;
	}
	
	public int insert(KLectureVO klv) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("insert into klecture values(?,?,?,?,?)");
		
		pstmt.setInt(1, klv.getLecno()); // from 'getNewLecno()'
		pstmt.setString(2, klv.getName());
		pstmt.setInt(3, klv.getLecDur());
		pstmt.setInt(4, klv.getKtno()); // from kteacher or kostapeople table
		pstmt.setString(5, klv.getCrsName()); // from session binding course name
		int ret = pstmt.executeUpdate();
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		
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
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		
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
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		return ret;
	}
	
	public ArrayList<Pair> selectPairByCrs(String crs) throws SQLException{
		ArrayList<Pair> ret = new ArrayList<>();
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select l.name as lecname, ktt.name as ktname from klecture l join (select kt.kteacherno, kos.name from kteacher kt join kostapeople kos on kos.id=kt.ktid) ktt on ktt.kteacherno=l.ktno where l.crsname=?");
		pstmt.setString(1, crs);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			ret.add(new Pair(rs.getString(1),rs.getString(2))); // first : lecname / second : teacher name
		}
		
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		return ret;
	}
	
	public int getLecNo(String lecname, String ktname) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select lecno, l.name from (select kp.name, kt.kteacherno from kostapeople kp join kteacher kt on kp.id=kt.ktid where name=?) t " + 
				"join klecture l on t.kteacherno=l.ktno where l.name=?");
		pstmt.setString(1, ktname);
		pstmt.setString(2, lecname);
		
		rs=pstmt.executeQuery();
		
		int ret = 0;
		while(rs.next()) {
			ret=rs.getInt(1);
		}
		
		ConnectionHelper.CloseAll(conn, pstmt, rs);
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
		
		ConnectionHelper.CloseAll(conn, pstmt, rs);
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
		
		ConnectionHelper.CloseAll(conn, pstmt, rs);
		if(cnt==0) return false;
		return true;
	}
	
}


