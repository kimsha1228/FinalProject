package test.com;

import java.util.List;

public class MemberMain {

	public static void main(String[] args) {
		System.out.println("Hello Member");
	
		//1. MEMBER TABLE 칼럼에 맞는 테이블을 생성(MemberVO)
		//2. MemberVO
		//3. MemberDAO interface <--- MemberDAOimpl
		//		selecttAll,selectOne,searchList
		MemberDAO dao = new MemberDAOimpl();
		List<MemberVO> vos = dao.selectAll();
		System.out.println(vos);
		System.out.println(vos.size());
		//방법1
		for (MemberVO x : vos) {
			System.out.print(x.getNUM()+" ");
			System.out.print(x.getNAME()+" ");
			System.out.print(x.getID()+" ");
			System.out.print(x.getPASSWORD()+" ");
			System.out.println(x.getTEL());
		}
		//자바 1.8버전부터 가능한 방법 2
		vos.forEach(System.out::println);
		
		//방법3
		for (int i = 0; i < vos.size(); i++) {
			MemberVO x= vos.get(i);
			System.out.print(x.getNUM()+" ");
			System.out.print(x.getNAME()+" ");
			System.out.print(x.getID()+" ");
			System.out.print(x.getPASSWORD()+" ");
			System.out.println(x.getTEL());
		}
		
		System.out.println("=====================================");
		
		vos = dao.searchList("name", "lee");
		for (MemberVO x : vos) {
			System.out.print(x.getNUM()+" ");
			System.out.print(x.getNAME()+" ");
			System.out.print(x.getID()+" ");
			System.out.print(x.getPASSWORD()+" ");
			System.out.println(x.getTEL());
		}
		
		System.out.println("=====================================");

		MemberVO vo = new MemberVO();
		vo.setNUM(9); //하나만 받아올거라 유니크한 PK로 검색
//		vo.setID("admin11");
//		vo.setPASSWORD("hi1111");
//		vo.setNAME("kim11");
//		vo.setTEL("011");
		MemberVO vo2 = dao.selectOne(vo);
		System.out.println(vo2);
		
		System.out.println("=====================================");

		//4. JDBC driver
		//5. Connection (conn)
		//6. pstmt
		//7. select >> rs >> while
		
		//insert 해보기
		vo = new MemberVO();
		vo.setID("admin11");
		vo.setPASSWORD("ho1111");
		vo.setNAME("kim11");
		vo.setTEL("011");
		
		int result = dao.insert(vo);
		
		System.out.println("result:"+result);
		
		//update
		vo = new MemberVO();
		vo.setNUM(35);
		vo.setID("admin69");
		vo.setPASSWORD("kokoko1111");
		vo.setNAME("lim11");
		vo.setTEL("011");
		
		result = dao.update(vo);
		System.out.println("update result:"+result);
		
		//DELETE (10번만 지우기)
		vo = new MemberVO();
		vo.setNUM(10);
		
		result = dao.delete(vo);
		System.out.println("Delete result:"+result);
	}//end main

}//end class
