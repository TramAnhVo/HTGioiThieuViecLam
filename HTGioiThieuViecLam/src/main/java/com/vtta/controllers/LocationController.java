/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.controllers;

import com.vtta.pojo.Location;
import com.vtta.service.LocationService;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
 * @author Trâm Anh
 */
@Controller
public class LocationController {

    @Autowired
    private LocationService locationService;
    
    @Autowired
    private JavaMailSender mailSender;

    @GetMapping("/locations")
    public String List(Model model) {
        model.addAttribute("locations", this.locationService.getLocation());
        model.addAttribute("location", new Location());

        return "locations";
    }

    @PostMapping("/locations")
    public String add(Model model, @ModelAttribute(value = "location") @Valid Location p,
            BindingResult rs) {

        if (!rs.hasErrors()) {
            if (this.locationService.addOrUpdateLocation(p) == true) {
                return "redirect:/locations";
            }
        }
        return "locations";
    }

    @GetMapping("/locations/{id}")
    public String getLocationsById(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("location", this.locationService.getLocationById(id));
        model.addAttribute("locations", this.locationService.getLocation());
        return "locations";
    }
}
