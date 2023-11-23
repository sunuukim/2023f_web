//장바구니 기능(추가, 삭제, 선택삭제) 중 선택삭제 부분만 남음
//pid도 장바구니 DB에 넣어줘야하는지 고민하기
package dao;

import java.sql.*;
import java.sql.SQLException;
import javax.naming.NamingException;

import util.ConnectionPool;

public class ServicebasketDao {
	private static final String SELECT_PRODUCT_INFO_QUERY="SELECT pname, quantity, price FROM shoppingmall WHERE pid=?";
	private static final String INSERT_BASKET_ITEM_QUERY="INSERT INTO addbaskettable (pname, quantity, price) VALUES (?,?,?)";
	private static final String DELETE_ALL_ITEMS_QUERY="DELETE FROM addbaskettable";
	
	//상품저장
	public boolean addToShoppingBasket(int pid)
	{
		try(Connection conn=ConnectionPool.get();
				PreparedStatement selectstmt=conn.prepareStatement(SELECT_PRODUCT_INFO_QUERY);
				PreparedStatement insertstmt=conn.prepareStatement(INSERT_BASKET_ITEM_QUERY))
		{
			selectstmt.setInt(1, pid);
			ResultSet rs=selectstmt.executeQuery();
			
			if(rs.next())
			{
				String pname=rs.getString("pname");
				int quantity=rs.getInt("quantity");
				double price=rs.getDouble("price");
				
				insertstmt.setString(1, pname);
				insertstmt.setInt(2, quantity);
				insertstmt.setDouble(3, price);
				
				int rowsAffected=insertstmt.executeUpdate();
				
				return rowsAffected>0;
			}
		}
		catch(SQLException|NamingException e)
		{
			e.printStackTrace();
		}
		
		return false;
	}
	
	//전체상품 삭제
	public boolean deleteALLitems()
	{
		try(Connection conn=ConnectionPool.get();
			PreparedStatement stmt=conn.prepareStatement(DELETE_ALL_ITEMS_QUERY))
		{
			int rowsAffected=stmt.executeUpdate();
			
			return rowsAffected>0;
		}
		catch(SQLException|NamingException e)
		{
			e.printStackTrace();
		}
		
		return false;
	}
}
