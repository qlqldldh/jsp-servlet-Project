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
	
	public int getNewQrno() throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select qrno from qreply order by qrno desc");
		rs = pstmt.executeQuery();
		
		int ret = 0;
		while(rs.next()) {
			ret=rs.getInt(1);
			break;
		}
		
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret+1;
	}
	
	public int insert(QreplyVO qcv) throws SQLException{
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("insert into qreply values(?,?,?,?)");
		
		pstmt.setInt(1, qcv.getQrno());
		pstmt.setString(2, qcv.getReply());
		pstmt.setInt(3, qcv.getQueno());
		pstmt.setString(4, qcv.getId());
		
		int ret = pstmt.executeUpdate();
		Close();
		ConnectionHelper.CloseConn(conn);
		
		return ret;
	}
	
	public ArrayList<QreplyVO> select(int queno) throws SQLException{
		ArrayList<QreplyVO> ret = new ArrayList<>();
		conn=ConnectionHelper.getConn();
		pstmt=conn.prepareStatement("select * from qreply where queno=? order by qrno desc");
		pstmt.setInt(1, queno);
		
		rs=pstmt.executeQuery();
		
		QreplyVO temp;
		while(rs.next()) {
			temp=new QreplyVO();
			temp.setQrno(rs.getInt(1));
			temp.setReply(rs.getString(2));
			temp.setQueno(rs.getInt(3));
			temp.setId(rs.getString(4));
			
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
