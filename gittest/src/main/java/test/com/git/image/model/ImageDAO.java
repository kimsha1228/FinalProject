package test.com.git.image.model;

import java.util.List;

public interface ImageDAO {
	public int insert(ImageVO vo);
	public int deleteCom(ImageVO vo);
	public int deleteAct(ImageVO vo);
	public List<ImageVO> selectAllCom(ImageVO vo);
	public List<ImageVO> selectAllAct(ImageVO vo);
}
