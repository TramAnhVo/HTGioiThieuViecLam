/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtta.service;

import com.vtta.pojo.User;
import java.util.List;
import java.util.Map;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author TramAnh
 */
public interface UserService extends UserDetailsService {
    Boolean addUser(User u);
    User getIdUser(int id);
    List<User> getUser(String username);
    List<User> getUsers();
    public User getUserByUsername(String username);
    Boolean deleteUser(int id);
    
    List<User> getActiveF();
    List<User> getActiveT();
    Boolean updateActive(int id);
    User getIdCompany(int id);
    
    // api
    boolean authUser(String username, String password);
    User addUsers(Map<String, String> params, MultipartFile avatar);
}
