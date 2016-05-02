package springmvc.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
@Entity
public class StudentDetail implements Serializable{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
@Id
@GeneratedValue
Integer id;
@OneToOne(mappedBy="studentDetails")
Application application;
String fname,lname,dob,gender,citizenship,contact,email;

public String getFname() {
	return fname;
}

public void setFname(String fname) {
	this.fname = fname;
}

public String getLname() {
	return lname;
}

public void setLname(String lname) {
	this.lname = lname;
}

public String getDob() {
	return dob;
}

public void setDob(String dob) {
	this.dob = dob;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}

public String getCitizenship() {
	return citizenship;
}

public void setCitizenship(String citizenship) {
	this.citizenship = citizenship;
}

public String getContact() {
	return contact;
}

public void setContact(String contact) {
	this.contact = contact;
}

public Integer getId() {
	return id;
}

public void setId(Integer id) {
	this.id = id;
}

public Application getApplication() {
	return application;
}

public void setApplication(Application application) {
	this.application = application;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}
	
	
}
	