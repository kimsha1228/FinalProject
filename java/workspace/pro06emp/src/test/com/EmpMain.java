package test.com;

import java.sql.Date;
import java.util.GregorianCalendar;
import java.util.List;

public class EmpMain {

	public static void main(String[] args) {
		System.out.println("Hello Emp!");

		// employees 테이블을 데이터 포함 복제해서 emp 테이블을 만들고
		// column은 EmpVO에 있는 속성과 관련된 컬럼만 복제할것.
		// 입력,수정,삭제,모두검색, 검색어검색,번호검색

		// EmpVO
		// EmpDAO <-- interface

		GregorianCalendar gcal = new GregorianCalendar(2020, 11, 25);
//		System.out.println(gcal.get(Calendar.YEAR));
//		System.out.println(gcal.get(Calendar.MONTH));
//		System.out.println(gcal.get(Calendar.DAY_OF_MONTH));
		Date hire_date = new Date(gcal.getTimeInMillis());
		System.out.println(hire_date);
		EmpDAO dao = new EmpDAOimpl();

		// 테이블 복사
		int result = dao.copytable();
		System.out.println("Copy Result:" + (result > 0 ? "suceess" : "fail"));

		// 입력
		result = 0;
		EmpVO vo = new EmpVO();
		vo.setEmployee_id(222);
		vo.setFirst_name("Kim");
		vo.setLast_name("JungYun");
		vo.setHire_date(hire_date);
		vo.setSalary(5000);
		vo.setJob_id("1234");
		result = dao.insert(vo);
		System.out.println("Insert Result:" + (result > 0 ? "suceess" : "fail"));

		// 수정
		result = 0;
		vo = new EmpVO();
		vo.setEmployee_id(100);
		vo.setFirst_name("Kim");
		vo.setLast_name("JungYun");
		vo.setHire_date(hire_date);
		vo.setSalary(5000);
		vo.setJob_id("1234");
		result = dao.update(vo);
		System.out.println("Update Result:" + (result > 0 ? "suceess" : "fail"));

		// 삭제
		result = 0;
		vo = new EmpVO();
		vo.setEmployee_id(101);
		result = dao.delete(vo);
		System.out.println("Delete Result:" + (result > 0 ? "suceess" : "fail"));

		// 모두검색
		List<EmpVO> vos = dao.selectAll();
		for (EmpVO x : vos) {
			System.out.print(x.getEmployee_id() + " ");
			System.out.print(x.getFirst_name() + " ");
			System.out.print(x.getLast_name() + " ");
			System.out.print(x.getSalary() + " ");
			System.out.print(x.getHire_date() + " ");
			System.out.println(x.getJob_id() + " ");
		}

		// 검색어 검색
		vos = dao.searchList("First_name", "hn");
		for (EmpVO x : vos) {
			System.out.print(x.getEmployee_id() + " ");
			System.out.print(x.getFirst_name() + " ");
			System.out.print(x.getLast_name() + " ");
			System.out.print(x.getSalary() + " ");
			System.out.print(x.getHire_date() + " ");
			System.out.println(x.getJob_id() + " ");
		}

		// 번호검색
		vo.setEmployee_id(125);
		vo = dao.searchNum(vo);
		System.out.print(vo.getEmployee_id() + " ");
		System.out.print(vo.getFirst_name() + " ");
		System.out.print(vo.getLast_name() + " ");
		System.out.print(vo.getSalary() + " ");
		System.out.print(vo.getHire_date() + " ");
		System.out.println(vo.getJob_id() + " ");

		// View
		// commpct : null -> 0으로 표기하기
		List<ViewEmpDeptVO> view = dao.selectView();
		for (ViewEmpDeptVO x : view) {
			System.out.print(x.getEmpno() + " ");
			System.out.print(x.getFname() + " ");
			System.out.print(x.getDeptno() + " ");
			System.out.print(x.getDeptname() + " ");
			System.out.print(x.getSalary() + " ");
			System.out.println(x.getCommpct() == 0.0 ? "0" : x.getCommpct());
		}
	}// end main
}// end class
