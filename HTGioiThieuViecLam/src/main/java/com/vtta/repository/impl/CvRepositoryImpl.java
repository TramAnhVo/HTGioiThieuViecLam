/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.repository.impl;

import com.vtta.pojo.Comment;
import com.vtta.pojo.Company;
import com.vtta.pojo.Cv;
import com.vtta.pojo.Job;
import com.vtta.repository.CompanyRepository;
import com.vtta.repository.CvRepository;
import com.vtta.repository.JobRepository;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
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
@Repository
@Transactional
public class CvRepositoryImpl implements CvRepository{
    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Autowired
    private JobRepository jobRepo;
    
    @Autowired
    private CompanyRepository compaRepo;
    
    @Override
    public List<Cv> getCv(int id) {
        Session s = this.factory.getObject().getCurrentSession();
         CriteriaBuilder b = s.getCriteriaBuilder();
         CriteriaQuery<Cv> q = b.createQuery(Cv.class);

         Root rootP = q.from(Cv.class);
         Root rootO = q.from(Job.class);
         Root rootC = q.from(Company.class);

         List<Predicate> predicates = new ArrayList<>();
         predicates.add(b.equal(rootO.get("id"), rootP.get("jobId")));
         predicates.add(b.equal(rootO.get("companyId"), rootC.get("id")));
         predicates.add(b.equal(rootC.get("id"), id));

         q.multiselect(rootP.get("id"), rootP.get("cv"),rootC.get("name") );

         q.where(predicates.toArray(Predicate[]::new));
         q.groupBy(rootP.get("id"), rootP.get("jobId"),rootC.get("name"));

         Query query = s.createQuery(q);
         return query.getResultList();
     }

    @Override
    public boolean addCv(Cv c) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            c.setActive(Boolean.FALSE);
            s.save(c);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Cv> getCvIdCompany(int id) {
        Company c = this.compaRepo.getCompanyById(id);
        List<Job> jobs = this.jobRepo.getJobsByComId(c);
        List<Cv> cv = new ArrayList<>();
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Cv> q = b.createQuery(Cv.class);
        Root root = q.from(Cv.class);
        q.select(root);
        
        for (Job j : jobs) {
            Predicate predicates = b.equal(root.get("jobId"), j.getId());
            q.where(predicates);
            q.orderBy(b.asc(root.get("active")));
            org.hibernate.query.Query query = s.createQuery(q);
            cv.addAll(query.getResultList());
        }
        
        return cv; 
    }
    
    @Override
    public Cv getCvById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
         return s.get(Cv.class, id);
    }

    @Override
    public boolean UpdateActive(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Cv c = this.getCvById(id);
        Job j = this.jobRepo.getJobById(c.getJobId().getId());
        
        try {
            c.setActive(Boolean.TRUE);
            s.update(c);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
}
