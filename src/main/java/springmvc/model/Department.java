package springmvc.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;
@Entity
@Table(name="departments")
public class Department implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	int dept_id;
	
	@OneToOne(mappedBy="department")
	Administrator administrator;
	
	
	String name;
	
	
	
	@OneToMany(cascade={CascadeType.ALL}, mappedBy="department" )
	List<Programs> programs;
	
	@ElementCollection()
	@CollectionTable(name="additional_fields",joinColumns=@JoinColumn(name="department_id"))
	List<AdditionalFields> additionalFields;
	
	
		public Department() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getDept_id() {
		return dept_id;
	}


	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}


	public Administrator getAdministrator() {
		return administrator;
	}


	public void setAdministrator(Administrator administrator) {
		this.administrator = administrator;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public List<Programs> getPrograms() {
		return programs;
	}


	public void setPrograms(List<Programs> programs) {
		this.programs = programs;
	}


	public List<AdditionalFields> getAdditionalFields() {
		return additionalFields;
	}


	public void setAdditionalFields(List<AdditionalFields> additionalFields) {
		this.additionalFields = additionalFields;
	}
	
}
