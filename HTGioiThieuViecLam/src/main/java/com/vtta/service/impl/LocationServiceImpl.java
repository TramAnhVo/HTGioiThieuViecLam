/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.service.impl;

import com.vtta.pojo.Location;
import com.vtta.repository.LocationRepository;
import com.vtta.service.LocationService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Trâm Anh
 */
@Service
public class LocationServiceImpl implements LocationService {

    @Autowired
    private LocationRepository locationRepository;

    @Override
    public List<Location> getLocation() {
        return this.locationRepository.getLocation();
    }

    @Override
    public boolean addOrUpdateLocation(Location p) {
        return this.locationRepository.addOrUpdateLocation(p);
    }

    @Override
    public Location getLocationById(int id) {
        return this.locationRepository.getLocationById(id);
    }

    @Override
    public boolean deleteLocation(int id) {
        return this.locationRepository.deleteLocation(id);
    }
}
