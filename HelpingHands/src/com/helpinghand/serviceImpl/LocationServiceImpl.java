package com.helpinghand.serviceImpl;

import java.util.List;

import com.helpinghand.dao.LocationDao;
import com.helpinghand.daoImpl.LocationDaoImpl;
import com.helpinghand.model.Location;
import com.helpinghand.service.LocationService;

public class LocationServiceImpl implements LocationService {

	LocationDao locationdao = new LocationDaoImpl();

	@Override
	public void addLocation(Location addlocation) {

		locationdao.addLocation(addlocation);
	}

	@Override
	public void deletelocation(int locationId) {
		locationdao.deletelocation(locationId);

	}

	@Override
	public Location getLocationInfo(String locationId) {
		// TODO Auto-generated method stub
		return locationdao.getLocationInfo(locationId);
	}

	@Override
	public List<Location> getLocationList() {
		// TODO Auto-generated method stub
		return locationdao.getLocationList();
	}

	@Override
	public void updatelocation(Location updatelocation) {
		locationdao.updatelocation(updatelocation);

	}

}
