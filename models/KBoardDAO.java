package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class KBoardDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	void Close() throws SQLException{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
	}
	
	public int getNewBoardno() throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select boardno from kboard order by boardno desc");
		rs=pstmt.executeQuery();
		
		int ret = 0;
		while(rs.next()) {
			ret=rs.getInt(1);
			break;
		}
		
		Close();
		ConnectionHelper.CloseConn(conn);
		System.out.println(ret);
		return ret + 1;
	}
	
	
	public int insert(KBoardVO kbv) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("insert into kboard values(?,?,?,?,?,?,?)");
		
		pstmt.setInt(1, kbv.getBoardNo()); // from 'getNewBoardno()'
		pstmt.setInt(2, kbv.getLecno()); // from klecture table (lecno)
		pstmt.setString(3, kbv.getStartDate());
		pstmt.setString(4, kbv.getLoc());
		pstmt.setString(5, kbv.getPurpose());
		pstmt.setString(6, kbv.getContents());
		pstmt.setString(7, kbv.getKtarget());
		
		int ret = pstmt.executeUpdate();
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public ArrayList select() throws SQLException{
		ArrayList ret=new ArrayList();
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select * from kboard");
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
	
	public ArrayList<String> selectByLecno(int lecno) throws SQLException{
		ArrayList<String> ret = new ArrayList<>();
		
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select kb.startdate, kb.loc, kl.ktno,kl.lecdur,kb.purpose,kb.contents,kb.ktarget from kboard kb join klecture kl on kb.lecno=kl.lecno where kl.lecno=?");
		pstmt.setInt(1, lecno);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			for(int i=1;i<=7;i++) ret.add(rs.getString(i));
		}
		
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public ArrayList<String> selectContents() throws SQLException{
		ArrayList<String> ret=new ArrayList<>();
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select contents from kboard");
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			ret.add(rs.getString(1));
		}
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public String selectContentByLec(String lecname) throws SQLException{ // need to modify
		String ret="not found";
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select kl.name, kb.contents from klecture kl join kboard kb on kl.lecno=kb.lecno");
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			if(lecname.equals(rs.getString(1))) {
				ret=rs.getString(2);
				break;
			}
		}
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
}
