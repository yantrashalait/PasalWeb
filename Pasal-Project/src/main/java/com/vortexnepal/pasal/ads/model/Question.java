package com.vortexnepal.pasal.ads.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.vortexnepal.pasal.model.Customer;

@Entity
@Table(name="tbl_questions")
public class Question {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int questionId;
	private String questionComment;
	
	@ManyToOne
	@JoinColumn(name = "main_ads_id")
	private MainAds mainAds;
	
	@ManyToOne
	@JoinColumn(name = "asked_to")
	private Customer askedTo;
	
	@ManyToOne
	@JoinColumn(name = "asked_by")
	private Customer askedBy;
	
	@Temporal(TemporalType.DATE)
	private Date askedOn;
	
	@OneToOne(mappedBy = "question")
	private Reply reply;
	
	public Question() {
		// TODO Auto-generated constructor stub
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getQuestionComment() {
		return questionComment;
	}

	public void setQuestionComment(String questionComment) {
		this.questionComment = questionComment;
	}
	
	public MainAds getMainAds() {
		return mainAds;
	}

	public void setMainAds(MainAds mainAds) {
		this.mainAds = mainAds;
	}
	
	public Customer getAskedTo() {
		return askedTo;
	}

	public void setAskedTo(Customer askedTo) {
		this.askedTo = askedTo;
	}
	
	public Customer getAskedBy() {
		return askedBy;
	}

	public void setAskedBy(Customer askedBy) {
		this.askedBy = askedBy;
	}

	public Date getAskedOn() {
		return askedOn;
	}

	public void setAskedOn(Date askedOn) {
		this.askedOn = askedOn;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}
	
}
