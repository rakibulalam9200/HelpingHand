package com.helpinghand.service;

import java.util.List;
import com.helpinghand.model.Messageshopkeeper;

public interface MessageService {
	
	public void addMessage(Messageshopkeeper addbookpost);

	public List<Messageshopkeeper> getMessageList(String email);

	public void deleteMessage(int id);
		
}
