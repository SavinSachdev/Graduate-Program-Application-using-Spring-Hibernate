package springmvc.model.dao;

import java.util.List;

import springmvc.model.GappUsers;
import springmvc.model.Student;

public interface GappUsersDao {
	List<GappUsers> getUsers();
	GappUsers saveUser(Student student);
	GappUsers getUserByEmailandPassword(String email,String password);
	
	
}
