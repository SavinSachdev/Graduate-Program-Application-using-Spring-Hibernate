package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.Application;
import springmvc.model.GappUsers;
import springmvc.model.Student;
import springmvc.model.dao.GappUsersDao;

@Repository
public class GappUsersDaoImpl implements GappUsersDao{
	
	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<GappUsers> getUsers() {
		// TODO Auto-generated method stub
		
	return entityManager.createQuery("from GappUsers order by user_id ",GappUsers.class).getResultList();
	}

	@Override
	@Transactional
	public GappUsers saveUser(Student student) {
		return entityManager.merge(student);
		
	}

	@Override
	public GappUsers getUserByEmailandPassword(String email,String password) {
		// TODO Auto-generated method stub
		return entityManager.createQuery("from GappUsers where email=:email and password=:password",GappUsers.class).setParameter("email",email).setParameter("password",password).getSingleResult();
	}

	

	

}
