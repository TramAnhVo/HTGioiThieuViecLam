/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.formatters;

import com.vtta.pojo.Company;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author TramAnh
 */
public class CompanyFormatter implements Formatter<Company>{

    @Override
    public String print(Company compa, Locale locale) {
        return String.valueOf(compa.getId());
    }

    @Override
    public Company parse(String compaId, Locale locale) throws ParseException {
        return new Company(Integer.parseInt(compaId));
    }    
}
