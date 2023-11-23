package dao;

import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import util.ConnectionPool;

public class LoginDao {
	public boolean exists(String uid, String upass) 
			throws NamingException, SQLException{
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			String sql="select id,pw from user where id=? and pw=?";
			conn=ConnectionPool.get();
			stmt=conn.prepareStatement(sql);
			
			stmt.setString(1,uid);
			stmt.setString(2,upass);
			
			rs=stmt.executeQuery();
			return rs.next();
		}finally {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
	}
}
