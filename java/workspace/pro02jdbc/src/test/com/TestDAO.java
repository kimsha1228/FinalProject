package test.com;

import java.util.List;

public interface TestDAO {
	
	//테이블의 한 행은 TestVO 객체로 받아줄수 있다
	public List<TestVO> selectAll();
	public TestVO selectOne(TestVO vo); //TestVO를 받는 이유는 그게 은닉화가 잘되서

}
