package test.com.git.activity.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ActivityDAOimpl implements ActivityDAO {

	@Autowired
	SqlSession sqlSession;
	
	public ActivityDAOimpl() {
		log.info("ActivityDAOimpl 생성자 생성..");
	}
	
	@Override
	public int insert(ActivityVO vo) {
		log.info("insert! {}",vo);
		return sqlSession.insert("ACT_INSERT",vo);
	}

	@Override
	public int update(ActivityVO vo) {
		log.info("update! {}",vo);

		return sqlSession.update("ACT_UPDATE",vo);
	}

	@Override
	public void updateVcount(ActivityVO vo) {

	}

	@Override
	public int delete(ActivityVO vo) {
		log.info("delete! {}",vo);

		return sqlSession.delete("ACT_DELETE",vo);
	}

	@Override
	public List<ActivityVO> selectAll(String seller_id) {
		log.info("selectAll..{}",seller_id);
		return sqlSession.selectList("ACT_SELECT_ALL",seller_id);
	}

	@Override
	public List<ActivityVO> selectAllUser(ActivityVO vo) {
		return null;
	}

	@Override
	public ActivityVO selectOne(ActivityVO vo) {
		log.info("selectOne.. {}",vo);
		if(vo.getId()!=0) {
			//selectAllAct에서 넘어온 데이터용
			return sqlSession.selectOne("ACT_SELECT_ONE", vo);
		} else {			
			//insertActOk후 imageVO에 넣을 act_id를 가져오기 위함
			return sqlSession.selectOne("ACT_SELECT_ONE_BY_ACT_NAME", vo);
		}
	}


	@Override
	public List<ActivityVO> searchList(String seller_id, String searchKey, String searchWord) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchWord", "%"+searchWord+"%");
		map.put("searchKey", searchKey);
		map.put("seller_id", seller_id);
		log.info(map.toString());
		if(map.get(seller_id) != null) {
			return sqlSession.selectList("ACT_SEARCH_LIST", map);
		}else {
			return sqlSession.selectList("ACT_SEARCH_LIST_USER", map);
		}
	}

}
