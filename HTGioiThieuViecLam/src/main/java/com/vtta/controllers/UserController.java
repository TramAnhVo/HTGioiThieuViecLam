/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.controllers;

import com.vtta.pojo.Company;
import com.vtta.pojo.User;
import com.vtta.service.CompanyService;
import com.vtta.service.UserService;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author TramAnh
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private CompanyService companyService;

    @RequestMapping("/register")
    public String Users(Model model) {
        model.addAttribute("user", new User());

        return "register";
    }

    @PostMapping("/register")
    public String register(Model model, @ModelAttribute(value = "user") User u) {
        String errMsg = "";
        if (u.getPassword().equals(u.getConfirmPassword())) {
            if (this.userService.addUser(u) == true) {

                SimpleMailMessage simpleMail = new SimpleMailMessage();
                simpleMail.setTo(u.getEmail());
                simpleMail.setSubject("Thông báo");
                simpleMail.setText("Bạn đã đăng kí thành công !!! chào mừng bạn "
                        + u.getFirstName() + " " + u.getLastName());

                mailSender.send(simpleMail);
                return "redirect:/";
            } else {
                errMsg = "Đã có lỗi xảy ra !!";
            }
        } else {
            errMsg = "Mật khẩu nhập không khớp !!";
        }
        model.addAttribute("errMsg", errMsg);
        return "register";
    }

    @GetMapping("/login")
    public String loginView(Model model) {

        return "login";
    }

    @GetMapping("/profile")
    public String profileView(Model model, HttpSession session) {
        model.addAttribute("currentUser", session.getAttribute("currentUser"));

        return "profile";
    }

    @GetMapping("/formUpdateCompany")
    public String UpdateCompany(Model model) {
        model.addAttribute("company", new Company());

        return "formUpdateCompany";
    }

    @GetMapping("/formUpdateCompany/{id}")
    public String getCompanyById(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("company", this.companyService.getCompanyById(id));

        return "formUpdateCompany";
    }

    @PostMapping("/formUpdateCompany")
    public String updateCompanies(Model model, @ModelAttribute(value = "company") Company p, HttpSession session) {

        Object currentUser = session.getAttribute("currentUser");
        if (currentUser != null) {
            if (currentUser instanceof User) {
                Company c = this.companyService.getCompanyById(p.getId());
                p.setName(c.getName());
            }
        }

        if (this.companyService.addCompany(p) == true) {
            return "redirect:/login";
        }

        return "formUpdateCompany";
    }

}
