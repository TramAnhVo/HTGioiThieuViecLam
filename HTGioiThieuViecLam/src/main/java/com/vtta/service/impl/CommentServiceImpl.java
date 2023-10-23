/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.service.impl;

import com.vtta.pojo.Comment;
import com.vtta.pojo.Company;
import com.vtta.repository.CommentRepository;
import com.vtta.service.CommentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TramAnh
 */
@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentRepository commentRepo;
     
    @Override
    public List<Comment> getComments(Company com) {
        return this.commentRepo.getComments(com);
    }

    @Override
    public Comment addComment(Comment c) {
        return this.commentRepo.addComment(c);
    }

    @Override
    public Boolean add(Comment c) {
        return this.commentRepo.add(c); 
    }
    
}
