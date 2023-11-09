/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.controllers;

import com.vtta.pojo.Cv;
import com.vtta.pojo.User;
import com.vtta.service.CompanyService;
import com.vtta.service.CvService;
import com.vtta.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author TramAnh
 */
@RestController
public class ApiCv {

    @Autowired
    private CvService cvService;

    @Autowired
    private UserService userService;

    @Autowired
    private CompanyService compaService;

    @Autowired
    private JavaMailSender mailSender;
    
    // ==== GUI MAIL TU DONG ============================
    @PutMapping("/employer/manageCv/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updateActive(@PathVariable(value = "id") int id) {
        this.cvService.UpdateActive(id);

        Cv cv = this.cvService.getCvById(id);
        User u = this.userService.getIdCompany(cv.getUserId().getId());

        SimpleMailMessage simpleMail = new SimpleMailMessage();
        simpleMail.setTo(u.getEmail());
        simpleMail.setSubject("Thông báo");
        simpleMail.setText("Chúc mừng bạn " + u.getFirstName() + " " + u.getLastName()
                + " đã trúng tuyển công việc " + cv.getJobId().getTitle()
                + " ở " + cv.getJobId().getLocationId().getName()
                + ". Hãy chờ liên lạc của công ty" + cv.getJobId().getCompanyId().getName()
                + " hoặc có thể liên lạc qua mail này " + cv.getJobId().getCompanyId().getEmail());

        mailSender.send(simpleMail);
    }
}
