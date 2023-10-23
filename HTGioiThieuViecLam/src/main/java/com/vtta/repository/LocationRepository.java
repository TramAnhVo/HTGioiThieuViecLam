/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtta.repository;

import com.vtta.pojo.Location;
import java.util.List;

/**
 *
 * @author Trâm Anh
 */
public interface LocationRepository {
    List<Location> getLocation();
    boolean addOrUpdateLocation(Location p);
    Location getLocationById(int id);
    boolean deleteLocation(int id);
}
