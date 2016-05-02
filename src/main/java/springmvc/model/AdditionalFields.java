package springmvc.model;
import javax.persistence.*;

@Embeddable
public class AdditionalFields {

	String name;
	String type;
	String value;
	boolean required;
	
	 
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

	public boolean isRequired() {
		return required;
	}

	public void setRequired(boolean required) {
		this.required = required;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

		
	
}
