package com.mycompany.mycart.dao;

import com.mycompany.mycart.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class CategoryDao {
    private SessionFactory factory;
    
    public CategoryDao(SessionFactory factory) {
        this.factory=factory;
    }
    
    public int saveCategory(Category cat) {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int catId = (int)session.save(cat);
        session.close();
        return catId;
    }
    
    public List<Category> getCategories() {
        return this.factory.openSession().createQuery("from Category").list();
    }
    
    public Category getCategorybyId(int cId) {
        Category category=null;
        Session session = this.factory.openSession();
        category = session.get(Category.class, cId);
        session.close();
        return category;
    }
}
