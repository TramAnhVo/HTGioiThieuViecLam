/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.service.impl;

import com.vtta.repository.StatsRepository;
import com.vtta.service.StatsService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TramAnh
 */
@Service
public class StatsServiceImpl implements StatsService {

    @Autowired
    private StatsRepository statsRepo;

    @Override
    public List<Object[]> statsMajor() {
        return this.statsRepo.statsMajor();
    }

    @Override
    public List<Object[]> statsRevenue(int year) {
        return this.statsRepo.statsRevenue(year);
    }

    @Override
    public List<Object[]> quarterStats(int quarter, int year) {
        return this.statsRepo.quarterStats(quarter, year);
    }
}
