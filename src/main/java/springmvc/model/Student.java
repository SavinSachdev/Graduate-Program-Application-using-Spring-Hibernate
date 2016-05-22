package springmvc.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@DiscriminatorValue(value="students")

public class Student extends GappUsers implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String CIN,fname;  
	String phone,gender,citizenship;
	Date dob;

	
	@OneToMany(mappedBy="student")
	List<Application> applications;
	public Student() {
		super();
	}
	
	
	public String getCIN() {
		return CIN;
	}
	public void setCIN(String CIN) {
		CIN = CIN;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getCitizenship() {
		return citizenship;
	}
	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}

	public List<Application> getApplications() {
		return applications;
	}
	public void setApplications(List<Application> applications) {
		this.applications = applications;
	}
	}
