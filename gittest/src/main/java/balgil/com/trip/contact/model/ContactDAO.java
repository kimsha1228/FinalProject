package balgil.com.trip.contact.model;

import java.util.List;

public interface ContactDAO {
	
	public int insert(ContactVO vo);
	
	public List<ContactVO> selectAll();
	
	public ContactVO selectOne(ContactVO vo);
	
	public int delete(ContactVO vo);
	
	public int insertOK(ContactVO vo);
	
    public List<ContactVO> selectAllContact(ContactVO vo);
    
    public int update(ContactVO vo);
    
	
}