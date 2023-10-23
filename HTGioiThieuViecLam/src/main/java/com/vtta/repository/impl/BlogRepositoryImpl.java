/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.repository.impl;

import com.vtta.pojo.Blog;
import com.vtta.repository.BlogRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author TramAnh
 */
@Transactional
@Repository
public class BlogRepositoryImpl implements BlogRepository{
    
    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Autowired
    private Environment env;

    @Override
    public List<Blog> getBlog() {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Blog> q = b.createQuery(Blog.class);
        Root root = q.from(Blog.class);
        q.select(root);

        q.orderBy(b.desc(root.get("id")));
        
        Query query = s.createQuery(q);
        return query.getResultList();
    }

    @Override
    public boolean addOrUpdateBlog(Blog p) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            if (p.getId() == null) {
                s.save(p);
            }
            else 
            {
                s.update(p);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public Blog getBlogById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Blog.class, id);        
    }

    @Override
    public boolean deleteBlog(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            Blog p = this.getBlogById(id);
            s.delete(p);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
}
