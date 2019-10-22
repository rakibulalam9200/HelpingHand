package com.helpinghand.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userid")
	private int userId;
	@Column(name = "username")
	private String userName;
	@Column(name = "useremail")
	private String userEmail;
	@Column(name = "usernid")
	private String userNID;
	@Column(name = "userpassword")
	private String userPassword;
	@Column(name = "userdate")
	private String userDate;

	public User() {

	}

	public User(int userId, String userName, String userEmail, String userNID, String userPassword, String userDate) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userNID = userNID;
		this.userPassword = userPassword;
		this.userDate = userDate;
	}

	public User(String passwordString, String userEmail) {
		this.userPassword = passwordString;
		this.userEmail = userEmail;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserNID() {
		return userNID;
	}

	public void setUserNID(String userNID) {
		this.userNID = userNID;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserDate() {
		return userDate;
	}

	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}

}
