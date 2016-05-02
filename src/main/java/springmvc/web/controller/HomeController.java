package springmvc.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.persistence.DiscriminatorValue;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;
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
import org.springframework.web.multipart.MultipartFile;
import springmvc.model.AcademicRecords;
import springmvc.model.AdditionalFields;
import springmvc.model.Application;
import springmvc.model.Degree;
import springmvc.model.Department;
import springmvc.model.GappUsers;
import springmvc.model.Programs;
import springmvc.model.Status;
import springmvc.model.Student;
import springmvc.model.dao.ApplicationsDao;
import springmvc.model.dao.DepartmentsDao;
import springmvc.model.dao.GappUsersDao;
import springmvc.model.dao.ProgramsDao;
import springmvc.web.validator.RegistrationValidations;
import springmvc.web.validator.UserValidator;

@Controller
@SessionAttributes(value =  {"department","application"} )
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
	@Autowired
	ApplicationsDao applicationsdao;
	@Autowired
	private ServletContext context;

	@RequestMapping(value = "/register.html", method = RequestMethod.GET)
	public String studentRegistration(ModelMap models) {
		models.put("student", new Student());
		return "StudentRegistration";
	}

	@RequestMapping(value = "/register.html", method = RequestMethod.POST)
	public String studentRegistration(@ModelAttribute Student student,
			BindingResult result, ModelMap models, SessionStatus status) {
		rgValidator.validate(student, result);
		if (result.hasErrors()) {
			return "StudentRegistration";
		}
		List<GappUsers> allUsers = usersdao.getUsers();
		String email = student.getEmail().toLowerCase();
		for (GappUsers user : allUsers) {
			if (user.getEmail().toLowerCase().equals(email)) {
				models.put("emailUsed", "emailUsed");
				return "StudentRegistration";
			}
		}
		usersdao.saveUser(student);
		status.setComplete();
		return "redirect:login.html";
	}

	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public String login(ModelMap models) {
		models.put("user", new GappUsers());
		return "login";
	}

	@RequestMapping(value = "/login.html", method = RequestMethod.POST)
	public String login(@ModelAttribute GappUsers user, ModelMap models,
			BindingResult result, HttpSession session) {

		userValidator.validate(user, result);
		if (result.hasErrors()) {
			return "login";
		}
		GappUsers currentUser;
		try {
			if (usersdao.getUserByEmailandPassword(user.getEmail(),
					user.getPassword()) != null) {
				currentUser = usersdao.getUserByEmailandPassword(
						user.getEmail(), user.getPassword());
				String usertype = currentUser.getClass()
						.getAnnotation(DiscriminatorValue.class).value();
				session.setAttribute("currentUser", currentUser);
				return "redirect:" + usertype + ".html";
			}
		} catch (Exception e) {
			models.put("invalid", "invalid");
			return "login";
		}
		return "redirect:login.html";
	}

	@RequestMapping(value = "/logout.html")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.html";
	}

	@RequestMapping(value = "/students.html")
	public String studentView(ModelMap models, HttpSession session) {
		GappUsers student = (GappUsers) session.getAttribute("currentUser");

		String studentEmail = student.getEmail();
		models.put("studentApplications",
				applicationsdao.getApplicationByStudentsEmail(studentEmail));
		return "users/students";

	}

	@RequestMapping(value = "/staff.html")
	public String staffView() {
		return "users/staff";

	}

	@RequestMapping(value = "/administrators.html")
	String viewAdministrators(ModelMap models) {
		models.put("departments", departmentsdao.getDepartments());
		return "users/administrators";
	}

	@RequestMapping(value = "/addDepartment.html", method = RequestMethod.GET)
	public String addDepartment(ModelMap models) {
		models.put("newdepartment", new Department());
		return "departments/addDepartments";
	}

	@RequestMapping(value = "/addDepartment.html", method = RequestMethod.POST)
	public String addDepartment(@ModelAttribute Department newdepartment,ModelMap models
		) {
		
		List<Programs> programs = newdepartment.getPrograms();
		for (Programs program : programs) {
			program.setDepartment(newdepartment);
		}
		
		departmentsdao.addDepartment(newdepartment);
		System.out.println("Department Saved");
		models.put("departments", departmentsdao.getDepartments());
		return "users/administrators";
	}

	@RequestMapping(value = "/departments/{id}.html")
	public String viewDepartment(@PathVariable Integer id, ModelMap models) {
		Department department = departmentsdao.getDepartmentById(id);
		models.put("department", department);
		return "viewDepartment";
	}

	@RequestMapping(value = { "/edit/{id}.html", "/editget/{id}.html" }, method = RequestMethod.GET)
	public String editDepartment(@PathVariable Integer id, ModelMap models) {
		// fetch the department by id and put it into model attribute and
		// session also
		Department departmentToEdit = departmentsdao.getDepartmentById(id);
		models.put("department", departmentToEdit);

		return "departments/editDepartment";
	}

	@RequestMapping(value = "/edit/{id}.html", method = RequestMethod.POST)
	public String editDepartment(@PathVariable Integer id,
			@ModelAttribute Department department, HttpSession session) {
		
		List<Programs> programsList=department.getPrograms();
		
		for (Programs program : programsList) {
			System.out.println(program.getName());
			program.setDepartment(department);
			//program.setDepartment(department);
		}
		
		// Fetching multiple additional fields values
		
		departmentsdao.addDepartment(department);
		//session.setAttribute("departments", departmentsdao.getDepartments());
		
		return "redirect:/administrators.html";
	}

	@RequestMapping(value = "edit/removeDepartment/{id}.html")
	String removeDepartment(@PathVariable Integer id) {

		Department department = departmentsdao.getDepartmentById(id);
		
		departmentsdao.removeDepartment(department);
		return "redirect:/administrators.html";
	}

	@RequestMapping(value = "edit/removeAdditionalFields/{dept_id}/{id}.html")
	String removeAdditionalFields(@PathVariable int dept_id,
			@PathVariable int id) {
		Department department = departmentsdao.getDepartmentById(dept_id);
		AdditionalFields af = department.getAdditionalFields().remove(id);
		departmentsdao.addDepartment(department);
		return "redirect:/edit/{dept_id}.html";

	}

	@RequestMapping(value = "/removeDegree.html")
	String removeDegree(@RequestParam int appid,
			@RequestParam int id,HttpServletResponse response) throws IOException {
		Application app=applicationsdao.getApplicationById(appid);
		
		List<Degree> degreesList=app.getDegrees();
		degreesList.remove(id);
		app.setDegrees(degreesList);
		response.getWriter().write("Successfully Deleted");
		applicationsdao.saveApplication(app);
		return null;
	}

	
	@RequestMapping(value = "edit/removeProgram/{dept_id}/{index}.html")
	String removeProgram(@ModelAttribute Department department,
			@PathVariable int dept_id, @PathVariable int index, ModelMap models) {
		// Make list of additional fields and set to this department

		Department dept = departmentsdao.getDepartmentById(dept_id);
		List<AdditionalFields> af = department.getAdditionalFields();

		dept.setAdditionalFields(af);
		Programs prog = dept.getPrograms().remove(index);
		programsdao.removePrograms(prog);
		departmentsdao.addDepartment(dept);
		models.put("department", dept);

		return "redirect:/administrators.html";
	}

	@RequestMapping(value = "viewApplication.html")
	String viewApplication(@RequestParam int id, ModelMap models,
			HttpSession session) {
		// File downloading part is Remaining
		Application appToView = applicationsdao.getApplicationById(id);
		System.out.println(appToView.getApplication_id() + " "
				+ appToView.getTerm());
		List<Status> statusList = appToView.getStatus();
		Status lastStatus = statusList.get(statusList.size() - 1);
		Department deptName = appToView.getPrograms().getDepartment();
		if (lastStatus.getStatus().equals("Not Submitted")) {
			// let the user edit the applications and Submit it
			models.put("application", appToView);
			models.put("edit", "edit");
			models.put("departmentPrograms", deptName.getPrograms());
			return "application/newApplication";
		}
		models.put("viewApplication", applicationsdao.getApplicationById(id));
		return "application/viewApplication";
	}

	@RequestMapping(value = "/newApplication.html", method = RequestMethod.GET)
	String newApplication(ModelMap models) {
		models.put("allDepartments", departmentsdao.getDepartments());
		models.put("application", new Application());
		return "application/newApplication";

	}

	@RequestMapping(value = "/newApplication.html", method = RequestMethod.POST)
	String newApplication(@ModelAttribute Application application,
			HttpSession session, @RequestParam String programName,
			ModelMap models, @RequestParam String submit
			) {
		// If Application submitted display the date of submission

		List<Status> statusList = application.getStatus();
		if (statusList == null) {
			statusList = new ArrayList<Status>();
		}
		Status currStatus = new Status();
		if (submit.equals("save")) {
			currStatus.setStatus("Not Submitted");
			currStatus.setComments("status Updated");
			statusList.add(currStatus);
			application.setStatus(statusList);
		} else {
			currStatus.setStatus("Submitted");
			currStatus.setComments("status Updated");
			statusList.add(currStatus);
			application.setDate(new Date());
			application.setStatus(statusList);
		}
		Programs p = programsdao.getProgramByProgramName(programName);
		Student stud = (Student) session.getAttribute("currentUser");
		application.setStudent(stud);
		application.setPrograms(p);
		/*List<Degree> dgrs=application.getDegrees();
		if(dgrs==null){
			dgrs=new ArrayList<Degree>();
		}
		//save the degrees before saving
	
		application.setDegrees(dgrs);*/
		applicationsdao.saveApplication(application);

		models.put("studentApplications",
				applicationsdao.getApplicationByStudentsEmail(stud.getEmail()));
		return "users/students";
	}

	@RequestMapping(value = "/retrieveProgramsList.html")
	String getProgramsbyAjaxDepartment(@RequestParam String dname,
			ModelMap models, HttpServletResponse response) throws IOException {

		Department department = departmentsdao.getDepartmentByName(dname);
		List<Programs> fetchPrograms = department.getPrograms();
		List<AdditionalFields> fetchAddFields = department
				.getAdditionalFields();
		JSONArray jsonProgramsArray = new JSONArray();
		JSONArray jsonAfArray = new JSONArray();
		HashMap<String, String> programsMap = new HashMap<String, String>();
		HashMap<String, String> afMap = new HashMap<String, String>();

		for (Programs program : fetchPrograms) {
			programsMap.put("name", program.getName());
			jsonProgramsArray.put(programsMap);
		}
		JSONObject obj = new JSONObject();
		obj.put("programs", jsonProgramsArray);
		for (AdditionalFields af : fetchAddFields) {
			afMap.put("name", af.getName());
			afMap.put("type", af.getType());
			afMap.put("required", String.valueOf(af.isRequired()));
			jsonAfArray.put(afMap);

		}

		obj.put("AdditionalFields", jsonAfArray);
		System.out.println(obj);
		response.setContentType("application/json");
		obj.write(response.getWriter());

		return null;
	}

	private File getUploadedFilePath() {
		String path = context.getRealPath("/WEB-INF/files");
		return new File(path);
	}
	
	@RequestMapping(value="/download.html")
	String downloadFile(@RequestParam int applicationId,HttpServletResponse response) throws IOException{
		
		Application app=applicationsdao.getApplicationById(applicationId);
		String filename=app.getAcademicRecords().get(0).getTranscripts();
		response.setHeader("Content-Disposition","attachment;filename="+filename);
		
		FileInputStream fin=new FileInputStream(new File(getUploadedFilePath(),filename));
		OutputStream out=response.getOutputStream();
		byte[] fileData=new byte[2048];
		int sizeOfBytesRead;
		while((sizeOfBytesRead=fin.read(fileData))>0){
			out.write(fileData,0,sizeOfBytesRead);
		}
		fin.close();
		out.close();
		return null;
		
	}

	@RequestMapping(value = "/upload.html", method = RequestMethod.POST)
	String uploading(@RequestParam MultipartFile transcript,@ModelAttribute Application application,@RequestParam(required=false) String additionalFile,
			@RequestParam(required=false) String name,@RequestParam(required=false) String required,
			HttpServletResponse response
			)
			 {
		
		
		//if it is additional file then save the file name in the term of addiitonal_additionalFields
		if(additionalFile!=null){
			List<AdditionalFields> additionalList=application.getAdditionalFields();
			if(additionalList==null||additionalList.size()==0){
				additionalList=new ArrayList<AdditionalFields>();
				AdditionalFields af=new AdditionalFields();
				
				
				af.setValue(transcript.getOriginalFilename());
				additionalList.add(af);
				application.setAdditionalFields(additionalList);
			}else{
			additionalList.get(Integer.parseInt(additionalFile)).setType(transcript.getOriginalFilename());
			
			}
		}else{
			List<AcademicRecords> ar=application.getAcademicRecords();
			if(ar==null){
				ar=new ArrayList<AcademicRecords>();
				AcademicRecords Ar=new AcademicRecords();
				Ar.setTranscripts(transcript.getOriginalFilename());
				ar.add(Ar);
				application.setAcademicRecords(ar);
				
			}else{
				
				ar.get(0).setTranscripts(transcript.getOriginalFilename());
				
			}
		}
		
		
		try {
			transcript.transferTo(new File(getUploadedFilePath(), transcript
					.getOriginalFilename()));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
