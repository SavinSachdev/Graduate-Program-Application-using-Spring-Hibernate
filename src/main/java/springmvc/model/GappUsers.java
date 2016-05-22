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
	
	@ManyToOne
	Administrator manager;
	String Lname,Fname,Email,Password;
	
	
	public GappUsers() {
		
	}

	

	public String getLname() {
		return Lname;
	}

	public void setLname(String lname) {
		Lname = lname;
	}

	public String getFname() {
		return Fname;
	}

	public void setFname(String fname) {
		Fname = fname;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
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

	
	

}
