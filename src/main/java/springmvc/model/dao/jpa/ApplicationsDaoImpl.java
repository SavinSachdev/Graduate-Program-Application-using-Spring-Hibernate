package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
		public List<Application> getApplicationByStudentsEmail(String email) {
			// TODO Auto-generated method stub
			return entityManager.createQuery("from Application where student.email= :email").setParameter("email",email).getResultList();
		}

		@Override
		public Application getApplicationById(int id) {
			// TODO Auto-generated method stub
			return entityManager.createQuery("from Application where id=:id",Application.class).setParameter("id", id).getSingleResult();
		}

		@Override
		@Transactional
		public void saveApplication(Application application) {
			// TODO Auto-generated method stub
			entityManager.merge(application);
		}

		
		
		

}
