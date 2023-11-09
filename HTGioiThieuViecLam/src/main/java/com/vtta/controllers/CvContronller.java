/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.controllers;

import com.vtta.pojo.Comment;
import com.vtta.pojo.Cv;
import com.vtta.pojo.Job;
import com.vtta.pojo.User;
import com.vtta.service.CvService;
import com.vtta.service.JobService;
import com.vtta.service.UserService;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author TramAnh
 */
@Controller
public class CvContronller {

    @Autowired
    private CvService cvService;
    @Autowired
    private JobService jobService;
    @Autowired
    private UserService userService;
    @Autowired
    private JavaMailSender mailSender;

    @GetMapping("/jobs/{id}/formApply")
    public String getCv(Model model, @PathVariable(value = "id") int id,
            @RequestParam Map<String, String> params) {
        model.addAttribute("jobs", this.jobService.getJobs(params));
        model.addAttribute("job", this.jobService.getJobById(id));
        model.addAttribute("cv", new Cv());

        return "formApply";
    }

    @PostMapping(path = "/jobs/{id}/formApply")
    public String addCv(@ModelAttribute(value = "cv") Cv c,
            @PathVariable(value = "id") int id, Principal pricipal) {

        User u = this.userService.getUserByUsername(pricipal.getName());
        c.setUserId(u);

        if (this.cvService.addCv(c, id) == true) {
            SimpleMailMessage simpleMail = new SimpleMailMessage();
            simpleMail.setTo(u.getEmail());
            simpleMail.setSubject("Thông báo");
            simpleMail.setText("Bạn đã gửi cv thành công cho doanh nghiệp!!!");

            mailSender.send(simpleMail);
            return "redirect:/indexJob";
        }

        return "formApply";
    }

}
