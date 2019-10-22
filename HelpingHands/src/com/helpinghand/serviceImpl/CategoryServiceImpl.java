package com.helpinghand.serviceImpl;

import java.util.List;

import com.helpinghand.dao.CategoryDao;
import com.helpinghand.dao.ManageuserDao;
import com.helpinghand.daoImpl.CategoryDaoImpl;
import com.helpinghand.daoImpl.ManageuserDaoImpl;
import com.helpinghand.model.Category;
import com.helpinghand.model.User;
import com.helpinghand.service.CategoryService;

public class CategoryServiceImpl implements CategoryService{

	CategoryDao category = new CategoryDaoImpl();

	@Override
	public void addCategory(Category addcat) {
		category.addCategory(addcat);
		
	}

	@Override
	public Category getCategoryInfo(String categoryName) {
		
		return category.getCategoryInfo(categoryName);
	}

	@Override
	public List<Category> getCategoryList() {
		
		return category.getCategoryList();
	}

	@Override
	public void updateCategory(Category updatecat) {
		category.updateCategory(updatecat);
		
	}

	@Override
	public void deleteCategory(int categoryId) {
		category.deleteCategory(categoryId);
		
	}

	


}
