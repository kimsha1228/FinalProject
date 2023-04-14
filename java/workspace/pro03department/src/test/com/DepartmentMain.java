package test.com;

import java.util.List;

public class DepartmentMain {

	public static void main(String[] args) {
		System.out.println("Hello Department");

		// ★★★★★★★★★★★★★★★★★★★★★★★★★java코드 + DB:
		// 1. 사용할 data 객체를(ValueObject, DataTransferObject 오브젝트라고도 함) 선정
		// 2. 선정된 객체가 DB테이블의 행데이터를 결정한다

		// data를 처리할 객체(3.인터페이스(DataAccecessObject), 4.클래스 상속관계로 구현한다(DAOimpl))
		DepartmentDAO dao = new DepartmentDAOimpl();
		// 4-1.selectAll
		List<DepartmentVO> vos = dao.selectAll();
		System.out.println(vos);
		System.out.println(vos.size());
		for (DepartmentVO x : vos) {
			System.out.print(x.getDepartment_id() + " ");
			System.out.print(x.getDepartment_name() + " ");
			System.out.print(x.getManager_id() + " ");
			System.out.println(x.getLocation_id());
		}

		System.out.println("============================");
		// 4-2.selectOne
		DepartmentVO vo = new DepartmentVO();
		vo.setDepartment_id(10);

		DepartmentVO vo2 = dao.selectOne(vo);
		System.out.println(vo2);

		// DAOimpl 클래스를 통해 DB와 연동하는 로직 작성
		// 연동순서는 (5. 드라이버 연결, 6. 커넥션 연결, 7. 질의문 요청 및 응답, 8. 예외처리)

	}// end main

}// end class
