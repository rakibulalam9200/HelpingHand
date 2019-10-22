package com.helpinghand.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.helpinghand.dao.BookpostDao;
import com.helpinghand.model.BookPost;
import com.helpinghand.model.User;
import com.helpinghand.utils.HibernateUtil;

public class BookpostDaoImpl implements BookpostDao {

	private SessionFactory SessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public void addBookpost(BookPost addbookpost) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(addbookpost);
		transaction.commit();
		session.close();
	}

	@Override
	public List<BookPost> getBookpostList(String email) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<BookPost> list = new ArrayList<BookPost>();
		transaction = session.beginTransaction();
		list = session.createQuery("from BookPost where bookemail='" + email + "'").list();
		transaction.commit();
		session.close();
		return list;
	}

	@Override
	public void deleteBookpost(int id) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Query theQuery = session.createQuery("delete from BookPost where id=:bookpostId");
		theQuery.setParameter("bookpostId", id);
		theQuery.executeUpdate();
		transaction.commit();
		session.close();
	}

	@Override
	public BookPost getBookPost(int id) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		BookPost user = null;
		transaction = session.beginTransaction();
		Query query = session.createQuery("from BookPost where id='" + id + "'");
		user = (BookPost) query.uniqueResult();
		transaction.commit();
		session.close();
		return user;
	}

	@Override
	public void updateBookpostInfo(BookPost manageprofile) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(manageprofile);
		transaction.commit();
		session.close();
	}

	@Override
	public List<BookPost> getBookpostList(int status) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<BookPost> list = new ArrayList<BookPost>();
		transaction = session.beginTransaction();
		list = session.createQuery("from BookPost where userstatus='" + status + "'").list();
		transaction.commit();
		session.close();
		return list;
	}

	@Override
	public List<BookPost> getBookpostListadmin() {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<BookPost> list = new ArrayList<BookPost>();
		transaction = session.beginTransaction();
		list = session.createQuery("from BookPost").list();
		transaction.commit();
		session.close();
		return list;
	}

	@Override
	public List<BookPost> searchBookpost(String location) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<BookPost> list = new ArrayList<BookPost>();
		transaction = session.beginTransaction();
		list = session.createQuery("from BookPost where bookarea='" + location + "'").list();
		transaction.commit();
		session.close();
		return list;
	}

	@Override
	public List<BookPost> searchBookNamepost(String bookname) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<BookPost> list = new ArrayList<BookPost>();
		transaction = session.beginTransaction();
		list = session.createQuery("from BookPost where bookcategory='" + bookname + "'").list();
		transaction.commit();
		session.close();
		return list;
	}
}
