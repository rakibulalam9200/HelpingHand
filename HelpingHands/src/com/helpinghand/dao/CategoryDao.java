package com.helpinghand.dao;

import java.util.List;

import com.helpinghand.model.Category;

public interface CategoryDao {
	
	public void addCategory(Category addcat);
	
	public void deleteCategory(int categoryId);
	
	public Category getCategoryInfo(String categoryName);
	
	public List<Category> getCategoryList();
	
	public void updateCategory(Category updatecat);
}
