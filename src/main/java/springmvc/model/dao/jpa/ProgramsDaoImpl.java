package springmvc.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.Programs;
import springmvc.model.dao.ProgramsDao;

@Repository
public class ProgramsDaoImpl implements ProgramsDao {
	@PersistenceContext
	EntityManager entityManager;

	@Override
	@Transactional
	public Programs addProgram(Programs program) {
		// TODO Auto-generated method stub
		return entityManager.merge(program);
	}

	@Override
	@Transactional
	public void removePrograms(Programs program) {
		// TODO Auto-generated method stub
		entityManager.remove(program);
	}
	
	
}
