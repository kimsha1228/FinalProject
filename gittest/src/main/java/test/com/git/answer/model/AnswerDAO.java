package test.com.git.answer.model;

import java.util.List;

public interface AnswerDAO {
	
	public int insert(AnswerVO vo);
	
	public int update(AnswerVO vo);
	
	public int delete(AnswerVO vo);
	
	public List<AnswerVO> selectAll();
	
	public AnswerVO selectOne(AnswerVO vo);
}
