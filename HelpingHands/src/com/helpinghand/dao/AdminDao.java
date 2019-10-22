package com.helpinghand.dao;

import com.helpinghand.model.Admin;


public interface AdminDao {
	
	public Admin CheckAdmin(String adminName);
	
	public boolean AdminLogIn(String adminEmail, String adminPassword);
	
	public Admin getAdminInfo(String adminName);
	
	public void updateAdminInfo(Admin updateAdmin);

}
