package models;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class ConnectionHelper {
	public static Connection getConn() throws SQLException{
		
		InitialContext inicon;
		try {
			inicon = new InitialContext();
			Context ctx = (Context) inicon.lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("jdbc:dbcpTestDB");
			
			return ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
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
