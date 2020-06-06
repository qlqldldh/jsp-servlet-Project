package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class KTeacherDAO {
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	public KTeacherDAO() {
//		try {
//			if(conn==null)
//				conn=ConnectionHelper.getConn();
//			System.out.println("KStudent Connection Success");
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
	}
	
	public void Close() throws SQLException{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
	}
	
	public int insert(KTeacherVO ktv) throws SQLException{
		conn=ConnectionHelper.getConn();
		int ret = 0;
		pstmt=conn.prepareStatement("insert into kteacher values(?,?,?)");
		
		pstmt.setInt(1,ktv.getKteacherNo());
		pstmt.setString(2,ktv.getKtid());
		pstmt.setString(3,ktv.getPos());
		
		ret=pstmt.executeUpdate();
		
		Close();
		ConnectionHelper.CloseConn(conn);
		return ret;
	}
	
	public LinkedList select() throws SQLException{ // 출력 시 DB Column의 dataType에 관계 없이 모두 String 으로 반환
		conn=ConnectionHelper.getConn();
		LinkedList ret = new LinkedList();
		pstmt=conn.prepareStatement("select * from kteacher");
		rs=pstmt.executeQuery();
		LinkedList<String> temp;
		
		while(rs.next()) {
			temp=new LinkedList<>();
			for(int i=1;i<=3;i++) temp.add(rs.getString(i));
			ret.add(temp);
		}
		Close();
		ConnectionHelper.CloseConn(conn);
		return ret;
	}
	
	public boolean isTeacherData(String id) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select ktid from kteacher");
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			if(rs.getString(1).equals(id)) {
				Close();
				return true;
			}
		}
		Close();
		ConnectionHelper.CloseConn(conn);
		return false;
	}
	
	public int getNewTeacherNumber() throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select ktid from kteacher");
		rs=pstmt.executeQuery();
		int ret=1000;
		while(rs.next()) ret+=1;
		
		Close();
		ConnectionHelper.CloseConn(conn);
		return ret;
	}
}
