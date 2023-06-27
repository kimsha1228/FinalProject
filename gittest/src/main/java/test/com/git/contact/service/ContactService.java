package test.com.git.contact.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.git.contact.model.ContactDAO;
import test.com.git.contact.model.ContactVO;

@Slf4j
@Service
public class ContactService {
	
	@Autowired
	ContactDAO dao;
	
	public ContactService() {
		log.info("ContactService()...");
	}
	
	public int insert(ContactVO vo) {
		return dao.insert(vo);
	}
	
	public List<ContactVO> selectAll(){
		return dao.selectAll();
	}
	
	public ContactVO selectOne(ContactVO vo) {
		return dao.selectOne(vo);
	}
	
	public int delete(ContactVO vo) {
		return dao.delete(vo);
	}

}
