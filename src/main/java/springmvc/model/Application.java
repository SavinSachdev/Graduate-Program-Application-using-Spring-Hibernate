package springmvc.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "applications")
public class Application implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	int application_id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	Programs programs;
	@ElementCollection
	@CollectionTable(name="status",joinColumns=@JoinColumn(name="application_id"))
	List<Status> status;
	
	String term;

	@ManyToOne
	Student student;

	@ElementCollection
	@CollectionTable(name="degrees",joinColumns=@JoinColumn(name="application_id"))
	List<Degree> degrees;
	
	@ElementCollection
	@CollectionTable(name="application_additionalFields",joinColumns=@JoinColumn(name="application_id"))
	List<AdditionalFields> additionalFields;
	

	@ElementCollection
	@CollectionTable(name="academic_records",joinColumns=@JoinColumn(name="application_id"))
	List<AcademicRecords> academicRecords;
	
	
	public Application() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public int getApplication_id() {
		return application_id;
	}

	public void setApplication_id(int application_id) {
		this.application_id = application_id;
	}

	

	
	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public List<Degree> getDegrees() {
		return degrees;
	}

	public void setDegrees(List<Degree> degrees) {
		this.degrees = degrees;
	}

	public List<AcademicRecords> getAcademicRecords() {
		return academicRecords;
	}

	public void setAcademicRecords(List<AcademicRecords> academicRecords) {
		this.academicRecords = academicRecords;
	}


	public Programs getPrograms() {
		return programs;
	}


	public void setPrograms(Programs programs) {
		this.programs = programs;
	}


	public List<Status> getStatus() {
		return status;
	}


	public void setStatus(List<Status> status) {
		this.status = status;
	}


	public List<AdditionalFields> getAdditionalFields() {
		return additionalFields;
	}


	public void setAdditionalFields(List<AdditionalFields> additionalFields) {
		this.additionalFields = additionalFields;
	}

	
	
	

	}