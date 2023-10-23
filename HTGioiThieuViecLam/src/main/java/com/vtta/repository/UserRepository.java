/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtta.repository;

import com.vtta.pojo.User;
import java.util.List;

/**
 *
 * @author TramAnh
 */
public interface UserRepository {
    User getUserByUsername(String username);
    List<User> getUser(String username);
    List<User> getUsers();
    User getIdUser(int id);
    Boolean deleteUser(int id);
    Boolean addUser(User u);
    
    // duyet
    List<User> getActiveF();
    List<User> getActiveT();
    Boolean updateActive(int id);
    User getIdCompany(int id);
    
    // api
    boolean authUser(String username, String password);
    User addUsers(User user);
}
