/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.repository.impl;

import com.vtta.pojo.Position;
import com.vtta.repository.PositionRepository;
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
 * @author TramAnh
 */
@Transactional
@Repository
public class PositionRepositoryImpl implements PositionRepository{
    
    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<Position> getPosition() {
        Session s = factory.getObject().getCurrentSession();
        Query q = s.createQuery("From Position");
        return q.getResultList();
    }

    @Override
    public boolean addOrUpdatePosition(Position p) {
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
    public Position getPositionById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Position.class, id);
    }

    @Override
    public boolean deletePosition(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            Position p = this.getPositionById(id);
            s.delete(p);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
}
