/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.service.impl;

import com.vtta.pojo.Position;
import com.vtta.repository.PositionRepository;
import com.vtta.service.PositionService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TramAnh
 */
@Service
public class PositionServiceImpl implements PositionService{
    
    @Autowired
    private PositionRepository posiRepository;

    @Override
    public List<Position> getPosition() {
        return this.posiRepository.getPosition();
    }

    @Override
    public boolean addOrUpdatePosition(Position p) {
        return this.posiRepository.addOrUpdatePosition(p);
    }

    @Override
    public Position getPositionById(int id) {
        return this.posiRepository.getPositionById(id);
    }

    @Override
    public boolean deletePosition(int id) {
        return this.posiRepository.deletePosition(id);
    }
    
}
