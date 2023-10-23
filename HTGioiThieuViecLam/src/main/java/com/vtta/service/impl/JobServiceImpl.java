/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.service.impl;

import com.vtta.pojo.Company;
import com.vtta.pojo.Job;
import com.vtta.repository.JobRepository;
import com.vtta.service.JobService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Trâm Anh
 */
@Service
public class JobServiceImpl implements JobService {

    @Autowired
    private JobRepository jobRepo;

    @Autowired
    private SimpleDateFormat simpleDateFormat;

    @Override
    public List<Job> getJobs(Map<String, String> params) {
        return this.jobRepo.getJobs(params);
    }

    @Override
    public int countJob() {
        return this.jobRepo.countJob();
    }

    @Override
    public boolean addOrUpdateJob(Job job) {
        Date currentDate = new Date();
        try {
            job.setCreateDay(this.simpleDateFormat
                    .parse(this.simpleDateFormat.format(currentDate)));
        } catch (ParseException ex) {
            Logger.getLogger(JobServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return this.jobRepo.addOrUpdateJob(job);
    }

    @Override
    public Job getJobById(int i) {
        return this.jobRepo.getJobById(i);
    }

    @Override
    public boolean deleteJob(int i) {
        return this.jobRepo.deleteJob(i);
    }

    @Override
    public List<Job> getJobsByComId(Company com) {
        return this.jobRepo.getJobsByComId(com);
    }

}
