  /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtta.repository;

import com.vtta.pojo.Comment;
import com.vtta.pojo.Company;
import java.util.List;

/**
 *
 * @author TramAnh
 */
public interface CommentRepository {
    List<Comment> getComments(Company com);
    Comment addComment(Comment c);
    Boolean add(Comment c);
}
