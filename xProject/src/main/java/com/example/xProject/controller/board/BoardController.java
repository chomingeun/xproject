package com.example.xProject.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.xProject.model.board.dto.BoardDTO;
import com.example.xProject.service.board.BoardService;
import com.example.xProject.service.board.Pager;

@Controller
@RequestMapping(value ="/board")
public class BoardController {

	@Inject
	private BoardService boardService;
	
	@RequestMapping("/getBoardList")
	public ModelAndView getBoardList(@RequestParam(defaultValue = "title") String search_option,
		    @RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue="1") int curPage, ModelAndView mav) throws Exception {
		int count = boardService.countBoard(search_option,keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardDTO> list = boardService.getBoardList(search_option,keyword,start,end);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", list.size());
		map.put("pager", pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);		
		
		mav.setViewName("board/index");
		//전달할 데이터
		mav.addObject("map", map);
		return mav;	
	}
	
	@RequestMapping("/write")
	public String write() {
		//글쓰기 폼 페이지로 이동
		return "board/write";
	}
	
	@RequestMapping(value = "/getInsertBoard", method = RequestMethod.POST)
	public String getInsertBoard(@ModelAttribute BoardDTO dto, 
			HttpSession session) throws Exception {
		String reg_id=(String)session.getAttribute("name");
		dto.setReg_id(reg_id);
		boardService.getInsertBoard(dto);
		return "redirect:/board/getBoardList";
	}//insert()
	
	@RequestMapping(value = "/getBoardContent", method = RequestMethod.GET)
	public String getBoardContent(Model model, @RequestParam("bid") int bid) throws Exception {
		model.addAttribute("boardContent", boardService.getBoardContent(bid));
		return "board/content";
	}
	
	@RequestMapping(value = "/updateBoard", method = RequestMethod.GET)
	public String updateBoard(@RequestParam("bid") int bid
, @RequestParam("mode") String mode, Model model) throws Exception {
		model.addAttribute("boardContent", boardService.getBoardContent(bid));
		model.addAttribute("mode", mode);
		model.addAttribute("boardDTO", new BoardDTO());
		return "board/update";
	}

	/*@RequestMapping(value = "/saveBoard", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("boardDTO") BoardDTO boardDTO
			, @RequestParam("mode") String mode
			, RedirectAttributes rttr) throws Exception {
		if (mode.equals("edit")) {
			boardService.updateBoard(boardDTO);
		} else {
			boardService.getInsertBoard(boardDTO);
		}
		return "redirect:/board/getBoardList";
	}*/
	
	@RequestMapping(value = "/saveBoard", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("boardDTO") BoardDTO boardDTO, 
			HttpSession session) throws Exception {
		String reg_id=(String)session.getAttribute("name");
		boardDTO.setReg_id(reg_id); 
		if(reg_id!=null) {
			boardService.updateBoard(boardDTO);
		}
		return "redirect:/board/getBoardContent?bid="+boardDTO.getBid();
	}
	
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
	public String deleteBoard(RedirectAttributes rttr, @RequestParam("bid") int bid) throws Exception {
		boardService.deleteBoard(bid);
		return "redirect:/board/getBoardList";
	}


}	
