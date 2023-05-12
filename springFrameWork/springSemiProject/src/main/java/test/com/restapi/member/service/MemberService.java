package test.com.restapi.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.restapi.member.model.MemberDAO;
import test.com.restapi.member.model.MemberVO;


/**
 * 서비스는 중간 가교역할만 한다. 기존엔 Controller가 DAO에 직접 접속햇으나<br> 
 * 스프링에선 Controller -> Service -> DAO 이런식으로 한단계 더 거쳐야한다<br>
 *  
 */
@Service
@Slf4j
public class MemberService {

	// 스프링이 Repository(Component)가 된 impl을 dao에 주입해준다
	// MemberDAOimpl() 타입이 존재한다면 autowired로 주입된다
	// 기본적으로는 타입을 쫓아다닌다
	@Autowired 
	MemberDAO dao; //Dependency Injection(DI) : IoC(Inversion of Controll)

	public MemberService() {
		log.info("MemberService() 온라인!...");
	}
	
	public List<MemberVO> selectAll() {
		return dao.selectAll();
	}

	public MemberVO selectOne(MemberVO vo) {
		return dao.selectOne(vo);
	}

	public List<MemberVO> searchList(String searchKey, String searchWord) {
		return dao.searchList(searchKey, searchWord);
	}

	public int insert(MemberVO vo) {
		return dao.insert(vo);
	}

	public int update(MemberVO vo) {
		return dao.update(vo);
	}

	public int delete(MemberVO vo) {
		return dao.delete(vo);
	}

	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}

	public List<MemberVO> idCheck(MemberVO vo) {
		return dao.searchList("id", vo.getId());
	}
}
