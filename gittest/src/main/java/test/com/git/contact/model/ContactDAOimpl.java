package test.com.git.contact.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ContactDAOimpl implements ContactDAO {

	
	@Autowired
	SqlSession sqlSession;
	
	
	public ContactDAOimpl() {
		log.info("ContactDAOimpl....");
	}
	
	@Override
	public int insert(ContactVO vo) {
		log.info("insert()....{}", vo);
		
		return sqlSession.insert("C_INSERT", vo);
	}

	@Override
	public List<ContactVO> selectAll() {
		log.info("selectAll()....");
		
		return sqlSession.selectList("C_SELECT_ALL");
	}

	@Override
	public List<ContactVO> selectAllUser() {
		log.info("selectAllUser()....");
		
		return sqlSession.selectList("C_SELECT_ALL_USER");
	}

	@Override
	public ContactVO selectOne(ContactVO vo) {
		log.info("selectOne()....{}", vo);
		
		return sqlSession.selectOne("C_SELECT_ONE", vo);
	}

	@Override
	public ContactVO selectOneUser(ContactVO vo) {
		log.info("selectOneUser()....{}", vo);
		
		return sqlSession.selectOne("C_SELECT_ONE_USER", vo);
	}

	@Override
	public int delete(ContactVO vo) {
		log.info("delete()....{}", vo);
		
		return sqlSession.delete("C_DELETE", vo);
	}

	@Override
	public int insertContactOK(ContactVO vo) {
		log.info("insertCotactOK()....{}", vo);
		
		return sqlSession.insert("C_INSERT_CONTACTOK", vo);
	}

}
