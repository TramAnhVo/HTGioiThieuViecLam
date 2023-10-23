/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.controllers;

import com.vtta.pojo.Comment;
import com.vtta.pojo.Job;
import com.vtta.pojo.User;
import com.vtta.service.CommentService;
import com.vtta.service.JobService;
import com.vtta.service.UserService;
import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author TramAnh
 */
@RestController
@RequestMapping("/api")
public class ApiComment {

    @Autowired
    private CommentService commentService;
    @Autowired
    private JobService productService;
    @Autowired
    private UserService userService;

//    @GetMapping("/jobs/{id}/comments")
//    public ResponseEntity<List<Comment>> getComments(@PathVariable(value = "id") int id) {
//        List<Comment> comments = this.commentService.getComments();
//        return new ResponseEntity<>(comments, HttpStatus.OK);
//    }

    @PostMapping(path = "/jobs/{id}/comments", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comment> addComment(@RequestBody Map<String, String> params,
            @PathVariable(value = "id") int id, Principal pricipal) {
        Job p = this.productService.getJobById(id);
        User u = this.userService.getUserByUsername(pricipal.getName());

        Comment c = new Comment();
        c.setContent(params.get("content"));
//        c.setJobId(p);
        c.setUserId(u);
        c.setCreateDay(new Date());
        c = this.commentService.addComment(c);
        if (c != null) {
            return new ResponseEntity<>(c, HttpStatus.CREATED);
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
