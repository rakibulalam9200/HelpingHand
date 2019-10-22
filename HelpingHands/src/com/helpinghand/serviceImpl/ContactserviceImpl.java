package com.helpinghand.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.helpinghand.dao.Contactdao;
import com.helpinghand.daoImpl.ContactdaoImpl;
import com.helpinghand.model.ContactInfo;
import com.helpinghand.service.Contactservice;

public class ContactserviceImpl  implements Contactservice {
	Contactdao contactdao = new ContactdaoImpl();
	@Override
	public void addContact(ContactInfo addContact) throws SQLException {
		contactdao.addContact(addContact);	
	}
	@Override
	public List<ContactInfo> getContractinfo() {
		// TODO Auto-generated method stub
		return contactdao.getContractinfo();
	}
	@Override
	public void deleteContactInfo(int id) {
		contactdao.deleteContactInfo(id);
		
	}
	@Override
	public ContactInfo getContactInfo(int id) {
		// TODO Auto-generated method stub
		return contactdao.getContactInfo(id);
	}
	

}
