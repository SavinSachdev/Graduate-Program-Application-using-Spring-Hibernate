package springmvc.model;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="user_role")
@Table(name="users")
public class GappUsers implements Serializable{
	
	@Id
	@GeneratedValue
	int user_id;
	@Column(columnDefinition = "boolean default true")
	boolean enabled=true;
	@Column(unique=true)
	String email;
	
	
	String fname,lname,password;



	

	public Administrator getManager() {
		return manager;
	}



	public void setManager(Administrator manager) {
		this.manager = manager;
	}

	@ManyToOne
	Administrator manager;
	
	
	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Administrator getAdministrator() {
		return manager;
	}

	public void setAdministrator(Administrator administrator) {
		this.manager = administrator;
	}



	public boolean isEnabled() {
		return enabled;
	}



	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	
	

}
