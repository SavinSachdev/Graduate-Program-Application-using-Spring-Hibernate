package springmvc.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

import springmvc.model.Application;

@Test(groups = "ApplicationsDaoTest")
 @ContextConfiguration(locations = "classpath:applicationContext.xml")
 public class ApplicationsDaoTest extends AbstractTransactionalTestNGSpringContextTests {

    @Autowired
     ApplicationsDao applicationDao;

   @Test
     public void getApplicationsByDepartment()
     {
	   int count=1;
	  for(Application appl:applicationDao.getApplicationByDepartment("accounting")){
		  if(appl.getTerm().equalsIgnoreCase("Fall 2016")){
			  count++;
		  }
	  }
	  assert count==1;
     }
     
     
     @Test
     public void getStudentsApplication(){
    	assert applicationDao.getApplicationByStudents("abhijeet").size()==1;      
     }
}


