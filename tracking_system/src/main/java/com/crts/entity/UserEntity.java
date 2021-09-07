package com.crts.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_entity")
public class UserEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "User_id")
	private int uId;
	
	@Column(length = 25,name = "Username")
	private String uName;
	
	@Column(length = 25,name = "User_First_Name")
	private String uFName;
	
	@Column(length = 25,name = "User_Last_Name")
	private String uLName;
	
	@Column(length = 25,name = "User_email")
	private String uEmail;
	
	@Column(length = 20,name ="User_Password" )
	private String uPassword;
	
	@Column(name = "Created_Date")
	private Date uCDate;
	
	@Column(length = 25,name = "Created_By")
	private String uCBy;
	
	@Column(name = "Is_User_Active")
	private boolean uIActive;

	
	
	
	
	
	
	
	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuFName() {
		return uFName;
	}

	public void setuFName(String uFName) {
		this.uFName = uFName;
	}

	public String getuLName() {
		return uLName;
	}

	public void setuLName(String uLName) {
		this.uLName = uLName;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public String getuPassword() {
		return uPassword;
	}

	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}

	public Date getuCDate() {
		return uCDate;
	}

	public void setuCDate(Date uCDate) {
		this.uCDate = uCDate;
	}

	public String getuCBy() {
		return uCBy;
	}

	public void setuCBy(String uCBy) {
		this.uCBy = uCBy;
	}

	public boolean isuIActive() {
		return uIActive;
	}

	public void setuIActive(boolean uIActive) {
		this.uIActive = uIActive;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	

}
