package com.helpinghand.dao;

import java.sql.SQLException;
import java.util.List;

import com.helpinghand.model.ContactInfo;
import com.helpinghand.model.User;

public interface Contactdao {
	
	public void addContact(ContactInfo addContact) throws SQLException;
	
	public List<ContactInfo> getContractinfo();
	
	public void deleteContactInfo(int id);
	
	public ContactInfo getContactInfo(int id);
}
