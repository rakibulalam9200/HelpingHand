package com.helpinghand.daoImpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.helpinghand.dao.AdminDao;
import com.helpinghand.model.Admin;
import com.helpinghand.model.User;
import com.helpinghand.utils.HibernateUtil;

public class AdminDaoImpl implements AdminDao {

	private SessionFactory SessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public Admin CheckAdmin(String adminName) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		Admin userlogin = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from Admin where adminEmail='" + adminName + "'");
			userlogin = (Admin) query.uniqueResult();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return userlogin;
	}

	@Override
	public boolean AdminLogIn(String adminEmail, String adminPassword) {
		Admin admin = CheckAdmin(adminEmail);
		if (admin != null && admin.getAdminEmail().equals(adminEmail)
				&& admin.getAdminPassword().equals(adminPassword)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Admin getAdminInfo(String adminName) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		Admin admin = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from Admin where adminEmail='" + adminName + "'");
			admin = (Admin) query.uniqueResult();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return admin;
	}

	@Override
	public void updateAdminInfo(Admin updateAdmin) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(updateAdmin);
		transaction.commit();
		session.close();
	}

}
