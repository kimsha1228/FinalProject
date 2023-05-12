package test.com.restapi.member.model;

import java.util.List;

public interface MemberDAO {
	
	public int insert(MemberVO vo);
	public int update(MemberVO vo); // insert update delete 는 성격이 비슷하다!
	public int delete(MemberVO vo);
	
	public MemberVO selectOne(MemberVO vo);

	// 맴버가 여러개니까 List로 받는다
	public List<MemberVO> selectAll();

	public List<MemberVO> searchList(String searchKey, String searchWord);
	
	public MemberVO login(MemberVO vo);
}
