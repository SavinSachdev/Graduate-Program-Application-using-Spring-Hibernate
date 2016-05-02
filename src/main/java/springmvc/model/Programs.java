package springmvc.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Programs implements Serializable{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
@Id
@GeneratedValue
int program_id;
String name;

@ManyToOne(cascade=CascadeType.ALL)
Department department;

@Column(name="id")
@OneToMany(mappedBy="programs",cascade=CascadeType.ALL)
List<Application> applications;


public Programs() {
	super();
	// TODO Auto-generated constructor stub
	}


public int getProgram_id() {
	return program_id;
}


public void setProgram_id(int program_id) {
	this.program_id = program_id;
}


public String getName() {
	return name;
}


public void setName(String name) {
	this.name = name;
}


public Department getDepartment() {
	return department;
}


public void setDepartment(Department department) {
	this.department = department;
}


public List<Application> getApplications() {
	return applications;
}


public void setApplications(List<Application> applications) {
	this.applications = applications;
}




}
