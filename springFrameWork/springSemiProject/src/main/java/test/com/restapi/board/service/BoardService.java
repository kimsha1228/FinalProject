package test.com.restapi.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.com.restapi.board.model.BoardDAO;
import test.com.restapi.board.model.BoardVO;

@Service
public class BoardService {

	@Autowired
	BoardDAO dao;

	public List<BoardVO> selectAll() {
		return dao.selectAll();
	}

	public List<BoardVO> searchList(String searchKey, String searchWord) {
		return dao.searchList(searchKey, searchWord);
	}

	public BoardVO selectOne(BoardVO vo) {
		return dao.selectOne(vo);
	}

	public int insert(BoardVO vo) {
		return dao.insert(vo);
	}

	public int update(BoardVO vo) {
		return dao.update(vo);
	}

	public int delete(BoardVO vo) {
		return dao.delete(vo);
	}

	public void vcountUp(BoardVO vo) {
		dao.vcountUp(vo);
	}
}
