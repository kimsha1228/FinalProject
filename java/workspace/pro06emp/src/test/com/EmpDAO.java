package test.com;

import java.util.List;

public interface EmpDAO {

	int copytable();

	int insert(EmpVO vo);

	int update(EmpVO vo);

	int delete(EmpVO vo);

	List<EmpVO> selectAll();

	List<EmpVO> searchList(String string, String string2);

	EmpVO searchNum(EmpVO vo);

	List<ViewEmpDeptVO> selectView();

}
