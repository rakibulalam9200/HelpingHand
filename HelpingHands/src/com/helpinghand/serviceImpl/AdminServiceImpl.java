package com.helpinghand.serviceImpl;

import com.helpinghand.dao.AdminDao;
import com.helpinghand.daoImpl.AdminDaoImpl;
import com.helpinghand.model.Admin;
import com.helpinghand.service.AdminService;

public class AdminServiceImpl implements AdminService {

	AdminDao admindao = new AdminDaoImpl();

	@Override
	public Admin CheckAdmin(String adminName) {
		// TODO Auto-generated method stub
		return admindao.CheckAdmin(adminName);
	}

	@Override
	public boolean AdminLogIn(String adminEmail, String adminPassword) {
		// TODO Auto-generated method stub
		return admindao.AdminLogIn(adminEmail, adminPassword);
	}

	@Override
	public Admin getAdminInfo(String adminName) {
		// TODO Auto-generated method stub
		return admindao.getAdminInfo(adminName);
	}

	@Override
	public void updateAdminInfo(Admin updateAdmin) {
		admindao.updateAdminInfo(updateAdmin);
	}
}
