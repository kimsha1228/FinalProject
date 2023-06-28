package test.com.git.activity.model;

import java.util.List;

public interface ActivityDAO {
	public int insert(ActivityVO vo);
	public int update(ActivityVO vo);
	public void updateVcount(ActivityVO vo);
	public int delete(ActivityVO vo);
	public List<ActivityVO> selectAll(String seller_id);
	public List<ActivityVO> selectAllUser(ActivityVO vo);
	public ActivityVO selectOne(ActivityVO vo);
	public List<ActivityVO> searchList(String seller_id, String searchKey, String searchWord);
}
