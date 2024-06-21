package dao;

import entity.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

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
    
    @SuppressWarnings("deprecation")
    public void deleteProductsById(int cid) {
        Session s = this.factory.openSession();
        Product p=new Product();
        p.setpId(cid);
        s.delete(p);
        
    }
    

}
