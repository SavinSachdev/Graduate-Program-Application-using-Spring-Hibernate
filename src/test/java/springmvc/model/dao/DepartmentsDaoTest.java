package springmvc.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.test.context.ContextConfiguration;
 import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
 import org.testng.annotations.Test;

@Test(groups = "DepartmentsDaoTest")
 @ContextConfiguration(locations = "classpath:applicationContext.xml")
 public class DepartmentsDaoTest extends AbstractTransactionalTestNGSpringContextTests {

    @Autowired
     DepartmentsDao userDao;

   @Test
     public void getNoOfDepartments()
     {
         assert userDao.getDepartments().size()== 2;
     }
   
   

}
