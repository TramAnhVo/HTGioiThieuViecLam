/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.controllers;

import com.vtta.pojo.Blog;
import com.vtta.pojo.Comment;
import com.vtta.pojo.Company;
import com.vtta.pojo.Job;
import com.vtta.pojo.User;
import com.vtta.service.BlogService;
import com.vtta.service.CommentService;
import com.vtta.service.CompanyService;
import com.vtta.service.JobService;
import com.vtta.service.LocationService;
import com.vtta.service.MajorService;
import com.vtta.service.PositionService;
import com.vtta.service.UserService;
import java.security.Principal;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Trâm Anh
 */
@Controller
@ControllerAdvice
@PropertySource("classpath:configs.properties")
public class HomeController {

    @Autowired
    private Environment env;
    @Autowired
    private JobService jobservice;
    @Autowired
    private LocationService locationService;
    @Autowired
    private MajorService majorService;
    @Autowired
    private PositionService positionService;
    @Autowired
    private CompanyService companyService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;
    @Autowired
    private BlogService blogService;

    @ModelAttribute
    public void commonAttributes(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("jobs", this.jobservice.getJobs(params));
        model.addAttribute("locations", this.locationService.getLocation());
        model.addAttribute("companies", this.companyService.getCompany());
        model.addAttribute("majors", this.majorService.getMajor());
        model.addAttribute("positions", this.positionService.getPosition());
    }

    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params, HttpSession session) {
        model.addAttribute("currentUser", session.getAttribute("currentUser"));

        return "index";
    }

    @GetMapping(path = "/jobs/{jobId}")
    public String jobDetails(Model model, @PathVariable(value = "jobId") int id) {
        model.addAttribute("job", this.jobservice.getJobById(id));

        return "jobDetail";
    }
    
    @GetMapping(path = "/indexJob")
    public String job(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("job", new Job());

        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        int count = this.jobservice.countJob();
        model.addAttribute("counters", this.jobservice.countJob());
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
        return "indexJob";
    }
    
    // ============================ DOANH NGHIỆP ==================================================
    @GetMapping(path = "/companies/{compaId}")
    public String companyDetails(Model model, @PathVariable(value = "compaId") int id) {
        model.addAttribute("company", this.companyService.getCompanyById(id));
        model.addAttribute("cmt", new Comment());
        
        Company com = this.companyService.getCompanyById(id);
        model.addAttribute("cmts",this.commentService.getComments(com));
        
        return "companyDetail";
    }
        
    @PostMapping("/companies/{id}")
    public String add(@ModelAttribute(value = "cmt") Comment cmt,
            @PathVariable(value = "id") int id, Principal pricipal) {
        User u = this.userService.getUserByUsername(pricipal.getName());
        Company c = this.companyService.getCompanyById(id);
        
        cmt.setUserId(u);
        cmt.setCompanyId(c);
        cmt.setCreateDay(new Date());
        
        if (this.commentService.add(cmt) == true) {
            return "redirect:/companies/{id}";
        }
        return "companyDetail";
    }
    
    @GetMapping("/indexCompany")
    public String indexCompany(Model model) {

        return "indexCompany";
    }
    
    // ============================ BLOG ==================================================
    @GetMapping("/blog")
    public String blog(Model model) {
        model.addAttribute("blogs", this.blogService.getBlog());
        model.addAttribute("blog", new Blog());
        
        return "blog";
    }
    
    @PostMapping("/blog")
    public String addBlog(@ModelAttribute(value = "blog") Blog b, Principal pricipal) {
        User u = this.userService.getUserByUsername(pricipal.getName());        
        b.setUserId(u);
        
        if (this.blogService.addOrUpdateBlog(b) == true) {
            return "redirect:/blog";
        }
        return "blog";
    }
}
