/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.formatters;


import com.vtta.pojo.Position;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author TramAnh
 */
public class PositionFormatter implements Formatter<Position>{
     @Override
    public String print(Position posi, Locale locale) {
        return String.valueOf(posi.getId());
    }

    @Override
    public Position parse(String posiId, Locale locale) throws ParseException {
        return new Position(Integer.parseInt(posiId));
    }
}
