package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QreplyDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	void Close() throws SQLException{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
	}
	
	public int insert(QreplyVO qcv) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("insert into qreply values(?,?,?)");
		
		pstmt.setInt(1, qcv.getQrno());
		pstmt.setString(2, qcv.getReply());
		pstmt.setInt(3, qcv.getQueno());
		
		int ret = pstmt.executeUpdate();
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public ArrayList select() throws SQLException{
		ArrayList ret = new ArrayList();
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select * from qreply");
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
	
	public int delete(String id, String qrno) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("delete from qreply where id=? and qrno=?");
		pstmt.setString(1,id);
		pstmt.setString(2,qrno);
		
		int ret = pstmt.executeUpdate();
		
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
}
