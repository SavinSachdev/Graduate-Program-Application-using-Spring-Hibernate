package springmvc.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;


@Entity
@DiscriminatorValue(value="administrators")

public class Administrator extends GappUsers implements Serializable{
	
	
	
	public Administrator() {
		
	}
	// Manage Department and Users
	@OneToMany(mappedBy="manager")
	 
	List<GappUsers> users;
	
	
	
	@OneToOne
	Department department;
	
	
	public List<GappUsers> getUsers() {
		return users;
	}
	public void setUsers(List<GappUsers> users) {
		this.users = users;
	}
	public Department getDepartments() {
		return department;
	}
	public void setDepartments(Department departments) {
		this.department = departments;
	}
	
	
}
