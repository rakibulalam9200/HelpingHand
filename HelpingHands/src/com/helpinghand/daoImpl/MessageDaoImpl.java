package com.helpinghand.daoImpl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.helpinghand.dao.MessageDao;
import com.helpinghand.model.Admin;
import com.helpinghand.model.BookPost;
import com.helpinghand.model.Messageshopkeeper;
import com.helpinghand.utils.HibernateUtil;
import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

public class MessageDaoImpl implements MessageDao {

	private SessionFactory SessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public void addMessage(Messageshopkeeper addbookpost) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(addbookpost);
		transaction.commit();
		session.close();
	}

	@Override
	public List<Messageshopkeeper> getMessageList(String email) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<Messageshopkeeper> list = new ArrayList<Messageshopkeeper>();
		transaction = session.beginTransaction();
		list = session.createQuery("from Messageshopkeeper where postemail='" + email + "'").list();
		transaction.commit();
		session.close();
		return list;
	}

	@Override
	public void deleteMessage(int id) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Query theQuery = session.createQuery("delete from Messageshopkeeper where id=:messageId");
		theQuery.setParameter("messageId", id);
		theQuery.executeUpdate();
		transaction.commit();
		session.close();

	}

	
}
