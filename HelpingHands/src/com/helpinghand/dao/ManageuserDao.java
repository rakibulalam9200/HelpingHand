package com.helpinghand.dao;


import java.util.List;
import com.helpinghand.model.User;

public interface ManageuserDao {

	public void addUser(User add);//done

	public void deleteUser(String id);

	public User checkUser(String username);//done

	public void updateUser(User update);
	
	public void updateUserpassword(User updatepass);//done
	
	public boolean logIn(String email,String password);//done

	public User getUserInfo(String username);

	public List<User> getuserList();
	
	public List<User> getuserwithList(String username);

	public User checkLogIn(String email);

	public int totalUser();
	
	public void deleteUserInfo(int id);//done

	public User namequerylogin(String email);
}
