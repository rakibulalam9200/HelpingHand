package com.helpinghand.service;

import java.util.List;
import com.helpinghand.model.Location;

public interface LocationService {

	public void addLocation(Location addlocation);

	public void deletelocation(int locationId);

	public Location getLocationInfo(String locationId);

	public List<Location> getLocationList();

	public void updatelocation(Location updatelocation);
	
}
