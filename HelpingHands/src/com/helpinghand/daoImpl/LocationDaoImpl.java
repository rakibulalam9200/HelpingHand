package com.helpinghand.daoImpl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.helpinghand.dao.LocationDao;
import com.helpinghand.model.Category;
import com.helpinghand.model.Location;
import com.helpinghand.utils.HibernateUtil;

public class LocationDaoImpl implements LocationDao {

	private SessionFactory SessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public void addLocation(Location addlocation) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(addlocation);
		transaction.commit();
		session.close();

	}

	@Override
	public void deletelocation(int locationId) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Query theQuery = session.createQuery("delete from Location where locationId=:locationId");
		theQuery.setParameter("locationId", locationId);
		theQuery.executeUpdate();
		transaction.commit();
		session.close();

	}

	@Override
	public Location getLocationInfo(String locationId) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		Location location = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from Location where locationId='" + locationId + "'");
			location = (Location) query.uniqueResult();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return location;
	}

	@Override
	public List<Location> getLocationList() {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<Location> list = new ArrayList<Location>();
		transaction = session.beginTransaction();
		list = session.createQuery("from Location").list();
		transaction.commit();
		session.close();
		return list;
	}

	@Override
	public void updatelocation(Location updatelocation) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(updatelocation);
		transaction.commit();
		session.close();

	}

}
