/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.service.impl;

import com.vtta.pojo.Blog;
import com.vtta.repository.BlogRepository;
import com.vtta.service.BlogService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TramAnh
 */
@Service
public class BlogServiceImpl implements BlogService{
    @Autowired
    private BlogRepository blogRepository;
    
    @Autowired
    private SimpleDateFormat simpleDateFormat;

    @Override
    public List<Blog> getBlog() {
        return this.blogRepository.getBlog();
    }

    @Override
    public boolean addOrUpdateBlog(Blog p) {
        Date currentDate = new Date();
        try {
            p.setCreatedDay(this.simpleDateFormat
                    .parse(this.simpleDateFormat.format(currentDate)));
            p.setActive(Boolean.TRUE);
        } catch (ParseException ex) {
            Logger.getLogger(JobServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return this.blogRepository.addOrUpdateBlog(p);
    }

    @Override
    public Blog getBlogById(int id) {
        return this.blogRepository.getBlogById(id);
    }

    @Override
    public boolean deleteBlog(int id) {
        return this.blogRepository.deleteBlog(id);
    }
    
}
