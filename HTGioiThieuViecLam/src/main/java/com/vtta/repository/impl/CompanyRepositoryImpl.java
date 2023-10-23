/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.repository.impl;

import com.vtta.pojo.Company;
import com.vtta.repository.CompanyRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
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
public class CompanyRepositoryImpl implements CompanyRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Company> getCompany() {
        Session s = factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Company> q = b.createQuery(Company.class);
        Root root = q.from(Company.class);
        q.select(root);

        q.orderBy(b.desc(root.get("id")));
        Query query = s.createQuery(q);

        return query.getResultList();
    }

    @Override
    public boolean addCompany(Company p) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            if (p.getId() == null) {
                s.save(p);
            } else {
                s.update(p);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public int countCompany() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT COUNT(*) From Company");

        return Integer.parseInt(q.getSingleResult().toString());
    }

    @Override
    public Company getCompanyById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Company.class, id);
    }

    @Override
    public boolean deleteCompany(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            Company p = this.getCompanyById(id);
            s.delete(p);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean UpdateCompany(Company p) {
        Session s = this.factory.getObject().getCurrentSession();
        if (p.getId() != null) {
            s.update(p);
        }
        return true;
    }

}
