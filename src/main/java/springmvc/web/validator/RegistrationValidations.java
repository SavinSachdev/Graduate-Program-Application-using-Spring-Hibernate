package springmvc.web.validator;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import springmvc.model.GappUsers;
import springmvc.model.Student;
@Component
public class RegistrationValidations implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return GappUsers.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		Student user=(Student) target;
		if(!StringUtils.hasText(user.getFname())){
			errors.rejectValue("fname", "error.field.empty");
		}
		if(!StringUtils.hasText(user.getLname())){
			errors.rejectValue("lname", "error.field.empty");
		}
		if(!StringUtils.hasText(user.getEmail())){
			errors.rejectValue("email", "error.field.empty");
		}
		if(!StringUtils.hasText(user.getPassword())){
			errors.rejectValue("password", "error.field.empty");
		}
		
	}

}
