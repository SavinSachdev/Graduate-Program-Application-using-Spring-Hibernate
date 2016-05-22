package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.AdditionalFields;
import springmvc.model.Department;
import springmvc.model.Programs;
import springmvc.model.dao.DepartmentsDao;
@Repository
public class DepartmentsDaoImpl implements DepartmentsDao{
	 	@PersistenceContext
	    private EntityManager entityManager;

		@Override
		public List<Department> getDepartments() {
			
			return entityManager.createQuery(" from Department", Department.class).getResultList();
		}

		@Override
		@Transactional
		public Department addDepartment(Department department) {
			// TODO Auto-generated method stub
			
			return entityManager.merge(department);
			
		}

		@Override
		public Department getDepartmentById(int id) {
			// TODO Auto-generated method stub
			
			return entityManager.find(Department.class, id);
		}

		@Override
		@Transactional
		public void removeDepartment(Department department) {
			// TODO Auto-generated method stub
			
			entityManager.remove(department);
			
		}
		@Override
		@Transactional
		public void removeProgram(Programs program){
			
			entityManager.remove(program);
		}

		
}
