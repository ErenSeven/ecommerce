
package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entity.User;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //get user by email and password
    @SuppressWarnings({ "deprecation", "rawtypes" })
    public User getUserByEmailAndPassword(String email,String password)
    {
        User user=null;
        
        try {
            
            String query="from User where userEmail =: e and userPassword=: p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p",password);            
            user=(User) q.uniqueResult();         
            session.close();         

            
        } catch (Exception e) {
            e.printStackTrace();
        }     

        return user;
    }
        // Get all users
        @SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
        public List<User> getAllUsers() {
            List<User> list = null;
            try {
                Session session = this.factory.openSession();
                Query query = session.createQuery("from User");
                list = query.list();
                session.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return list;
        }     
    // Add user
    public int addUser(User user) {
        int userId = 0;
        try (Session session = this.factory.openSession()) {
            Transaction tx = session.beginTransaction();
            userId = (int) session.save(user);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userId;
    }

    // Delete user
    public void deleteUser(int userId) {
        try (Session session = this.factory.openSession()) {
            Transaction tx = session.beginTransaction();
            User user = session.get(User.class, userId);
            if (user != null) {
                session.delete(user);
                tx.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Update user
    public void updateUser(User user) {
        try (Session session = this.factory.openSession()) {
            Transaction tx = session.beginTransaction();
            session.update(user);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Get user by ID
    public User getUserById(int userId) {
        User user = null;
        try (Session session = this.factory.openSession()) {
            user = session.get(User.class, userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
            // Search users by name
    @SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
    public List<User> searchUsersByName(String name) {
        List<User> list = null;
        try {
            Session session = this.factory.openSession();
            String query = "from User where userName like :name";
            Query q = session.createQuery(query);
            q.setParameter("name", "%" + name + "%");
            list = q.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
