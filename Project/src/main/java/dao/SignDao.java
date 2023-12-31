package dao;

import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import util.ConnectionPool;

public class SignDao {
	public boolean insert(String uid, String upass, String uname, String udad, String utel) 
			throws NamingException, SQLException{
		Connection conn=null;
		PreparedStatement stmt=null;
		try {
			String sql="insert into user values(?,?,?,?,?)";
			conn=ConnectionPool.get();
			stmt=conn.prepareStatement(sql);
			
			stmt.setString(1, uid);
			stmt.setString(2, upass);
			stmt.setString(3, uname);
			stmt.setString(4, udad);
			stmt.setString(5, utel);
			
			int count=stmt.executeUpdate();
			return (count>0)? true:false;
		}finally {
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
	}
	public boolean exists(String uid) 
			throws NamingException, SQLException{
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			String sql="select id from user where id=?";
			conn=ConnectionPool.get();
			stmt=conn.prepareStatement(sql);
			
			stmt.setString(1, uid);
			rs=stmt.executeQuery();
			return rs.next();
		}finally {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
	}
	public boolean delete(String uid) 
			throws NamingException, SQLException{
		Connection conn=null;
		PreparedStatement stmt=null;
		try {
			String sql="delete from user where id = ?";
			conn=ConnectionPool.get();
			stmt=conn.prepareStatement(sql);
			
			stmt.setString(1, uid);
			
			int count=stmt.executeUpdate();
			return (count>0)? true:false;
		}finally {
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
	}
}
