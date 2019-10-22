package com.helpinghand.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.helpinghand.dao.MatrialpostDao;
import com.helpinghand.model.MaterialPost;
import com.helpinghand.utils.HibernateUtil;

public class MatrialpostDaoImpl implements MatrialpostDao {

	private SessionFactory SessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public void addMaterialpost(MaterialPost addmatrialpost) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(addmatrialpost);
		transaction.commit();
		session.close();
	}

	@Override
	public List<MaterialPost> getMaterialpostList(String email) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<MaterialPost> list = new ArrayList<MaterialPost>();
		transaction = session.beginTransaction();
		list = session.createQuery("from MaterialPost where matrialemail='" + email + "'").list();
		transaction.commit();
		session.close();
		return list;
	}

	@Override
	public void deleteMateralpost(int id) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Query theQuery = session.createQuery("delete from MaterialPost where id=:matrialId");
		theQuery.setParameter("matrialId", id);
		theQuery.executeUpdate();
		transaction.commit();
		session.close();
	}

	@Override
	public MaterialPost getMaterialPost(int id) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		MaterialPost materialpost = null;
		transaction = session.beginTransaction();
		Query query = session.createQuery("from MaterialPost where id='" + id + "'");
		materialpost = (MaterialPost) query.uniqueResult();
		transaction.commit();
		session.close();
		return materialpost;
	}

	@Override
	public void updateMaterialpostInfo(MaterialPost updatematerialInfo) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(updatematerialInfo);
		transaction.commit();
		session.close();
	}

	@Override
	public List<MaterialPost> getMatrialpostList(int status) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<MaterialPost> list = new ArrayList<MaterialPost>();
		transaction = session.beginTransaction();
		list = session.createQuery("from MaterialPost where userstatus='" + status + "'").list();
		transaction.commit();
		session.close();
		return list;
	}

	@Override
	public List<MaterialPost> getMatrialpostListadmin() {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<MaterialPost> list = new ArrayList<MaterialPost>();
		transaction = session.beginTransaction();
		list = session.createQuery("from MaterialPost").list();
		transaction.commit();
		session.close();
		return list;
	}

	@Override
	public List<MaterialPost> searchMaterialpost(String location) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<MaterialPost> list = new ArrayList<MaterialPost>();
		transaction = session.beginTransaction();
		list = session.createQuery("from MaterialPost where matrialarea='" + location + "'").list();
		transaction.commit();
		session.close();
		return list;
	}

	@Override
	public List<MaterialPost> searchMaterialNamepost(String matrialname) {
		Session session = this.SessionFactory.openSession();
		Transaction transaction = null;
		List<MaterialPost> list = new ArrayList<MaterialPost>();
		transaction = session.beginTransaction();
		list = session.createQuery("from MaterialPost where matrialcategory"
				+ "='" + matrialname + "'").list();
		transaction.commit();
		session.close();
		return list;
	}

}
