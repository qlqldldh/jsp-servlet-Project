package models;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class ConnectionHelper {
	public static Connection getConn() throws SQLException{
		try {
			InitialContext inicon = new InitialContext();
			Context ctx = (Context) inicon.lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("jdbc:dbcpTestDB");
			
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static void CloseAll(Connection conn, PreparedStatement pstmt, ResultSet rs) throws SQLException{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
}
