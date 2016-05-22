package springmvc.model;
import javax.persistence.*;

@Embeddable
public class AdditionalFields {

	String name;
	String type;
	String required;
	
	 
	public AdditionalFields() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}

	public String getRequired() {
		return required;
	}

	public void setRequired(String required) {
		this.required = required;
	}
}
