package springmvc.model;

import java.util.List;

import javax.persistence.*;

@Entity
public class Programs {
@Id
@GeneratedValue
int program_id;
String name;

@ManyToOne
Department department;

@Column(name="id")
@OneToMany(mappedBy="programs")
List<Application> applications;


public Programs() {
	super();
	// TODO Auto-generated constructor stub
	}



public int getProgram_Id() {
	return program_id;
}

public void setId(int program_id) {
	this.program_id = program_id;
}

public String getprogram() {
	return name;
}

public void setprogram(String name) {
	this.name = name;
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



}
