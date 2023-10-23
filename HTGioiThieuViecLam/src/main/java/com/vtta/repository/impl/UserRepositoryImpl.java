/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.repository.impl;

import com.vtta.pojo.Company;
import com.vtta.pojo.User;
import com.vtta.repository.CompanyRepository;
import com.vtta.repository.UserRepository;
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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author TramAnh
 */
@Repository
@Transactional
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private CompanyRepository companyRepo;

    @Autowired
    private BCryptPasswordEncoder passEncoder;

    @Override
    public User getUserByUsername(String username) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("From User Where username=:un");
        q.setParameter("un", username);

        return (User) q.getSingleResult();
    }

    @Override
    public Boolean addUser(User u) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            Company com = new Company();
            String role = "ROLE_EMPLOYER";
            if (u.getId() == null) {
                if (u.getUserRole().equals(role)) {
                    com.setName(u.getCompanyName());
                    com.setAddress(u.getAddressCompany());
                    s.save(com);

                    u.setCompanyId(com);
                    u.setActive(Boolean.FALSE);
                }
                s.save(u);
            } else {
                s.update(u);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<User> getUser(String username) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query.select(root);

        if (username != null) {
            Predicate p = builder.like(root.get("username").as(String.class), String.format("%%%s%%", username));
            query = query.where(p);
        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public List<User> getUsers() {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<User> q = b.createQuery(User.class);
        Root root = q.from(User.class);
        q.select(root);

        q.orderBy(b.desc(root.get("id")));

        Query query = s.createQuery(q);
        return query.getResultList();

    }

    // ko sai dc
    @Override
    public User getIdUser(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        return session.get(User.class, id);
    }

    @Override
    public List<User> getActiveF() {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<User> q = b.createQuery(User.class);
        Root root = q.from(User.class);
        q.select(root);
        Predicate predicates = b.equal(root.get("active"), false);

        q.where(predicates);

        Query query = s.createQuery(q);
        return query.getResultList();
    }

    @Override
    public Boolean updateActive(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        User u = this.getIdUser(id);
        try {
            if (u.getActive() == false) {
                u.setActive(Boolean.TRUE);
                s.update(u);
                return true;
            } else {
                u.setActive(Boolean.FALSE);
                s.update(u);
                return true;
            }
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<User> getActiveT() {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<User> q = b.createQuery(User.class);
        Root root = q.from(User.class);
        q.select(root);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(b.equal(root.get("active"), true));
        predicates.add(b.isNotNull(root.get("companyId")));

        q.where(predicates.toArray(Predicate[]::new));
        q.orderBy(b.desc(root.get("id")));

        Query query = s.createQuery(q);
        return query.getResultList();
    }

    @Override
    public Boolean deleteUser(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            User u = this.getIdCompany(id);
            Company c = this.companyRepo.getCompanyById(u.getCompanyId().getId());
            String role = "ROLE_EMPLOYER";
            if (u.getUserRole() == role) {
                s.delete(u);
                s.delete(c);
            }
            else
            {
                s.delete(u);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    // lay id user
    @Override
    public User getIdCompany(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("From User Where id=:un");
        q.setParameter("un", id);

        return (User) q.getSingleResult();
    }

    // chung thuc nguoi dung ben react
    @Override
    public boolean authUser(String username, String password) {
        User u = this.getUserByUsername(username);

        return this.passEncoder.matches(password, u.getPassword());
    }

    // dang ki nguoi dung ben react
    @Override
    public User addUsers(User user) {
        Session s = this.factory.getObject().getCurrentSession();
        s.save(user);
        return user;
    }
}
