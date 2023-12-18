package dao;

import java.sql.*;
import java.util.*;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.Connection;
import javax.naming.NamingException;

public class BasketDao {
    private static final String SELECT_BASKET_ITEMS_QUERY = "SELECT pid, image, name, quantity, price FROM shoppingmall WHERE validity = 1 AND uid = ?";

    public ArrayList<BasketItem> getBasketItems(String uid) {
        ArrayList<BasketItem> basketItemList = new ArrayList<>();

        try (Connection conn = util.ConnectionPool.get();
             PreparedStatement stmt = conn.prepareStatement(SELECT_BASKET_ITEMS_QUERY)) {

            stmt.setString(1, uid);  
            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    int pid = rs.getInt("pid");
                    String image = rs.getString("image");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");

                    // BasketItem 객체를 생성하여 ArrayList에 추가
                    BasketItem basketItem = new BasketItem(pid, image, name, quantity, price);
                    basketItemList.add(basketItem);
                }
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace(); // 오류 처리
        }

        return basketItemList;
    }

    // BasketItem 클래스 정의
    public class BasketItem {
    	private int pid;
    	private String image;
        private String name;
        private int quantity;
        private double price;

        public BasketItem(int pid, String image, String name, int quantity, double price) {
            this.pid=pid;
        	this.image=image;
        	this.name = name;
            this.quantity = quantity;
            this.price = price;
        }
        
        public int getPid()
        {
        	return pid;
        }
        public void setPid(int pid)
        {
        	this.pid=pid;
        }
        public String getImage()
        {
        	return image;
        }
        public void setImage(String image)
        {
        	this.image=image;
        }
    	public String getName()
    	{
    		return name;
    	}
    	public void setName(String name)
    	{
    		this.name=name;
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
        public double calculateTotalPrice(String uid)
        {
        	ServicebasketDao servicebasketDao=new ServicebasketDao();
        	return servicebasketDao.calculateTotalPrice(uid);
        }
    }
    

}
