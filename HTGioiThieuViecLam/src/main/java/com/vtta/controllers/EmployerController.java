/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.controllers;

import com.vtta.pojo.Company;
import com.vtta.pojo.Job;
import com.vtta.pojo.User;
import com.vtta.service.CompanyService;
import com.vtta.service.CvService;
import com.vtta.service.JobService;
import com.vtta.service.LocationService;
import com.vtta.service.MajorService;
import com.vtta.service.PositionService;
import com.vtta.service.UserService;
import java.security.Principal;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author TramAnh
 */
@Controller
@RequestMapping("/employer")
public class EmployerController {

    @Autowired
    private JobService jobService;
    @Autowired
    private LocationService locationService;
    @Autowired
    private MajorService majorService;
    @Autowired
    private PositionService positionService;
    @Autowired
    private CompanyService companyService;
    @Autowired
    private CvService cvService;
    @Autowired
    private UserService userService;
    @Autowired
    private HttpSession session;

    @ModelAttribute
    public void commonAttributes(Model model, @RequestParam Map<String, String> params, HttpSession session) {
        model.addAttribute("jobs", this.jobService.getJobs(params));
        model.addAttribute("locations", this.locationService.getLocation());
        model.addAttribute("companies", this.companyService.getCompany());
        model.addAttribute("majors", this.majorService.getMajor());
        model.addAttribute("positions", this.positionService.getPosition());
    }

    @RequestMapping("/formJob")
    public String addJob(Model model, HttpSession session) {
        model.addAttribute("job", new Job());

        return "formJob";
    }
    
    //==================  dang bai tuyen dung ====================================
    @PostMapping("/formJob")
    public String add(Model model, @ModelAttribute(value = "job") @Valid Job p,
            BindingResult rs) {

        Object currentUser = session.getAttribute("currentUser");
        if (currentUser != null) {
            if (currentUser instanceof User) {
                User user = (User) currentUser;
                Company companyId = user.getCompanyId();
                p.setCompanyId(companyId);
            }
        }

        if (this.jobService.addOrUpdateJob(p) == true) {
            return "redirect:/";
        }
        return "formJob";
    }
    
    //==================  quan li ho so ung tuyen ====================================
    @RequestMapping("/manageCv")
    public String SeeCv(Model model,  Principal pricipal) {
        User u = this.userService.getUserByUsername(pricipal.getName());
        Company com = this.companyService.getCompanyById(u.getCompanyId().getId());
        model.addAttribute("jobCompa", this.jobService.getJobsByComId(com));
        model.addAttribute("cvs", this.cvService.getCvIdCompany(com.getId()));
        
        return "manageCv";
    }
}
