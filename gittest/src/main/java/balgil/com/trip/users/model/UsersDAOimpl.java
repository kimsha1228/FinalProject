package balgil.com.trip.users.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class UsersDAOimpl implements UsersDAO {

	@Autowired
	SqlSession sqlSession;

	public UsersDAOimpl() {
		log.info("MemberDAOimpl()...");
	}

	@Override
	public List<UsersVO> selectAll() {
		log.info("selectAll()...");

		return sqlSession.selectList("M_SELECT_ALL");
	}

	@Override
	public UsersVO selectOne(UsersVO vo) {
		log.info("selectOne()...{}", vo);

		return sqlSession.selectOne("M_SELECT_ONE", vo);
	}

	@Override
	public int insert(UsersVO vo) {
		log.info("insert()...{}", vo);

		return sqlSession.insert("M_INSERT", vo);
	}

	@Override
	public int update(UsersVO vo) {
		log.info("update()...{}", vo);

		return sqlSession.update("M_UPDATE", vo);
	}
	
	@Override
	public int delete(UsersVO vo) {
		log.info("delete()...{}", vo);

		return sqlSession.delete("M_DELETE", vo);
	}

	@Override
	public UsersVO login(UsersVO vo) {
		log.info("login()...{}", vo);
		return sqlSession.selectOne("LOGIN", vo);
	}

	@Override
	public List<UsersVO> searchList(String searchKey, String searchWord) {
		log.info("searchList()...searchKey:{}", searchKey);
		log.info("searchList()...searchWord:{}", searchWord);
		
		String key = "";
		if(searchKey.equals("name")) {
			key = "M_SEARCH_LIST_NAME";
		}else {
			key = "M_SEARCH_LIST_TEL";
		}
		
		return sqlSession.selectList(key,"%"+searchWord+"%");
	}

	@Override
	public UsersVO idCheck(UsersVO vo) {
		log.info("idCheck()...{}", vo);
		return sqlSession.selectOne("M_ID_CHECK",vo);
	}

}

	/*
	 * @Override public UsersVO selectOne(UsersVO vo) { log.info("selectOne()...{}",
	 * vo);
	 * 
	 * UsersVO vo2 = sqlSession.selectOne("USERS_SELECTONE", vo);
	 * 
	 * return vo2; }
	 */


