/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.controllers;

import com.vtta.pojo.Blog;
import com.vtta.pojo.Company;
import com.vtta.pojo.Job;
import com.vtta.pojo.User;
import com.vtta.service.BlogService;
import com.vtta.service.CompanyService;
import com.vtta.service.JobService;
import com.vtta.service.LocationService;
import com.vtta.service.MajorService;
import com.vtta.service.PositionService;
import com.vtta.service.StatsService;
import com.vtta.service.UserService;
import java.security.Principal;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author TramAnh
 */
@Controller
@RequestMapping("/admin")
@PropertySource("classpath:configs.properties")
public class AdminController {

    @Autowired
    private JobService jobservice;

    @Autowired
    private Environment env;

    @Autowired
    private LocationService locationService;

    @Autowired
    private CompanyService companyService;

    @Autowired
    private UserService userService;

    @Autowired
    private MajorService majorService;

    @Autowired
    private PositionService positionService;

    @Autowired
    private StatsService statsService;

    @Autowired
    private BlogService blogService;

    // ====================== QUAN LY CONG VIEC =========================================================
    @RequestMapping("/jobs/formJobDetail")
    public String jobDetails(Model model) {
        model.addAttribute("locations", this.locationService.getLocation());
        model.addAttribute("companies", this.companyService.getCompany());
        model.addAttribute("majors", this.majorService.getMajor());
        model.addAttribute("positions", this.positionService.getPosition());
        model.addAttribute("job", new Job());

        return "formJobDetail";
    }

    @RequestMapping("/jobs")
    public String jobs(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("jobs", this.jobservice.getJobs(params));
        model.addAttribute("job", new Job());

        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        int count = this.jobservice.countJob();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));

        return "jobs";
    }

    @PostMapping("/jobs/formJobDetail")
    public String add(Model model, @ModelAttribute(value = "job") @Valid Job p,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            if (this.jobservice.addOrUpdateJob(p) == true) {
                return "redirect:/admin/jobs";
            }
        }
        return "formJobDetail";
    }

    @GetMapping("/jobs/formJobDetail/{id}")
    public String getJobById(Model model, @PathVariable(value = "id") int id, @RequestParam Map<String, String> params) {
        model.addAttribute("job", this.jobservice.getJobById(id));
        model.addAttribute("jobs", this.jobservice.getJobs(params));

        return "formJobDetail";
    }

    // ====================== QUAN LY DOANH NGHIEP =========================================================
    @RequestMapping("/listCompanies")
    public String ListCompanies(Model model) {
        model.addAttribute("companiesF", this.userService.getActiveF());
        model.addAttribute("companiesT", this.userService.getActiveT());

        return "listCompany";
    }

    @GetMapping("/companies")
    public String Companies(Model model) {
        model.addAttribute("companies", this.companyService.getCompany());

        return "companies";
    }

    @GetMapping("/companies/formAddCompany")
    public String Company(Model model) {
        model.addAttribute("company", new Company());

        return "formAddCompany";
    }

    @PostMapping("/companies/formAddCompany")
    public String addCompany(Model model, @ModelAttribute(value = "company") @Valid Company p, BindingResult rs) {

        if (!rs.hasErrors()) {
            if (this.companyService.addCompany(p) == true) {
                return "redirect:/admin/companies";
            }
        }
        return "formAddCompany";
    }

    @GetMapping("/companies/formAddCompany/{id}")
    public String getCompanyById(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("company", this.companyService.getCompanyById(id));
        model.addAttribute("companies", this.companyService.getCompany());

        return "formAddCompany";
    }

    // ====================== THONG KE =========================================================
    @GetMapping("/majorStats")
    public String majorStats(Model model) {
        model.addAttribute("majorStats", this.statsService.statsMajor());
        return "majorStats";
    }

    @GetMapping("/yearStats")
    public String yearStats(Model model, @RequestParam(value = "year", defaultValue = "2023") int year) {
        model.addAttribute("revenues", this.statsService.statsRevenue(year));
        return "yearStats";
    }

    @GetMapping("/quarterStats")
    public String quarterStats(Model model,
            @RequestParam(value = "quarter", defaultValue = "4") int quarter,
            @RequestParam(value = "year", defaultValue = "2023") int year) {
        model.addAttribute("quarterStats", this.statsService.quarterStats(quarter, year));

        return "quarterStats";
    }

    // ====================== QUAN LY NGUOI DUNG =========================================================
    @GetMapping("/users")
    public String userInfomation(Model model) {
        model.addAttribute("userInfo", this.userService.getUsers());

        return "users";
    }

    @GetMapping("/users/formUser")
    public String userForm(Model model) {
        model.addAttribute("user", new User());

        return "formUser";
    }

    @PostMapping("/users/formUser")
    public String addUser(Model model, @ModelAttribute(value = "user") User u) {

        if (this.userService.addUser(u) == true) {
            return "redirect:/admin/users";
        }
        return "formUser";
    }

    @GetMapping("/users/formUser/{id}")
    public String updateUserInfomation(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("user", this.userService.getIdUser(id));

        return "formUser";
    }

    // ====================== QUAN LY DIEN DAN BAI TIM VIEC =========================================================
    @GetMapping("/manageBlog")
    public String blog(Model model) {
        model.addAttribute("blogs", this.blogService.getBlog());
        model.addAttribute("blog", new Blog());

        return "manageBlog";
    }

    @PostMapping("/manageBlog")
    public String addBlog(@ModelAttribute(value = "blog") Blog b, Principal pricipal) {
        User u = this.userService.getUserByUsername(pricipal.getName());
        b.setUserId(u);

        if (this.blogService.addOrUpdateBlog(b) == true) {
            return "redirect:/admin/manageBlog";
        }
        return "manageBlog";
    }

    @GetMapping("/manageBlog/{id}")
    public String BlogId(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("blogs", this.blogService.getBlogById(id));

        return "manageBlog";
    }
}
