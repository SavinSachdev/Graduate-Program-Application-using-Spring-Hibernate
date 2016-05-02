package springmvc.model.dao;

import java.util.List;

import springmvc.model.AdditionalFields;
import springmvc.model.Department;
import springmvc.model.Programs;



public interface DepartmentsDao {
	List<Department> getDepartments();
	Department getDepartmentById(int id);
	Department addDepartment(Department department);
	void removeDepartment(Department department);
	Department getDepartmentByName(String name);
	
}
