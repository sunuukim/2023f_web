package dao;

import java.sql.*;
import java.util.*;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.Connection;
import javax.naming.NamingException;

public class BasketDao {
    private static final String SELECT_BASKET_ITEMS_QUERY = "SELECT pid, image, pname, quantity, price FROM cart WHERE uid=? AND delivery=0";

    public ArrayList<BasketItem> getBasketItems(String uid) {
        ArrayList<BasketItem> basketItemList = new ArrayList<>();

        try (Connection conn = util.ConnectionPool.get();
             PreparedStatement stmt = conn.prepareStatement(SELECT_BASKET_ITEMS_QUERY)) {

            stmt.setString(1, uid);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int pid = rs.getInt("pid");
                    String image = rs.getString("image");
                    String pname = rs.getString("pname");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("price");

                    BasketItem basketItem = new BasketItem(pid, image, pname, quantity, price);
                    basketItemList.add(basketItem);
                }
            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace(); // 오류 처리
        }

        return basketItemList;
    }

    public int calculateTotalPrice(String uid) {
        ServicebasketDao servicebasketDao = new ServicebasketDao();
        return servicebasketDao.calculateTotalPrice(uid);
    }

    // BasketItem 클래스 정의
    public class BasketItem {
        private int pid;
        private String image;
        private String pname;
        private int quantity;
        private int price;

        public BasketItem(int pid, String image, String pname, int quantity, int price) {
            this.pid = pid;
            this.image = image;
            this.pname = pname;
            this.quantity = quantity;
            this.price = price;
        }

        public int getPid() {
            return pid;
        }

        public void setPid(int pid) {
            this.pid = pid;
        }

        public String getImage() {
            return image;
        }

        public void setImage(String image) {
            this.image = image;
        }

        public String getName() {
            return pname;
        }

        public void setName(String pname) {
            this.pname = pname;
        }

        public int getQuantity() {
            return quantity;
        }

        public void setQuantity(int quantity) {
            this.quantity = quantity;
        }

        public int getPrice() {
            return price;
        }

        public void setPrice(int price) {
            this.price = price;
        }
    }
}
