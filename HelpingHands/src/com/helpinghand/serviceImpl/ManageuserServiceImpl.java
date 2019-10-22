package com.helpinghand.serviceImpl;

import java.util.List;
import com.helpinghand.dao.ManageuserDao;
import com.helpinghand.daoImpl.ManageuserDaoImpl;
import com.helpinghand.model.User;
import com.helpinghand.service.ManageuserService;

public class ManageuserServiceImpl implements ManageuserService {

	ManageuserDao manageruser = new ManageuserDaoImpl();

	@Override
	public void addUser(User add) {
		manageruser.addUser(add);
	}

	@Override
	public void deleteUser(String id) {
		manageruser.deleteUser(id);
	}

	@Override
	public User checkUser(String username) {
		return manageruser.checkUser(username);
	}

	@Override
	public void updateUser(User update) {
		manageruser.updateUser(update);
	}

	@Override
	public User getUserInfo(String username) {
		return manageruser.getUserInfo(username);
	}

	@Override
	public List<User> getuserList() {
		return manageruser.getuserList();
	}

	@Override
	public User checkLogIn(String email) {
		return manageruser.checkLogIn(email);
	}

	@Override
	public int totalUser() {
		return manageruser.totalUser();
	}

	@Override
	public User namequerylogin(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUserpassword(User updatepass) {
		manageruser.updateUserpassword(updatepass);

	}

	@Override
	public boolean logIn(String email, String password) {
		return manageruser.logIn(email, password);
	}

	@Override
	public List<User> getuserwithList(String username) {
		return manageruser.getuserwithList(username);
	}

	@Override
	public void deleteUserInfo(int id) {
		manageruser.deleteUserInfo(id);
		
	}

}
