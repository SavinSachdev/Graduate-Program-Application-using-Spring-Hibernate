package springmvc.web.validator;


import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import springmvc.model.GappUsers;

@Component
public class UserValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return GappUsers.class.isAssignableFrom(clazz);
	}
	@Override
	public void validate(Object target,Errors errors) {
		// TODO Auto-generated method stub
		GappUsers usern=(GappUsers)target;
		if(!StringUtils.hasText(usern.getEmail())){
			errors.rejectValue("email", "error.field.empty");
		}
		if(!StringUtils.hasText(usern.getPassword())){
			errors.rejectValue("password", "error.field.empty");
		}
		
		
	}

}
