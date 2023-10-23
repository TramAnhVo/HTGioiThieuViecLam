/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.controllers;

import com.vtta.pojo.Company;
import com.vtta.pojo.User;
import com.vtta.service.CompanyService;
import com.vtta.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author TramAnh
 */
@RestController
public class ApiCompanyController {
    @Autowired
    private CompanyService compaService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private JavaMailSender mailSender;
    
    @DeleteMapping("/admin/companies/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") int id) {
        User u = this.userService.getIdCompany(id);
        this.compaService.deleteCompany(u.getCompanyId().getId());
    }
    
    @PutMapping("/admin/companies/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updateActive(@PathVariable(value = "id") int id) {
        this.userService.updateActive(id);
        User u = this.userService.getIdCompany(id);
                
        SimpleMailMessage simpleMail = new SimpleMailMessage();
        simpleMail.setTo(u.getEmail());
        simpleMail.setSubject("Thông báo");
        simpleMail.setText(u.getFirstName() + u.getLastName() + " đã được phép hoạt động! "
                + "Bạn hãy cập nhật thông tin doanh nghiệp nào!");

        mailSender.send(simpleMail);
    }
}
