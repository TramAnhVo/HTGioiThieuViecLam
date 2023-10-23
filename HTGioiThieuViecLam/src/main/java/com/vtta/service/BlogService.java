/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtta.service;

import com.vtta.pojo.Blog;
import java.util.List;

/**
 *
 * @author TramAnh
 */
public interface BlogService {
    List<Blog> getBlog();
    boolean addOrUpdateBlog(Blog p);
    Blog getBlogById(int id);
    boolean deleteBlog(int id);
}
