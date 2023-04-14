package test.com.nogunho;

import java.util.List;

public interface EmployeeDAO {

	List<EmployeeVO> selectAll();

	List<EmployeeVO> searchList(String string, String string2);

	EmployeeVO selectOne(EmployeeVO vo);

	List<EmployeeVO> searchDeptList(int dept_num);

}
