/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtta.service;

import com.vtta.pojo.Company;
import com.vtta.pojo.Job;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Trâm Anh
 */
public interface JobService {
    List<Job> getJobs(Map<String, String> params);
    List<Job> getJobsByComId(Company com);
    
    int countJob();
    boolean addOrUpdateJob(Job p);
    Job getJobById(int id);
    boolean deleteJob(int id);
}
