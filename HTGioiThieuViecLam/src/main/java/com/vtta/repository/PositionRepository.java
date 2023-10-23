/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtta.repository;

import com.vtta.pojo.Position;
import java.util.List;

/**
 *
 * @author TramAnh
 */
public interface PositionRepository {
    List<Position> getPosition();
    boolean addOrUpdatePosition(Position p);
    Position getPositionById(int id);
    boolean deletePosition(int id);
}
