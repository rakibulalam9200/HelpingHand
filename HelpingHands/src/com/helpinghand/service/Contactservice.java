package com.helpinghand.service;

import java.sql.SQLException;
import java.util.List;

import com.helpinghand.model.ContactInfo;

public interface Contactservice {

	public void addContact(ContactInfo addContact) throws SQLException;
	
	public List<ContactInfo> getContractinfo();
	
	public void deleteContactInfo(int id);
	
	public ContactInfo getContactInfo(int id);
}
