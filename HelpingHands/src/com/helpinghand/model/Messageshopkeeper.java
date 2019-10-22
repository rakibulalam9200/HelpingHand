package com.helpinghand.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "message")
public class Messageshopkeeper {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int Id;

	@Column(name = "postid")
	private int postId;

	@Column(name = "postemail")
	private String postemail;

	@Column(name = "senderemail")
	private String toemail;

	@Column(name = "comment")
	private String comment;

	@Column(name = "status")
	private int status;

	@Column(name = "date")
	private Date date;

	public Messageshopkeeper() {
	}

	public Messageshopkeeper(int id, int postId, String postemail, String toemail, String comment, int status,
			Date date) {
		super();
		Id = id;
		this.postId = postId;
		this.postemail = postemail;
		this.toemail = toemail;
		this.comment = comment;
		this.status = status;
		this.date = date;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getPostemail() {
		return postemail;
	}

	public void setPostemail(String postemail) {
		this.postemail = postemail;
	}

	public String getToemail() {
		return toemail;
	}

	public void setToemail(String toemail) {
		this.toemail = toemail;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
