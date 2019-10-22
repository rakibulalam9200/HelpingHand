package com.helpinghand.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "categoryId")
	private int categoryId;

	@Column(name = "type")
	private String type;

	@Column(name = "categoryName")
	private String categoryName;

	@Column(name = "categoryEmail")
	private String categoryEmail;

	@Column(name = "categorydate")
	private Date categorydate;

	public Category() {
		super();
	}

	public Category(int categoryId, String type, String categoryName, String categoryEmail, Date categorydate) {
		super();
		this.categoryId = categoryId;
		this.type = type;
		this.categoryName = categoryName;
		this.categoryEmail = categoryEmail;
		this.categorydate = categorydate;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryEmail() {
		return categoryEmail;
	}

	public void setCategoryEmail(String categoryEmail) {
		this.categoryEmail = categoryEmail;
	}

	public Date getCategorydate() {
		return categorydate;
	}

	public void setCategorydate(Date categorydate) {
		this.categorydate = categorydate;
	}
}
