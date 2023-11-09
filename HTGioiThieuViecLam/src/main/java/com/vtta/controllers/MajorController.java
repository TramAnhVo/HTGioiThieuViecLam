/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.controllers;

import com.vtta.pojo.Location;
import com.vtta.pojo.Major;
import com.vtta.service.MajorService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Trâm Anh
 */
@Controller
public class MajorController {

    @Autowired
    private MajorService majorService;

    @GetMapping("/majors")
    public String majors(Model model) {
        model.addAttribute("majors", this.majorService.getMajor());
        model.addAttribute("major", new Major());

        return "majors";
    }

    @PostMapping("/majors")
    public String add(Model model, @ModelAttribute(value = "major") @Valid Major p, BindingResult rs) {

        if (!rs.hasErrors()) {
            if (this.majorService.addOrUpdateMajor(p) == true) {
                return "redirect:/majors";
            }
        }
        return "majors";
    }

    @GetMapping("/majors/{id}")
    public String getMajorById(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("major", this.majorService.getMajorById(id));
        model.addAttribute("majors", this.majorService.getMajor());
        return "majors";
    }
}
