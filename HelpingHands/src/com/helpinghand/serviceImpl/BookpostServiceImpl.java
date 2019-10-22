package com.helpinghand.serviceImpl;

import java.util.List;

import com.helpinghand.dao.BookpostDao;
import com.helpinghand.daoImpl.BookpostDaoImpl;
import com.helpinghand.model.BookPost;
import com.helpinghand.service.BookpostService;

public class BookpostServiceImpl implements BookpostService {

	BookpostDao bookpostdao = new BookpostDaoImpl();

	@Override
	public void addBookpost(BookPost addbookpost) {
		bookpostdao.addBookpost(addbookpost);
	}

	@Override
	public List<BookPost> getBookpostList(String email) {
		return bookpostdao.getBookpostList(email);
	}

	@Override
	public void deleteBookpost(int id) {
		bookpostdao.deleteBookpost(id);
	}

	@Override
	public BookPost getBookPost(int id) {
		return bookpostdao.getBookPost(id);
	}

	@Override
	public void updateBookpostInfo(BookPost manageprofile) {
		bookpostdao.updateBookpostInfo(manageprofile);	
	}

	@Override
	public List<BookPost> getBookpostList(int status) {
		return bookpostdao.getBookpostList(status);
	}

	@Override
	public List<BookPost> getBookpostListadmin() {
		return bookpostdao.getBookpostListadmin();
	}

	@Override
	public List<BookPost> searchBookpost(String location) {
		return bookpostdao.searchBookpost(location);
	}

	@Override
	public List<BookPost> searchBookNamepost(String bookname) {
		return bookpostdao.searchBookNamepost(bookname);
	}


}
