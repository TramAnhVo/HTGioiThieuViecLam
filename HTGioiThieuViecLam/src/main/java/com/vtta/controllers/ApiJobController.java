/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.controllers;

import com.vtta.pojo.Job;
import com.vtta.service.JobService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author TramAnh
 */
@RestController
public class ApiJobController {
    @Autowired
    private JobService jobService;
    
    @DeleteMapping("/admin/jobs/formJobDetail/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") int id) {
        this.jobService.deleteJob(id);
    }
    
    @GetMapping("/api/jobs/")
    @CrossOrigin
    public ResponseEntity<List<Job>> list(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.jobService.getJobs(params), HttpStatus.OK);
    }
        
    @RequestMapping(path = "/api/jobs/{jobId}/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Job> details(@PathVariable(value = "jobId") int id) {
        return new ResponseEntity<>(this.jobService.getJobById(id), HttpStatus.OK);
    }
}
