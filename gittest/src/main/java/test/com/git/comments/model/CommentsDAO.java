package test.com.git.comments.model;

import java.util.List;

public interface CommentsDAO {

	public List<CommentsVO> selectAll();
	
	public CommentsVO selectOne(CommentsVO vo);
	
	public int insert(CommentsVO vo);
	
	public int update(CommentsVO vo);
	
	public int delete(CommentsVO vo);
}
