package com.helpinghand.dao;

import java.util.List;
import com.helpinghand.model.Messageshopkeeper;

public interface MessageDao {

	public void addMessage(Messageshopkeeper addbookpost);

	public List<Messageshopkeeper> getMessageList(String email);

	public void deleteMessage(int id);


}
