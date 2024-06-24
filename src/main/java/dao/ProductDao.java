package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entity.Product;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    //urun save - add
    @SuppressWarnings("deprecation")
    public boolean saveProduct(Product product) {
        boolean f = false;
        try {

            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            session.save(product);

            tx.commit();
            session.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }

        return f;
    }

    //get all products
    @SuppressWarnings({ "deprecation", "rawtypes" })
    public List<Product> getAllProducts() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product");
        @SuppressWarnings("unchecked")
        List<Product> list = query.list();
        return list;
    }

    //get all  products of given category
    @SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
    public List<Product> getAllProductsById(int cid) {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product as p where p.category.categoryId =: id");
        query.setParameter("id", cid);
        List<Product> list = query.list();
        return list;
    }

    public Product getProductById(int productId) {
        Product product = null;
        try (Session session = this.factory.openSession()) {
            product = session.get(Product.class, productId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

        // Ürün adını arayarak ürünleri getir
        @SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
        public List<Product> searchProductsByName(String pname) {
            Session s = this.factory.openSession();
            Query query = s.createQuery("from Product as p where p.pName like :name");
            query.setParameter("name", "%" + pname + "%");
            List<Product> list = query.list();
            s.close();
            return list;
        }

    // Ürünü güncelle
    public void updateProduct(Product product) {
        Transaction transaction = null;
        try (Session session = this.factory.openSession()) {
            transaction = session.beginTransaction();
            session.update(product);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void deleteProductById(int productId) {
        Transaction transaction = null;
        try (Session session = this.factory.openSession()) {
            transaction = session.beginTransaction();
            Product product = session.get(Product.class, productId);
            if (product != null) {
                session.delete(product);
                System.out.println("Product is deleted");
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    
}
