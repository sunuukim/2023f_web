//장바구니 기능(추가, 삭제, 선택삭제) 중 선택삭제 부분만 남음
//pid도 장바구니 DB에 넣어줘야하는지 고민하기
package dao;

import java.sql.*;

import javax.naming.NamingException;
import util.ConnectionPool;

public class ServicebasketDao {
	private static final String DELETE_ALL_ITEMS_FROM_CART_QUERY="DELETE FROM cart WHERE uid=?";
	private static final String SELECT_DELETE_ITEMS_FROM_CART_QUERY="DELETE FROM cart WHERE uid=? AND pid=?";
	private static final String CALCULATE_ITEMS_PRICE_QUERY = "SELECT quantity, price FROM cart WHERE uid=?";
	private static final String UPDATE_ITEM_QUANTITY_QUERY = "UPDATE cart SET quantity=? WHERE uid=? AND pid=?";
	private static final String UPDATE_DELIVERY_QUERY = "UPDATE cart SET delivery=?, sdate=curdate(), ddate=(DATE_ADD(curdate(), INTERVAL 2 DAY)) WHERE uid=?";
	
	//선택상품 삭제
	public boolean deleteItem(String uid, int pid)
	{
		try(Connection conn=ConnectionPool.get();
			PreparedStatement stmt=conn.prepareStatement(SELECT_DELETE_ITEMS_FROM_CART_QUERY))
		{
			stmt.setString(1, uid);
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
	public boolean deleteALLitems(String uid)
	{
		try(Connection conn=ConnectionPool.get();
			PreparedStatement stmt=conn.prepareStatement(DELETE_ALL_ITEMS_FROM_CART_QUERY))
		{
			stmt.setString(1, uid);
			
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
	public int calculateTotalPrice(String uid)
	{
		int totalPrice=0;
		
		try (Connection conn = ConnectionPool.get();
		        PreparedStatement stmt = conn.prepareStatement(CALCULATE_ITEMS_PRICE_QUERY)) {
		    stmt.setString(1, uid);

		    try (ResultSet rs = stmt.executeQuery()) {
		        while (rs.next()) {
		            int quantity = rs.getInt("quantity");
		            int price = rs.getInt("price");

		            totalPrice += quantity * price;
		        }
		    }
		} catch (SQLException | NamingException e) {
		    e.printStackTrace();
		}

		return totalPrice;
	}
	
	//상품 수량을 업데이트
	public boolean updateQuantity(String uid, int pid, int quantity)
	{
		try (Connection conn = util.ConnectionPool.get();
		        PreparedStatement stmt = conn.prepareStatement(UPDATE_ITEM_QUANTITY_QUERY)) {
		    stmt.setInt(1, quantity);
		    stmt.setString(2, uid);
		    stmt.setInt(3, pid);

		    int rowAffected = stmt.executeUpdate();
		    return rowAffected > 0;
		} catch (SQLException | NamingException e) {
		    e.printStackTrace();
		}

		return false;
	}
	
	//배송상태 변경하는 함수 추가했습니다
	public boolean updateDelivery(String uid, int delivery) throws NamingException, SQLException
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		try
		{
			conn = util.ConnectionPool.get();
	        stmt = conn.prepareStatement(UPDATE_DELIVERY_QUERY);
		    stmt.setInt(1, delivery);
		    stmt.setString(2, uid);
		    //stmt.setInt(3, pid);

		    int rowAffected = stmt.executeUpdate();
		    return rowAffected > 0;
		}finally {
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
	}
}