package test.com.git.faq.model;

import java.util.List;

public interface FaqDAO {
	public int insert(FaqVO vo);
	
	public int update(FaqVO vo);
	
	public int delete(FaqVO vo);
	
	public List<FaqVO> selectAll();
	
	public FaqVO selectOne(FaqVO vo);
	
	public List<FaqVO> searchList(String searchKey, String searchWord);
}
