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
	
	public void Close() throws SQLException{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
	}
	
	public int insert(KStudentVO ksv) throws SQLException{
		conn=ConnectionHelper.getConn();
		int ret = 0;
		pstmt=conn.prepareStatement("insert into kstudent values(?,?,?)");
		
		pstmt.setInt(1,ksv.getKstudNo());
		pstmt.setString(2,ksv.getKsid());
		pstmt.setInt(3,ksv.getLecno());
		
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
			for(int i=1;i<=3;i++) temp.add(rs.getString(i));
			ret.add(temp);
		}
		Close();
		return ret;
	}
	
	public boolean isEnrolled(String id) throws SQLException{
		boolean ret = false;
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select lecno from kstudent where ksid=?");
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			if(rs.getInt(1)>0) ret=true;
		}
		
		Close();
		ConnectionHelper.CloseConn(conn);
		
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
		pstmt=conn.prepareStatement("select kstudid from kstudent order by kstudid desc");
		rs=pstmt.executeQuery();
		int ret=0;
		while(rs.next()) {
			ret=rs.getInt(1);
			break;
		}
		
		Close();
		ConnectionHelper.CloseConn(conn);
		return ret+1;
	}
	
	public int updateLecNo(String id, int lecno) throws SQLException{ // 수강신청용
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("update kstudent set lecno=? where ksid=?");
		
		pstmt.setInt(1, lecno);
		pstmt.setString(2, id);
		
		int ret = pstmt.executeUpdate();
		
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
}
