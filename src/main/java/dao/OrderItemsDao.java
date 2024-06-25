package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entity.OrderItems;

public class OrderItemsDao {

    private SessionFactory factory;

    public OrderItemsDao(SessionFactory factory) {
        this.factory = factory;
    }

    public void saveOrderItem(OrderItems orderItem) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(orderItem);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public List<OrderItems> getOrderItemsByOrderId(int orderId) {
        Session session = factory.openSession();
        List<OrderItems> orderItemsList = null;
        try {
            System.out.println("Getting order_items for order_id: " + orderId); // Debugging
    
            Query query = session.createQuery("FROM OrderItems WHERE order.id = :orderId");
            query.setParameter("orderId", orderId);
            orderItemsList = query.list();
    
            if (orderItemsList.isEmpty()) {
                System.out.println("No order items found for orderId: " + orderId); // Debugging
            } else {
                System.out.println("OrderItems found: " + orderItemsList.size()); // Debugging
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return orderItemsList;
    }
    

    

    // Diğer metodlar (ürünleri siparişe göre getirme, güncelleme, silme vb.) buraya eklenebilir
}
