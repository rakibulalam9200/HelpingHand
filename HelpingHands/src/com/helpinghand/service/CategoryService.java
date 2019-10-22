package com.helpinghand.service;

import java.util.List;

import com.helpinghand.model.Category;
import com.helpinghand.model.User;

public interface CategoryService {

	public void addCategory(Category addcat);
	
	public void deleteCategory(int categoryId);
	
	public Category getCategoryInfo(String categoryName);
	
	public List<Category> getCategoryList();
	
	public void updateCategory(Category updatecat);

}
