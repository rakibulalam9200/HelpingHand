package com.helpinghand.service;


import java.util.List;

import com.helpinghand.model.User;

public interface ManageuserService {

	public void addUser(User add);

	public void deleteUser(String id) ;

	public User checkUser(String username) ;

	public void updateUser(User update) ;
	
	public void updateUserpassword(User updatepass);
	
	public boolean logIn(String email,String password);

	public User getUserInfo(String username) ;
	
	public List<User> getuserwithList(String username);

	public List<User> getuserList() ;

	public User checkLogIn(String email);
	
	public int totalUser();
	
	public User namequerylogin(String email);
	
	public void deleteUserInfo(int id);
}
