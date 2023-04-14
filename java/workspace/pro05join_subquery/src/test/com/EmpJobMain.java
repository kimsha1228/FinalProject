package test.com;

import java.util.List;

public class EmpJobMain {

	public static void main(String[] args) {
		System.out.println("Hello Emp Job Join");

		EmpJobDAO dao = new EmpJobDAOimpl();

		List<EmpJobVO> vos = dao.selectJoin();
		for (EmpJobVO x : vos) {
			System.out.print(x.getEmployee_id() + " ");
			System.out.print(x.getFirst_name() + "_");
			System.out.print(x.getLast_name() + " ");
			System.out.print(x.getSalary() + " ");
			System.out.print(x.getJob_title() + " ");
			System.out.println(x.getHire_date());
		}
	}// end main

}// end class
