package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import entity.CartItems;

public class CartItemsDao {

    private SessionFactory factory;

    public CartItemsDao(SessionFactory factory) {
        this.factory = factory;
    }

    public void saveCartItem(CartItems cartItem) {
        try {
            Session session = this.factory.openSession();
            session.beginTransaction();
            session.save(cartItem);
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Diğer metodlar (ürünleri kullanıcıya göre getirme, güncelleme, silme vb.) buraya eklenebilir
}
