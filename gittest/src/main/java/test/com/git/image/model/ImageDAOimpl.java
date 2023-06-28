package test.com.git.image.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ImageDAOimpl implements ImageDAO {

	@Autowired
	SqlSession sqlSession;

	public ImageDAOimpl() {
		log.info("ImageDAOimpl 생성자 생성...");
	}

	@Override
	public int insert(ImageVO vo) {
		log.info("insert image!:{}",vo);
		return sqlSession.insert("IMAGE_INSERT",vo);
	}

	@Override
	public int deleteCom(ImageVO vo) {
		log.info("delete image of comment!:{}",vo);
		return sqlSession.delete("IMAGE_DELETE_COM",vo);
	}
	@Override
	public int deleteAct(ImageVO vo) {
		log.info("delete image of Activity!:{}",vo);
		return sqlSession.delete("IMAGE_DELETE_ACT",vo);
	}

	@Override
	public List<ImageVO> selectAllCom(ImageVO vo) {
		log.info("select image for comment:{}",vo);
		return sqlSession.selectList("IMAGE_SELECT_ALL_COM",vo);
	}
	@Override
	public List<ImageVO> selectAllAct(ImageVO vo) {
		log.info("select image for Activity:{}",vo);
		return sqlSession.selectList("IMAGE_SELECT_ALL_ACT",vo);
	}

}
