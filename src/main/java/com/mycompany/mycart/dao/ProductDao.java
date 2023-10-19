package com.mycompany.mycart.dao;

import com.mycompany.mycart.entities.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class ProductDao {
    private SessionFactory factory;
    
    public ProductDao(SessionFactory factory) {
        this.factory=factory;
    }
    
    public int saveProduct(Product product) {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int pId = (int)session.save(product);
        session.close();
        return pId;
    }
}
