package com.example.xProject.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.xProject.model.board.dao.BoardDAO;
import com.example.xProject.model.board.dto.BoardDTO;
import com.example.xProject.model.board.dto.ReplyDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDao;

	@Override
	public List<BoardDTO> getBoardList(String search_option, String keyword, int start, int end) throws Exception {
		return boardDao.getBoardList(keyword, keyword, start, end);
	}
	@Override
	public void getInsertBoard(BoardDTO boardDTO) throws Exception {
		boardDao.getInsertBoard(boardDTO);
	}
	public BoardDTO getBoardContent(int bid) throws Exception{
		boardDao.updateViewCnt(bid);
		return boardDao.getBoardContent(bid);
	}
	@Override
	public void updateBoard(BoardDTO boardDTO) throws Exception {
		boardDao.updateBoard(boardDTO);
	}
	@Override
	public void deleteBoard(int bid) throws Exception {
		 boardDao.deleteBoard(bid);
	}
	
	@Override
	public int countBoard(String search_option, String keyword) throws Exception {
		return boardDao.countBoard(search_option, keyword);
	}
	@Override
	public List<ReplyDTO> getReplyList(int bid) throws Exception {
		return boardDao.getReplyList(bid);

	}
	
	
	
	
	@Override

	public void saveReply(ReplyDTO replyDTO) throws Exception {

		boardDao.saveReply(replyDTO);

	}



	@Override

	public void updateReply(ReplyDTO replyDTO) throws Exception {

		boardDao.updateReply(replyDTO);

	}



	@Override

	public int deleteReply(int rid) throws Exception {

		return boardDao.deleteReply(rid);

	}
}
