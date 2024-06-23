package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entity.Category;

public class CategoryDao {

    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    //saves the category to db
    @SuppressWarnings("deprecation")
    public int saveCategory(Category cat) {

        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int catId = (int) session.save(cat);
        tx.commit();
        session.close();
        return catId;
    }

    public void deleteCategory(int categoryId) {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        Category category = session.get(Category.class, categoryId);
        if (category != null) {
            session.delete(category);
        }
        tx.commit();
        session.close();
    }
    @SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
    public List<Category> getCategories() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category");
        List<Category> list = query.list();
        return list;
    }

    public void updateCategory(Category category) {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        session.update(category);
        tx.commit();
        session.close();
    }
    
    public Category getCategoryById(int cid) {
        Category cat = null;
        try {

            Session session = this.factory.openSession();
            cat = session.get(Category.class, cid);
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cat;
    }
}
