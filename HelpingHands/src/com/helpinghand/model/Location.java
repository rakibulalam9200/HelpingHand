package com.helpinghand.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "location")
public class Location {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "locationId")
	private int locationId;

	@Column(name = "locationName")
	private String locationName;
	
	@Column(name = "locationEmail")
	private String locationEmail;

	@Column(name = "locationDate")
	private Date locationDate;
	
	public Location() {
	}

	public Location(int locationId, String locationName, String locationEmail, Date locationDate) {
		super();
		this.locationId = locationId;
		this.locationName = locationName;
		this.locationEmail = locationEmail;
		this.locationDate = locationDate;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getLocationEmail() {
		return locationEmail;
	}

	public void setLocationEmail(String locationEmail) {
		this.locationEmail = locationEmail;
	}

	public Date getLocationDate() {
		return locationDate;
	}

	public void setLocationDate(Date locationDate) {
		this.locationDate = locationDate;
	}	
}
