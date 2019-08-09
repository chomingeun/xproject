package com.example.xProject.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.xProject.model.board.dto.BoardDTO;
import com.example.xProject.model.board.dto.ReplyDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> getBoardList(String search_option, String keyword, int start, int end) throws Exception {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword","%"+keyword+"%");
		map.put("start", start); //맵에 자료 저장
		map.put("end", end);
		List<BoardDTO> list = sqlSession.selectList("board.getBoardList",map);
		for(BoardDTO dto : list) {
			String title = dto.getTitle();
			if(search_option.equals("title")) {
				if(title.indexOf(keyword)!=-1) {
					title = title.replace(keyword, "<strong style='color:#384aec;'>"+keyword+"</strong>");
				}
			}
			dto.setTitle(title);
		}
		return list;
	}
	@Override
	public BoardDTO getBoardContent(int bid) throws Exception {
		return sqlSession.selectOne("board.getBoardContent", bid);
	}
	@Override
	public void getInsertBoard(BoardDTO boardDTO) throws Exception {
		sqlSession.insert("board.getInsertBoard", boardDTO);
		
	}
	@Override
	public void updateBoard(BoardDTO boardDTO) throws Exception {
		sqlSession.update("board.updateBoard", boardDTO);

	}
	@Override
	public int deleteBoard(int bid) throws Exception {

		return sqlSession.insert("board.deleteBoard", bid);
	}
	@Override
	public int updateViewCnt(int bid) throws Exception {

		return sqlSession.update("board.updateViewCnt", bid);
	}
	
	public int countBoard(String search_option, String keyword) throws Exception {
		Map<String,String> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("board.countBoard",map);
	}
	//리플
	@Override

	public List<ReplyDTO> getReplyList(int bid) throws Exception {

		return sqlSession.selectList("reply.getReplyList", bid);

	}



	@Override

	public void saveReply(ReplyDTO replyDTO) throws Exception {

		sqlSession.insert("reply.saveReply", replyDTO);

	}



	@Override

	public void updateReply(ReplyDTO replyDTO) throws Exception {

		sqlSession.update("reply.updateReply", replyDTO);

	}



	@Override

	public int deleteReply(int rid) throws Exception {

		return sqlSession.delete("reply.deleteReply", rid);

	}



}
