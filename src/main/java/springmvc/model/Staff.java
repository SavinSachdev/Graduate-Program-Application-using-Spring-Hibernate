package springmvc.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;



@Entity
@DiscriminatorValue(value="staff")





public class Staff extends GappUsers implements Serializable{
	//can review and update applications
	
	public Staff() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
	
}
