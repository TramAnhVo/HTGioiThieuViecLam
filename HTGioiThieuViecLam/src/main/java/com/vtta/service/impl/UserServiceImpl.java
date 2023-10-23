/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.vtta.pojo.User;
import com.vtta.repository.UserRepository;
import com.vtta.service.UserService;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author TramAnh
 */
@Service("userDetailsService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private BCryptPasswordEncoder PasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User u = this.userRepo.getUserByUsername(username);
        if (u.getActive() == true) {
            if (u == null) {
                throw new UsernameNotFoundException("Invalid user!");
            }

            Set<GrantedAuthority> authorities = new HashSet<>();
            authorities.add(new SimpleGrantedAuthority(u.getUserRole()));

            return new org.springframework.security.core.userdetails.User(
                    u.getUsername(), u.getPassword(), authorities);
        }
        return (UserDetails) new org.springframework.security.core.userdetails.UsernameNotFoundException("Bạn chưa có quyền!!!");
    }

    @Override
    public Boolean addUser(User u) {
        String pass = u.getPassword();
        u.setPassword(this.PasswordEncoder.encode(pass));
        u.setActive(true);
        if (!u.getFile().isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(u.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                u.setAvatar(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this.userRepo.addUser(u);
    }

    @Override
    public List<User> getUser(String username) {
        return this.userRepo.getUser(username);
    }

    @Override
    public List<User> getUsers() {
        return this.userRepo.getUsers();
    }

    @Override
    public User getIdUser(int id) {
        return this.userRepo.getIdUser(id);
    }

    @Override
    public User getUserByUsername(String username) {
        return this.userRepo.getUserByUsername(username);
    }

    @Override
    public List<User> getActiveF() {
        return this.userRepo.getActiveF();
    }

    @Override
    public Boolean updateActive(int id) {
        return this.userRepo.updateActive(id);
    }

    @Override
    public User getIdCompany(int id) {
        return this.userRepo.getIdCompany(id);
    }

    @Override
    public List<User> getActiveT() {
        return this.userRepo.getActiveT();
    }
    
    @Override
    public Boolean deleteUser(int id) {
        return this.userRepo.deleteUser(id);
    }

    // ===================== API ===============================================
    @Override
    public boolean authUser(String username, String password) {
        return this.userRepo.authUser(username, password);
    }

    @Override
    public User addUsers(Map<String, String> params, MultipartFile avatar) {
        User u = new User();
        u.setFirstName(params.get("firstName"));
        u.setLastName(params.get("lastName"));
        u.setGender(params.get("gender"));
        u.setPhone(params.get("phone"));
        u.setEmail(params.get("email"));
        u.setUsername(params.get("username"));
        u.setPassword(this.PasswordEncoder.encode(params.get("password")));
        u.setActive(Boolean.TRUE);
        u.setUserRole("ROLE_USER");
        if (!avatar.isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(avatar.getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                u.setAvatar(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        this.userRepo.addUser(u);
        return u;
    }
}
