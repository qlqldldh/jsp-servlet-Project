package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class KStudentDAO {
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	public KStudentDAO() {
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
	
	public int insert(KStudentVO ksv) throws SQLException{
		conn=ConnectionHelper.getConn();
		int ret = 0;
		pstmt=conn.prepareStatement("insert into kstudent values(?,?,?,?)");
		
		pstmt.setInt(1,ksv.getKstudNo());
		pstmt.setString(2,ksv.getKsid());
		pstmt.setString(3,ksv.getKtype());
		pstmt.setInt(4,ksv.getLecno());
		
		ret=pstmt.executeUpdate();
		
		Close();
		ConnectionHelper.CloseConn(conn);
		return ret;
	}
	
	public LinkedList select() throws SQLException{ // 출력 시 DB Column의 dataType에 관계 없이 모두 String 으로 반환
		conn=ConnectionHelper.getConn();
		LinkedList ret = new LinkedList();
		pstmt=conn.prepareStatement("select * from kstudent");
		rs=pstmt.executeQuery();
		LinkedList<String> temp;
		
		while(rs.next()) {
			temp=new LinkedList<>();
			for(int i=1;i<=4;i++) temp.add(rs.getString(i));
			ret.add(temp);
		}
		Close();
		return ret;
	}
	
	public boolean isStudData(String id) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select ksid from kstudent");
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			if(rs.getString(1).equals(id)) {
				Close();
				return true;
			}
		}
		Close();
		return false;
	}
	
	public int getNewStudNumber() throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select ksid from kstudent");
		rs=pstmt.executeQuery();
		int ret=100000;
		while(rs.next()) ret+=1;
		
		Close();
		ConnectionHelper.CloseConn(conn);
		return ret;
	}
}
