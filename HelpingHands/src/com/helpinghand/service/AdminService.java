package com.helpinghand.service;

import com.helpinghand.model.Admin;

public interface AdminService {
	
	public Admin CheckAdmin(String adminName);
	
	public boolean AdminLogIn(String adminEmail, String adminPassword);
	
	public Admin getAdminInfo(String adminName);
	
	public void updateAdminInfo(Admin updateAdmin);
}
