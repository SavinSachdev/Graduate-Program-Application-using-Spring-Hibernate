package springmvc.model.dao;

import java.util.List;

import springmvc.model.Application;
import springmvc.model.Student;


public interface ApplicationsDao {
	List<Application> getApplications();
	List<Application> getApplicationByDepartment(String department );
	List<Application> getApplicationByStudentsEmail(String email);
	Application getApplicationById(int id);
	void saveApplication(Application application);
	
	
}
