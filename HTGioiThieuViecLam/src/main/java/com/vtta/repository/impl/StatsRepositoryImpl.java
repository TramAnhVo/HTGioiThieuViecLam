/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.repository.impl;

import com.vtta.pojo.Cv;
import com.vtta.pojo.Job;
import com.vtta.pojo.Major;
import com.vtta.repository.StatsRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author TramAnh
 */
@Repository
@Transactional
public class StatsRepositoryImpl implements StatsRepository{
    
    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<Object[]> statsMajor() {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootP = q.from(Job.class);
        Root rootC = q.from(Major.class);
        q.where(b.equal(rootP.get("majorId"), rootC.get("id")));

        q.multiselect(rootC.get("id"), rootC.get("name"), b.count(rootP.get("id")));
        q.groupBy(rootC.get("id"));

        Query query = session.createQuery(q);
        return query.getResultList();
    }
    
    // thong ke cv theo nganh nghe (nam)
    @Override
    public List<Object[]> statsRevenue(int year) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootP = q.from(Cv.class);
        Root rootO = q.from(Job.class);
        Root rootC = q.from(Major.class);
        
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(b.equal(rootO.get("id"), rootP.get("jobId")));
        predicates.add(b.equal(rootO.get("majorId"), rootC.get("id")));
        predicates.add(b.equal(b.function("YEAR", Integer.class, rootP.get("dayApply")), year));

        q.multiselect(rootC.get("id"), rootC.get("name"), b.count(rootP.get("id")));

        q.where(predicates.toArray(Predicate[]::new));
        q.groupBy(rootC.get("id"));

        Query query = session.createQuery(q);
        return query.getResultList();
    }
    
    @Override
    public List<Object[]> quarterStats(int quarter, int year) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootP = q.from(Cv.class);
        Root rootO = q.from(Job.class);
        Root rootC = q.from(Major.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(b.equal(rootO.get("id"), rootP.get("jobId")));
        predicates.add(b.equal(rootO.get("majorId"), rootC.get("id")));
        predicates.add(b.equal(b.function("QUARTER", Integer.class, rootP.get("dayApply")), quarter));
        predicates.add(b.equal(b.function("YEAR", Integer.class, rootP.get("dayApply")), year));
        

        q.multiselect(rootC.get("id"), rootC.get("name"), b.count(rootP.get("id")));

        q.where(predicates.toArray(Predicate[]::new));
        q.groupBy(rootC.get("id"));

        Query query = session.createQuery(q);
        return query.getResultList();
    }
}
