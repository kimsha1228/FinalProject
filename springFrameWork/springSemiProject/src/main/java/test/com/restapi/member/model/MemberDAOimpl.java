package test.com.restapi.member.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

//component를 붙여주면 컨트롤러에서 new dao를 해줄 필요가 없어진다!
//스프링에서 알아서 static으로 객체를 하나 생성해준다(싱글톤)
//@Component
@Repository // 저장소관련이면 Repository로 선언
@Slf4j
public class MemberDAOimpl implements MemberDAO {

	// root-context에서 가져온..
	@Autowired
	SqlSession sqlSession;

	public MemberDAOimpl() {
		log.info("MemberDAOimpl()...");

//		try {
//			Class.forName(OracleJDBC.DRIVER_NAME);
//			log.info("driver successed...");
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		}

	}

	@Override
	public int insert(MemberVO vo) {
		log.info("insert()..." + vo);
		int flag = 0;
		
		try {
			flag = sqlSession.insert("INSERT", vo);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	@Override
	public int update(MemberVO vo) {
		log.info("update()..." + vo);
		int flag = sqlSession.update("UPDATE", vo);

		return flag;
	}

	@Override
	public int delete(MemberVO vo) {
		log.info("delete()..." + vo);

		int flag = sqlSession.delete("DELETE", vo);

		return flag;
	}

	@Override
	public MemberVO selectOne(MemberVO vo) {
		log.info("selectOne()..." + vo);

		MemberVO vo2 = sqlSession.selectOne("SELECT_ONE", vo);

		return vo2;
	}// end selectOne

	@Override
	public List<MemberVO> selectAll() {
		log.info("selectAll()...");
		List<MemberVO> vos = sqlSession.selectList("SELECT_ALL");

		return vos;
	}// end selectAll

	@Override
	public List<MemberVO> searchList(String searchKey, String searchWord) {
		log.info("searchList()...");
		log.info("넘어온 searchKey: " + searchKey);
		log.info("넘어온 searchWord: " + searchWord);
		List<MemberVO> vos = null;

		if (searchKey.equals("name"))
			vos = sqlSession.selectList("SEARCH_LIST_NAME", "%" + searchWord + "%");
		else if (searchKey.equals("tel"))
			vos = sqlSession.selectList("SEARCH_LIST_TEL", "%" + searchWord + "%");
		else
			vos = sqlSession.selectList("SEARCH_LIST_ID", searchWord);

		return vos;
	}// end searchList

	@Override
	public MemberVO login(MemberVO vo) {
		log.info("login()..." + vo);

		MemberVO vo2 = sqlSession.selectOne("LOGIN", vo);

		return vo2;
	}

}
