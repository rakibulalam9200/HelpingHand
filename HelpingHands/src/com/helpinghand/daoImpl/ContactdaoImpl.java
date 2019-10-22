package com.helpinghand.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.helpinghand.dao.Contactdao;
import com.helpinghand.model.BookPost;
import com.helpinghand.model.ContactInfo;
import com.helpinghand.model.User;
import com.helpinghand.utils.HibernateUtil;

public class ContactdaoImpl implements Contactdao {

	private SessionFactory SessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public void addContact(ContactInfo addContact) throws SQLException {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(addContact);
		transaction.commit();
		session.close();
	}

	@Override
	public List<ContactInfo> getContractinfo() {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<ContactInfo> list = new ArrayList<ContactInfo>();
		transaction = session.beginTransaction();
		list = session.createQuery("from ContactInfo").list();
		transaction.commit();
		session.close();
		return list;
	}

	@Override
	public void deleteContactInfo(int id) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Query theQuery = session.createQuery("delete from ContactInfo where id=:contactId");
		theQuery.setParameter("contactId", id);
		theQuery.executeUpdate();
		transaction.commit();
		session.close();

	}

	@Override
	public ContactInfo getContactInfo(int id) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		ContactInfo contactInfo = null;
		transaction = session.beginTransaction();
		Query query = session.createQuery("from ContactInfo where id='" + id + "'");
		contactInfo = (ContactInfo) query.uniqueResult();
		transaction.commit();
		session.close();
		return contactInfo;
	}

}
