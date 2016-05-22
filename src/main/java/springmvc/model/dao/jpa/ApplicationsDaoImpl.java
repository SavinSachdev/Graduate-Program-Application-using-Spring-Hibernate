package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import springmvc.model.Application;
import springmvc.model.dao.ApplicationsDao;

@Repository
public class ApplicationsDaoImpl implements ApplicationsDao{
	 	@PersistenceContext
	    private EntityManager entityManager;

		@Override
		public List<Application> getApplications() {
			
			return entityManager.createQuery(" from Application order by application_id ",Application.class).getResultList();
		}

		@SuppressWarnings("unchecked")
		@Override
		public List<Application> getApplicationByDepartment(String department) {
			// TODO Auto-generated method stub
			return entityManager.createQuery("from Application where programs.department.name= :name").setParameter("name",department).getResultList();
		}

		@SuppressWarnings("unchecked")
		@Override
		public List<Application> getApplicationByStudents(String student_name) {
			// TODO Auto-generated method stub
			return entityManager.createQuery("from Application where student.fname= :fname").setParameter("fname",student_name).getResultList();
		}

		
		
		

}
