package com.helpinghand.daoImpl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.helpinghand.dao.CategoryDao;
import com.helpinghand.model.Category;
import com.helpinghand.model.User;
import com.helpinghand.utils.HibernateUtil;

public class CategoryDaoImpl implements CategoryDao{
	
	private SessionFactory SessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public void addCategory(Category addcat) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(addcat);
		transaction.commit();
		session.close();
	}

	@Override
	public void updateCategory(Category updatecat) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(updatecat);
		transaction.commit();
		session.close();
		
	}

	@Override
	public List<Category> getCategoryList() {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<Category> list = new ArrayList<Category>();
		transaction = session.beginTransaction();
		list = session.createQuery("from Category").list();
		transaction.commit();
		session.close();
		return list;
	}

	@Override
	public Category getCategoryInfo(String categoryId) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		Category category = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from Category where categoryId='" + categoryId + "'");
			category = (Category) query.uniqueResult();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return category;
	}

	@Override
	public void deleteCategory(int categoryId) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Query theQuery = session.createQuery("delete from Category where categoryId=:categoryId");
		theQuery.setParameter("categoryId", categoryId);
		theQuery.executeUpdate();
		transaction.commit();
		session.close();
		
	}



	

}
