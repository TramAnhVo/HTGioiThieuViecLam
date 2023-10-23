/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.repository.impl;

import com.vtta.pojo.Location;
import com.vtta.repository.LocationRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Trâm Anh
 */
@Transactional
@Repository
public class LocationRepositoryImpl implements LocationRepository {

    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Autowired
    private Environment env;

    @Override
    public List<Location> getLocation() {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Location> q = b.createQuery(Location.class);
        Root root = q.from(Location.class);
        q.select(root);

        q.orderBy(b.desc(root.get("id")));
        
        Query query = s.createQuery(q);
        return query.getResultList();
    }

    @Override
    public boolean addOrUpdateLocation(Location p) {
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
    public Location getLocationById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Location.class, id);
    }

    @Override
    public boolean deleteLocation(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            Location p = this.getLocationById(id);
            s.delete(p);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

}
