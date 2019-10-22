package com.helpinghand.serviceImpl;

import java.util.List;
import com.helpinghand.dao.MessageDao;
import com.helpinghand.daoImpl.MessageDaoImpl;
import com.helpinghand.model.Messageshopkeeper;
import com.helpinghand.service.MessageService;

public class MessageServiceImpl implements MessageService {

	MessageDao messagedao = new MessageDaoImpl();

	@Override
	public void addMessage(Messageshopkeeper addbookpost) {
		messagedao.addMessage(addbookpost);

	}

	@Override
	public List<Messageshopkeeper> getMessageList(String email) {
		return messagedao.getMessageList(email);
	}

	@Override
	public void deleteMessage(int id) {
		messagedao.deleteMessage(id);

	}



}
