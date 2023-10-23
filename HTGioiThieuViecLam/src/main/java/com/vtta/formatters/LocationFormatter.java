/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.formatters;

import com.vtta.pojo.Location;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author TramAnh
 */
public class LocationFormatter implements Formatter<Location>{

    @Override
    public String print(Location loca, Locale locale) {
        return String.valueOf(loca.getId());
    }

    @Override
    public Location parse(String locaId, Locale locale) throws ParseException {
        return new Location(Integer.parseInt(locaId));
    }
    
}
