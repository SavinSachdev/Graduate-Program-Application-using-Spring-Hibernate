package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import springmvc.model.Department;
import springmvc.model.dao.DepartmentsDao;
@Repository
public class DepartmentsDaoImpl implements DepartmentsDao{
	 	@PersistenceContext
	    private EntityManager entityManager;

		@Override
		public List<Department> getDepartments() {
			
			return entityManager.createQuery(" from Department", Department.class).getResultList();
		}

		

}
