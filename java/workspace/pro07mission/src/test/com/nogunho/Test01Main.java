package test.com.nogunho;

import java.util.List;


public class Test01Main {

	public static void main(String[] args) {
		System.out.println("Hello Test01");
		
		// employees 테이블을 사용하여 작성할것.
		// 1. 모든 사원의 모든 칼럼의 정보를 selectAll()
		// 2-1. first_name 으로 유사검색어 검색 searchList()
		// 2-2. salary로 검색 searchList()
		// 3. 사원번호로 검색 selectOne
		// 4. 부서번호로 검색 selectDeptList
		// 사용할 객체 EmployeeVO, EmployeeDAO, EmployeeDAOimpl
		// JDBC driver
		// Connection (conn)
		// pstmt
		// select >> rs >> while
		
		
		EmployeeDAO dao = new EmployeeDAOimpl();
		System.out.println();
		//모든 사원의 모든 칼럼정보
		List<EmployeeVO> vos = dao.selectAll();
		System.out.println();
		printemployee(vos);
		
		// 2-1. first_name 으로 유사검색어 검색 searchList()
		// 2-2. salary로 검색 searchList()
		System.out.println();
		vos = dao.searchList("First_name", "Shelley");
		printemployee(vos);
		System.out.println();
		vos = dao.searchList("salary", "12000");
		printemployee(vos);
		System.out.println();
		
		// 3. 사원번호로 검색 selectOne
		EmployeeVO vo = new EmployeeVO();
		vo.setEmployee_id(125);
		vo=dao.selectOne(vo);
		System.out.println(vo.toString());
		System.out.println();

		// 4. 부서번호로 검색 selectDeptList
		vos = dao.searchDeptList(30);
		printemployee(vos);
	}//end main
	
	//출력용 임시 메서드
	private static void printemployee(List<EmployeeVO> x) {
		for (EmployeeVO y : x) {
			System.out.print(y.getEmployee_id() + " ");
			System.out.print(y.getFirst_name()+ " ");
			System.out.print(y.getLast_name() + " ");
			System.out.print(y.getEmail() + " ");
			System.out.print(y.getPhone_number()+" ");
			System.out.print(y.getHire_date() + " ");
			System.out.print(y.getJob_id() + " ");
			System.out.print(y.getSalary() + " ");
			System.out.print(y.getCommission_pct()+ " ");
			System.out.print(y.getManager_id()+" ");
			System.out.println(y.getDepartment_id()+" ");	
		}
	}
}//end class
