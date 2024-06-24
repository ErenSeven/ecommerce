package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entity.Orders;

public class OrdersDao {

    private final SessionFactory factory;

    public OrdersDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveOrders(Orders orders) {
        boolean saved = false;
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(orders);
            tx.commit();
            saved = true;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return saved;
    }

    @SuppressWarnings({ "deprecation", "rawtypes" })
    public List<Orders> getAllOrders() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Orders");
        @SuppressWarnings("unchecked")
        List<Orders> list = query.list();
        return list;
    }

    public Orders getOrdersById(int orderId) {
        Session session = factory.openSession();
        Orders orders = session.get(Orders.class, orderId);
        session.close();
        return orders;
    }

    public boolean deleteOrdersById(int orderId) {
        boolean deleted = false;
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Orders orders = session.get(Orders.class, orderId);
            if (orders != null) {
                session.delete(orders);
                tx.commit();
                deleted = true;
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return deleted;
    }

        // Siparis durumu arayarak siparisleri getir
        @SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
        public List<Orders> searchOrdersByStatus(String orderStatus) {
            Session s = this.factory.openSession();
            Query query = s.createQuery("from Orders as o where o.orderStatus like :orderStatus");
            query.setParameter("orderStatus", "%" + orderStatus + "%");
            List<Orders> list = query.list();
            s.close();
            return list;
        }

    public boolean updateOrders(Orders orders) {
        boolean updated = false;
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(orders);
            tx.commit();
            updated = true;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return updated;
    }
}
