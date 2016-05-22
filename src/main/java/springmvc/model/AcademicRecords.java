package springmvc.model;

import java.io.File;
import java.io.Serializable;
import java.util.List;

import javax.persistence.*;
@Embeddable
public class AcademicRecords implements Serializable{
 double toefl,gpa,gre;


File transcripts;
 
 
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


public File getTranscripts() {
	return transcripts;
}


public void setTranscripts(File transcripts) {
	this.transcripts = transcripts;
}

 
}
