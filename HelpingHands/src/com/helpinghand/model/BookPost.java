package com.helpinghand.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bookpost")
public class BookPost {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int bookId;

	@Column(name = "bookemail")
	private String bookEmail;

	@Column(name = "bookarea")
	private String bookArea;

	@Column(name = "bookname")
	private String bookName;

	@Column(name = "bookauthor")
	private String bookAuthername;

	@Column(name = "bookpublisher")
	private String bookPublishername;

	@Column(name = "bookcategory")
	private String bookCategory;

	@Column(name = "bookcondition")
	private String bookCondition;

	@Column(name = "bookdes")
	private String bookDescription;

	@Column(name = "bookphone")
	private String bookContactnumber;

	@Column(name = "bookexchangeoption")
	private String bookExchangeoption;

	@Column(name = "bookimg")
	private String bookImg;

	@Column(name = "exchangebookName")
	private String exchangebookName;

	@Column(name = "exchangebookAuthername")
	private String exchangebookAuthername;

	@Column(name = "exchangebookPublishername")
	private String exchangebookPublishername;

	@Column(name = "exchangebookCategory")
	private String exchangebookCategory;

	@Column(name = "exchangebookCondition")
	private String exchangebookCondition;

	@Column(name = "sellingprice")
	private String sellingprice;
	
	@Column(name = "userstatus")
	private boolean userstatus;

	@Column(name = "bookdate")
	private String bookDate;

	public BookPost() {

	}

	public BookPost(int bookId, String bookEmail, String bookArea, String bookName, String bookAuthername,
			String bookPublishername, String bookCategory, String bookCondition, String bookDescription,
			String bookContactnumber, String bookExchangeoption, String bookImg, String exchangebookName,
			String exchangebookAuthername, String exchangebookPublishername, String exchangebookCategory,
			String exchangebookCondition, String sellingprice, boolean userstatus, String bookDate) {
		super();
		this.bookId = bookId;
		this.bookEmail = bookEmail;
		this.bookArea = bookArea;
		this.bookName = bookName;
		this.bookAuthername = bookAuthername;
		this.bookPublishername = bookPublishername;
		this.bookCategory = bookCategory;
		this.bookCondition = bookCondition;
		this.bookDescription = bookDescription;
		this.bookContactnumber = bookContactnumber;
		this.bookExchangeoption = bookExchangeoption;
		this.bookImg = bookImg;
		this.exchangebookName = exchangebookName;
		this.exchangebookAuthername = exchangebookAuthername;
		this.exchangebookPublishername = exchangebookPublishername;
		this.exchangebookCategory = exchangebookCategory;
		this.exchangebookCondition = exchangebookCondition;
		this.sellingprice = sellingprice;
		this.userstatus = userstatus;
		this.bookDate = bookDate;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getBookEmail() {
		return bookEmail;
	}

	public void setBookEmail(String bookEmail) {
		this.bookEmail = bookEmail;
	}

	public String getBookArea() {
		return bookArea;
	}

	public void setBookArea(String bookArea) {
		this.bookArea = bookArea;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookAuthername() {
		return bookAuthername;
	}

	public void setBookAuthername(String bookAuthername) {
		this.bookAuthername = bookAuthername;
	}

	public String getBookPublishername() {
		return bookPublishername;
	}

	public void setBookPublishername(String bookPublishername) {
		this.bookPublishername = bookPublishername;
	}

	public String getBookCategory() {
		return bookCategory;
	}

	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}

	public String getBookCondition() {
		return bookCondition;
	}

	public void setBookCondition(String bookCondition) {
		this.bookCondition = bookCondition;
	}

	public String getBookDescription() {
		return bookDescription;
	}

	public void setBookDescription(String bookDescription) {
		this.bookDescription = bookDescription;
	}

	public String getBookContactnumber() {
		return bookContactnumber;
	}

	public void setBookContactnumber(String bookContactnumber) {
		this.bookContactnumber = bookContactnumber;
	}

	public String getBookExchangeoption() {
		return bookExchangeoption;
	}

	public void setBookExchangeoption(String bookExchangeoption) {
		this.bookExchangeoption = bookExchangeoption;
	}

	public String getBookImg() {
		return bookImg;
	}

	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
	}

	public String getExchangebookName() {
		return exchangebookName;
	}

	public void setExchangebookName(String exchangebookName) {
		this.exchangebookName = exchangebookName;
	}

	public String getExchangebookAuthername() {
		return exchangebookAuthername;
	}

	public void setExchangebookAuthername(String exchangebookAuthername) {
		this.exchangebookAuthername = exchangebookAuthername;
	}

	public String getExchangebookPublishername() {
		return exchangebookPublishername;
	}

	public void setExchangebookPublishername(String exchangebookPublishername) {
		this.exchangebookPublishername = exchangebookPublishername;
	}

	public String getExchangebookCategory() {
		return exchangebookCategory;
	}

	public void setExchangebookCategory(String exchangebookCategory) {
		this.exchangebookCategory = exchangebookCategory;
	}

	public String getExchangebookCondition() {
		return exchangebookCondition;
	}

	public void setExchangebookCondition(String exchangebookCondition) {
		this.exchangebookCondition = exchangebookCondition;
	}

	public String getSellingprice() {
		return sellingprice;
	}

	public void setSellingprice(String sellingprice) {
		this.sellingprice = sellingprice;
	}

	public boolean isUserstatus() {
		return userstatus;
	}

	public void setUserstatus(boolean userstatus) {
		this.userstatus = userstatus;
	}

	public String getBookDate() {
		return bookDate;
	}

	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}

	

}
