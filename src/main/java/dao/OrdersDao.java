package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entity.Orders;

public class OrdersDao {

    private SessionFactory factory;

    public OrdersDao(SessionFactory factory) {
        this.factory = factory;
    }

    //saves the category to db
    @SuppressWarnings("deprecation")
    public int saveOrders(Orders order) {

        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int order_id = (int) session.save(order);
        tx.commit();
        session.close();
        return order_id;
    }

    @SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
    public List<Orders> getAllOrders() {
        Session s = null;
        Transaction tx = null;
        List<Orders> list = null;
        try {
            s = this.factory.openSession();
            tx = s.beginTransaction();
            Query<Orders> query = s.createQuery("from Orders", Orders.class);
            list = query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            if (s != null) {
                s.close();
            }
        }
        return list;
    }
    
    public Orders getOrdersById(int order_id) {
        Orders order = null;
        try {

            Session session = this.factory.openSession();
            order = session.get(Orders.class, order_id);
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return order;
    }
    // Diğer metodlar (güncelleme, silme vb.) buraya eklenebilir
}
