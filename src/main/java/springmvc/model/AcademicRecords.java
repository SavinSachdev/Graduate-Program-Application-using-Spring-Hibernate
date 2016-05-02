package springmvc.model;


import java.io.Serializable;


import javax.persistence.*;
@Embeddable
public class AcademicRecords implements Serializable{
 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
double toefl,gpa,gre;
String transcripts;


 
 
public AcademicRecords() {
	
	// TODO Auto-generated constructor stub
}


public double getToefl() {
	return toefl;
}


public void setToefl(double toefl) {
	this.toefl = toefl;
}


public double getGpa() {
	return gpa;
}


public void setGpa(double gpa) {
	this.gpa = gpa;
}


public double getGre() {
	return gre;
}


public void setGre(double gre) {
	this.gre = gre;
}


public String getTranscripts() {
	return transcripts;
}


public void setTranscripts(String transcripts) {
	this.transcripts = transcripts;
}



 
}
