package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import entity.OrderItems;

public class OrderItemsDao {

    private SessionFactory factory;

    public OrderItemsDao(SessionFactory factory) {
        this.factory = factory;
    }

    public void saveOrderItem(OrderItems orderItem) {
        try {
            Session session = this.factory.openSession();
            session.beginTransaction();
            session.save(orderItem);
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Diğer metodlar (ürünleri siparişe göre getirme, güncelleme, silme vb.) buraya eklenebilir
}
