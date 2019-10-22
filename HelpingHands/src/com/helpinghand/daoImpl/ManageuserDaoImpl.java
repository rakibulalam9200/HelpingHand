package com.helpinghand.daoImpl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.helpinghand.dao.ManageuserDao;
import com.helpinghand.model.BookPost;
import com.helpinghand.model.Category;
import com.helpinghand.model.User;
import com.helpinghand.utils.HibernateUtil;

public class ManageuserDaoImpl implements ManageuserDao {

	private SessionFactory SessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public void addUser(User add) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(add);
		transaction.commit();
		session.close();
	}

	@Override
	public void deleteUser(String id) {
		// TODO Auto-generated method stub

	}

	@Override
	public User checkUser(String username) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		User userlogin = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from User where useremail='" + username + "'");
			userlogin = (User) query.uniqueResult();
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
	public void updateUser(User update) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(update);
		transaction.commit();
		session.close();

	}

	@Override
	public User getUserInfo(String username) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		User user = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from User where useremail='" + username + "'");
			user = (User) query.uniqueResult();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return user;
	}

	@Override
	public List<User> getuserList() {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<User> list = new ArrayList<User>();
		transaction = session.beginTransaction();
		list = session.createQuery("from User").list();
		transaction.commit();
		session.close();
		return list;
	}

	@Override
	public User checkLogIn(String email) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		User user = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from User where useremail='" + email + "'");
			user = (User) query.uniqueResult();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return user;
	}

	@Override
	public int totalUser() {

		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		int value = 0;
		try {
			transaction = session.beginTransaction();
			List<User> theStudents = session.createQuery("from User").getResultList();
			for (User emp : theStudents) {
				int rs = emp.getUserId();
				value += 1;
			}
			transaction.commit();

		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return value;
	}

	@Override
	public User namequerylogin(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUserpassword(User updatepass) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session
					.createQuery("UPDATE User set userpassword = :userpassword " + "WHERE useremail = :useremail");
			query.setParameter("userpassword", updatepass.getUserPassword());
			query.setParameter("useremail", updatepass.getUserEmail());
			query.executeUpdate();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	@Override
	public boolean logIn(String email, String password) {
		User user = checkUser(email);
		if (user != null && user.getUserEmail().equals(email) && user.getUserPassword().equals(password)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<User> getuserwithList(String username) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<User> list = new ArrayList<User>();
		transaction = session.beginTransaction();
		list = session.createQuery("from User where useremail='" + username + "'").list();
		transaction.commit();
		session.close();
		return list;
	}

	@Override
	public void deleteUserInfo(int id) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Query theQuery = session.createQuery("delete from User where userid=:userInfo");
		theQuery.setParameter("userInfo", id);
		theQuery.executeUpdate();
		transaction.commit();
		session.close();

	}

}
