package dao;

import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import util.ConnectionPool;

public class MyInfoDao {
	public String select() 
			throws NamingException, SQLException{
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			String sql="select * from user where id=?";
			conn=ConnectionPool.get();
			stmt=conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			String str="";
			while(rs.next()) {
				str+=rs.getString("id");
			}
			return str;
		}finally {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
	}
}
