package springmvc.model;

import java.io.Serializable;

import javax.persistence.*;
@Embeddable
public class Degree implements Serializable {
	
	
	String universityName,degreeEarned,major;
	double timeAttended;
	
	
	public Degree() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public String getUniversityName() {
		return universityName;
	}


	public void setUniversityName(String universityName) {
		this.universityName = universityName;
	}


	public String getDegreeEarned() {
		return degreeEarned;
	}


	public void setDegreeEarned(String degreeEarned) {
		this.degreeEarned = degreeEarned;
	}


	public String getMajor() {
		return major;
	}


	public void setMajor(String major) {
		this.major = major;
	}


	public double getTimeAttended() {
		return timeAttended;
	}


	public void setTimeAttended(double timeAttended) {
		this.timeAttended = timeAttended;
	}
	
	
}