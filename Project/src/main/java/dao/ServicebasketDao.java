package dao;

import java.sql.*;
import java.sql.SQLException;
import javax.naming.NamingException;
import util.ConnectionPool;

public class ServicebasketDao {
	private static final String INSERT_BASKET_ITEM_QUERY="INSERT INTO basket (uid, pid, image, name, quantity, price) VALUES (?,?,?,?,?,?)";
	private static final String DELETE_ALL_ITEMS_FROM_BASKET_QUERY="DELETE FROM basket WHERE uid=?";
	private static final String SELECT_DELETE_ITEMS_FROM_BASKET_QUERY="DELETE FROM basket WHERE uid=? AND pid=?";
	private static final String CALCULATE_ITEMS_PRICE_QUERY="SELECT quantity, price FROM basket WHERE uid=?";
	private static final String UPDATE_ITEM_QUANTITY_QUERY="UPDATE basket SET quantity=? WHERE uid=? AND pid=?";
	
	//상품저장
	public boolean addToBasket(int uid, int pid, String image, String name, int quantity, double price)
	{
		try(Connection conn=ConnectionPool.get();
			PreparedStatement stmt=conn.prepareStatement(INSERT_BASKET_ITEM_QUERY))
		{
			stmt.setInt(1, uid);
			stmt.setInt(2, pid);
			stmt.setString(3, image);
			stmt.setString(4,  name);
			stmt.setInt(5, quantity);
			stmt.setDouble(6, price);
			
			int rowsAffected=stmt.executeUpdate();
			return rowsAffected>0;
		}
		catch(SQLException|NamingException e)
		{
			e.printStackTrace();
		}
		
		return false;
	}
	
	//선택상품 삭제
	public boolean deleteItem(int uid, int pid)
	{
		try(Connection conn=ConnectionPool.get();
			PreparedStatement stmt=conn.prepareStatement(SELECT_DELETE_ITEMS_FROM_BASKET_QUERY))
		{
			stmt.setInt(1, uid);
			stmt.setInt(2, pid);
			
			int rowsAffected=stmt.executeUpdate();
			return rowsAffected>0;
		}
		catch(SQLException|NamingException e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	//전체상품 삭제
	public boolean deleteALLitems(int uid)
	{
		try(Connection conn=ConnectionPool.get();
			PreparedStatement stmt=conn.prepareStatement(DELETE_ALL_ITEMS_FROM_BASKET_QUERY))
		{
			stmt.setInt(1, uid);
			
			int rowsAffected=stmt.executeUpdate();
			return rowsAffected>0;
		}
		catch(SQLException|NamingException e)
		{
			e.printStackTrace();
		}
		
		return false;
	}
	
	//상품 총 금액 계산
	public double calculateTotalPrice(int uid)
	{
		double totalPrice=0.0;
		
		try(Connection conn=ConnectionPool.get();
			PreparedStatement stmt=conn.prepareStatement("CALCULATE_ITEMS_PRICE_QUERY"))
		{
			stmt.setInt(1, uid);
			
			try(ResultSet rs=stmt.executeQuery())
			{
				while(rs.next())
				{
					int quantity=rs.getInt("quantity");
					double price=rs.getDouble("price");
					
					totalPrice+=quantity*price;
				}
			}
		}
		catch(SQLException|NamingException e)
		{
			e.printStackTrace();
		}
		return totalPrice;
	}
	
	//상품 수량을 업데이트
	public boolean updateQuantity(int uid, int pid, int quentity)
	{
		try(Connection conn=util.ConnectionPool.get();
			PreparedStatement stmt=conn.prepareStatement("UPDATE_ITEM_QUANTITY_QUERY"))
		{
			stmt.setInt(1, quentity);
			stmt.setInt(2, uid);
			stmt.setInt(3, pid);
			
			int rowAffected=stmt.executeUpdate();
			return rowAffected>0;
		}
		catch(SQLException|NamingException e)
		{
			e.printStackTrace();
		}
		return false;
	}
}
