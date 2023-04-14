package test.com;

import java.util.List;

public class EmpDeptMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Hello EmpDept");
		EmpDeptDAO dao = new EmpDeptDAOimpl();

		List<EmpDeptVO> vos = dao.selectJoin();
		System.out.println(vos);
		System.out.println(vos.size());

		for (EmpDeptVO x : vos) {
			System.out.print(x.getEmployee_id() + " ");
			System.out.print(x.getFirst_name() + "_");
			System.out.print(x.getLast_name() + " ");
			System.out.print(x.getSalary() + " ");
			System.out.print(x.getDepartment_name() + " ");
			System.out.println(x.getHire_date());
		}
		
		int total_count = dao.getTotalCount();
		System.out.println("total_count: "+total_count);
	}// end main

}// end class
