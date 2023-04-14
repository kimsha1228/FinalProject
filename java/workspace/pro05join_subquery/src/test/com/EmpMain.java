package test.com;

import java.util.List;

/**
 * @Date : 2023. 4. 11.
 * @Author : 노건호
 * @Desciption :select employee_id, first_name,last_name,salary,hire_date,job_id
 *             from employees where salary > (select round(avg(salary)) from
 *             employees); 를 jdbc로 구현
 */
public class EmpMain {

	public static void main(String[] args) {
		System.out.println("Hello Emp sub query");
		
		//EmpVO
		//EmpDAO <-- interface
		//selectSubQuery() : List<EmpVO>
		EmpDAO dao = new EmpDAOimpl();
		List<EmpVO> vos = dao.selectSubQuery();
		System.out.println(vos);
		
		for (EmpVO x : vos) {
			System.out.print(x.getEmployee_id()+" ");
			System.out.print(x.getFirst_name()+" ");
			System.out.print(x.getLast_name()+" ");
			System.out.print(x.getSalary()+" ");
			System.out.print(x.getHire_date()+" ");
			System.out.println(x.getJob_id()+" ");
		}
		
		vos.forEach(System.out::println);
	}

}
