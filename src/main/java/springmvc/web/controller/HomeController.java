package springmvc.web.controller;


import java.util.List;

import javax.persistence.DiscriminatorValue;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import springmvc.model.AdditionalFields;
import springmvc.model.Department;
import springmvc.model.GappUsers;
import springmvc.model.Programs;
import springmvc.model.Student;

import springmvc.model.dao.DepartmentsDao;
import springmvc.model.dao.GappUsersDao;
import springmvc.model.dao.ProgramsDao;
import springmvc.web.validator.RegistrationValidations;
import springmvc.web.validator.UserValidator;


@Controller
@SessionAttributes({"department","user"})
public class HomeController {

	@Autowired
	DepartmentsDao departmentsdao;
	@Autowired
	GappUsersDao usersdao;
	@Autowired
	ProgramsDao programsdao;
	@Autowired
	RegistrationValidations rgValidator;
	@Autowired
	UserValidator userValidator;
	
   
	@RequestMapping(value="/register.html",method=RequestMethod.GET)
    public String studentRegistration(ModelMap models){
    	models.put("student", new Student());
    	return "StudentRegistration";
    }
    
    @RequestMapping(value="/register.html",method=RequestMethod.POST)
    public String studentRegistration(@ModelAttribute Student student,BindingResult result,ModelMap models){
    rgValidator.validate(student, result);
    if(result.hasErrors()){
    	return "StudentRegistration";
    }
    List<GappUsers> allUsers= usersdao.getUsers();
    String email=student.getEmail().toLowerCase();
    for(GappUsers user:allUsers){
    	if(user.getEmail().toLowerCase().equals(email)){
    		models.put("emailUsed","emailUsed");
    		return "StudentRegistration";
    	}
    }
    usersdao.saveUser(student);
    	return "redirect:login.html";
    }
    
    @RequestMapping(value={"/login.html"},method=RequestMethod.GET)
    public String login(ModelMap models){
    	models.put("user", new GappUsers());
    	return "login";
    }
    
    @RequestMapping(value="/login.html",method=RequestMethod.POST)
    public String login(@ModelAttribute GappUsers user, ModelMap models,BindingResult result,HttpSession session){
    	
    	userValidator.validate(user,result);
    	if(result.hasErrors()){
    		return "login";
    	}
    	GappUsers currentUser;
    	try{
        if(usersdao.getUserByEmailandPassword(user.getEmail(), user.getPassword())!=null){
        		currentUser=usersdao.getUserByEmailandPassword(user.getEmail(), user.getPassword());
        		String usertype=currentUser.getClass().getAnnotation(DiscriminatorValue.class).value();
        		session.setAttribute("currentUser",currentUser);
        		return "redirect:users/"+usertype+".html";
        }}catch(Exception e){
        	models.put("invalid","invalid");
        	return "login";	
        }
    	return "redirect:login.html";
        }
    
    @RequestMapping(value="/users/students.html")
    public String studentView(){
    	return "users/students";
    	
    }
    
    @RequestMapping(value="/users/staff.html")
    public String staffView(){
    	return "users/staff";
    	
    }
    
    @RequestMapping(value="/logout.html")
    public String logout(HttpSession session){
    	System.out.println(session.getId());
    	session.invalidate();
    	return "redirect:login.html";
    }
        
    	@RequestMapping(value="/users/administrators.html")
    	String viewAdministrators(ModelMap models,HttpSession session){
    		session.setAttribute("departments", departmentsdao.getDepartments());
    		return "users/administrators";
    	}
    
    	
    
  
    
    
   
    
    @RequestMapping(value="departments/addDepartment.html",method=RequestMethod.GET)
    public String addDepartment(ModelMap models){
    		models.put("department", new Department());
    		return "departments/addDepartments";
    }
    
    @RequestMapping(value="departments/addDepartment.html",method=RequestMethod.POST)
    public String addDepartment( @ModelAttribute Department department,HttpSession session){
    	List<Programs> programs=department.getPrograms();
    	for(Programs program:programs){
    		program.setDepartment(department);
    	}
    	
    	departmentsdao.addDepartment(department);
    	session.setAttribute("departments",department);
    	return "redirect:/users/administrators.html";
    }
    
  
    
    @RequestMapping(value="/departments/{id}.html")
    public String viewDepartment(@PathVariable Integer id,ModelMap models){
    	Department department=departmentsdao.getDepartmentById(id);
    	models.put("department", department);
    	return "viewDepartment";
    }
    
    @RequestMapping(value="/edit/{id}.html",method=RequestMethod.GET)
    public String editDepartment(@PathVariable Integer id,ModelMap models){
    	//Get All values By Depaartment Id
    	Department department=departmentsdao.getDepartmentById(id);
    	models.put("department",department);
    	return "departments/editDepartment";
    }
    
    @RequestMapping(value="/edit/{id}.html",method=RequestMethod.POST)
    public String editDepartment(@PathVariable Integer id,@ModelAttribute Department department,HttpSession session,SessionStatus status){
    	
    	for(Programs program:department.getPrograms()){
    		program.setDepartment(department);
    	}
    	
    	departmentsdao.addDepartment(department);
    	status.setComplete();
    	session.setAttribute("departments",departmentsdao.getDepartments());
    	
    	return "redirect:../users/administrators.html";
    }
    
    
    @RequestMapping(value={"/administrators.html","users/again.html"})
    	String adminHome(){
    		return "administrators";
    	}
    
    @RequestMapping(value="edit/removeDepartment/{id}.html")
    String removeDepartment(@PathVariable Integer id){
    	System.out.println("trying to Remove");
    	Department department=departmentsdao.getDepartmentById(id);
    	departmentsdao.removeDepartment(department);
    	return "redirect:../../users/administrators.html";
    }
    
    @RequestMapping(value="edit/removeAdditionalFields/{dept_id}/{id}.html")
    String removeAdditionalFields(@PathVariable int dept_id,@PathVariable int id){
    	Department department=departmentsdao.getDepartmentById(dept_id);
    	AdditionalFields af=department.getAdditionalFields().remove(id);
    	departmentsdao.addDepartment(department);
    	return "redirect:/edit/"+dept_id+".html";
    	
    }
    
   
    
    @RequestMapping(value="edit/removeProgram/{dept_id}/{id}.html")
    String removePrograms( @PathVariable int dept_id,@PathVariable int id,HttpSession session){
    	//get fields from session and delete
    	Department department=departmentsdao.getDepartmentById(dept_id);
    	Programs af=department.getPrograms().remove(id);
    	programsdao.removePrograms(af);
    	departmentsdao.addDepartment(department);
    	session.setAttribute("departments",departmentsdao.getDepartments());
    	return "redirect:/users/administrators.html";
    	}
    	
    
   
   
    
  
}

