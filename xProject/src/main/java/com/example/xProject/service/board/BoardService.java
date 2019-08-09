package com.example.xProject.service.board;

import java.util.List;

import com.example.xProject.model.board.dto.BoardDTO;
import com.example.xProject.model.board.dto.ReplyDTO;

public interface BoardService {

	public List<BoardDTO> getBoardList(String search_option, String keyword, int start, int end) throws Exception;
	public void getInsertBoard(BoardDTO dto) throws Exception;
	public BoardDTO getBoardContent(int bid) throws Exception;
	public void updateBoard(BoardDTO boardDTO) throws Exception;	
	public void deleteBoard(int bid) throws Exception;
	public int countBoard(String search_option, String keyword) throws Exception;
	
	public List<ReplyDTO> getReplyList(int bid) throws Exception;


	public void saveReply(ReplyDTO replyDTO) throws Exception;
	public void updateReply(ReplyDTO replyDTO) throws Exception;
	public int deleteReply(int rid) throws Exception;


}
