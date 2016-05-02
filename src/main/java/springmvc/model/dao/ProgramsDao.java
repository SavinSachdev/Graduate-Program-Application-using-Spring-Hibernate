package springmvc.model.dao;




import springmvc.model.Programs;

public interface ProgramsDao {
Programs addProgram(Programs program);
void removePrograms(Programs program);

Programs getProgramByProgramName(String programName);

}
