//아직 오류 검증 안함
package dao;

import java.sql.*;
import java.util.*;
import java.util.ArrayList;
import java.sql.SQLException;
import javax.naming.NamingException;

public class BasketDao {
	private static final String SELECT_BASKET_ITEMS_QUERY="SELECT pname, quantity, price FROM addbaskettable WHERE validity=1";
	
	public ArrayList<BasketItem> getBasketItems() {
        ArrayList<BasketItem> basketItemList = new ArrayList<>();

        try (Connection conn = util.ConnectionPool.get();
             PreparedStatement stmt = conn.prepareStatement(SELECT_BASKET_ITEMS_QUERY);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                String productName = rs.getString("pname");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");

                // BasketItem 객체를 생성하여 ArrayList에 추가
                BasketItem basketItem = new BasketItem(pname, quantity, price); //pname -> productName으로 바꿔야할지 확인
                basketItemList.add(basketItem);
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace(); // 오류 처리
        }

        return basketItemList;
    }

    // BasketItem 클래스 정의
    public class BasketItem {
        private String pname;
        private int quantity;
        private double price;

        public BasketItem(String pname, int quantity, double price) {
            this.pname = pname;
            this.quantity = quantity;
            this.price = price;
        }
    	public String getpName()
    	{
    		return pname;
    	}
    	public void setName(String pname)
    	{
    		this.pname=pname;
    	}
    	public int getQuantity()
    	{
    		return quantity;
    	}
    	public void setQuantity(int quantity)
    	{
    		this.quantity=quantity;
    	}
    	public double getPrice()
    	{
    		return price;
    	}
    	public void setPrice(double price)
    	{
    		this.price=price;
    	}
    }
}
