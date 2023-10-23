/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtta.service;

import java.util.Date;
import java.util.List;

/**
 *
 * @author TramAnh
 */
public interface StatsService {
    List<Object[]> statsMajor();
    List<Object[]> statsRevenue(int year);
    List<Object[]> quarterStats(int quarter, int year);
}
