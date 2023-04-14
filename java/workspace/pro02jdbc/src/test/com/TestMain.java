package test.com;

import java.util.List;

/**
 * @Date 		: 2023. 4. 10.
 * @Author 		: 노건호
 * @Desciption	: DB와 연동
 */
public class TestMain {

	public static void main(String[] args) {

		System.out.println("Hello JDBC");
	
		//★★★★★★★★★★★★★★★★★★★★★★★★★java코드 + DB:
		//1. 사용할 data 객체를(ValueObject, DataTransferObject 오브젝트라고도 함) 선정 
		//2. 선정된 객체가 DB테이블의 행데이터를 결정한다
		
		
		//data를 처리할 객체(3.인터페이스(DataAccecessObject), 4.클래스 상속관계로 구현한다(DAOimpl))
		//4-1.selectAll
		//4-2.selectOne
		TestDAO dao = new TestDAOimpl();
		List<TestVO> vos= dao.selectAll();
		System.out.println(vos);
		
		TestVO vo = new TestVO();
		vo.setNum(3);

		TestVO vo2 =dao.selectOne(vo);
		System.out.println(vo2);
		
		//상속받은 클래스를 통해 DB와 연동하는 로직 작성
		//연동순서는 (5. 드라이버 연결, 6. 커넥션 연결, 7. 질의문 요청 및 응답, 8. 예외처리)
		
		//C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib\ojdbc6.jar 파일복사
		//프로젝트 우클릭 new lib folder 생성 jar파일을 ctrlc ctrlv 우클릭 빌드패스 Add to 빌드패스
		
		
	}//end main

}//end class
