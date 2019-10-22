package com.helpinghand.service;

import java.util.List;

import com.helpinghand.model.BookPost;

public interface BookpostService {

	public void addBookpost(BookPost addbookpost);

	public List<BookPost> getBookpostList(String email);

	public void deleteBookpost(int id);

	public BookPost getBookPost(int id);

	public void updateBookpostInfo(BookPost manageprofile);

	public List<BookPost> getBookpostList(int status);

	public List<BookPost> getBookpostListadmin();

	public List<BookPost> searchBookpost(String location);
	
	  public List<BookPost> searchBookNamepost(String bookname);

}
