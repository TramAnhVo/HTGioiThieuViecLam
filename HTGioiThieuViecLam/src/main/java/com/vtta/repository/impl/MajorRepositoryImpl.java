/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.repository.impl;

import com.vtta.pojo.Major;
import com.vtta.repository.MajorRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Trâm Anh
 */
@Transactional
@Repository
public class MajorRepositoryImpl implements MajorRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Major> getMajor() {
        Session s = factory.getObject().getCurrentSession();
        Query q = s.createQuery("From Major");
        return q.getResultList();
    }

    @Override
    public boolean addOrUpdateMajor(Major p) {
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
    public Major getMajorById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Major.class, id);
    }

    @Override
    public boolean deleteMajor(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            Major p = this.getMajorById(id);
            s.delete(p);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    

}
