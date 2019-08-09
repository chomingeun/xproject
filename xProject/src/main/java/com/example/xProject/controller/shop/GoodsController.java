package com.example.xProject.controller.shop;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.xProject.model.shop.dto.GoodsDTO;
import com.example.xProject.service.shop.GoodsService;
import com.example.xProject.service.shop.Pager;

@Controller
@RequestMapping("shop/goods/*")
public class GoodsController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Inject
	GoodsService goodsService;
	
	@RequestMapping("list.do")//세부적인 url pattern
	public ModelAndView list(@RequestParam(defaultValue = "gname") String search_option,
		    @RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue="1") int curPage, ModelAndView mav) {
		int count = goodsService.countGoods(search_option,keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<GoodsDTO> list = goodsService.listGoods(search_option,keyword,start,end);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", list.size());
		map.put("pager", pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);		
		
		mav.setViewName("shop/goods_list");
		mav.addObject("map", map);
		return mav;	
	}
	
	@RequestMapping("list2.do")//세부적인 url pattern
	public ModelAndView list2(@RequestParam(defaultValue = "gname") String search_option,
		    @RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue="1") int curPage, ModelAndView mav) {
		int count = goodsService.countGoods(search_option,keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<GoodsDTO> list = goodsService.listGoods2(search_option,keyword,start,end);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", list.size());
		map.put("pager", pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);		
		
		mav.setViewName("shop/goods_list2");		
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("list3.do")//세부적인 url pattern
	public ModelAndView list3(@RequestParam(defaultValue = "gname") String search_option,
		    @RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue="1") int curPage, ModelAndView mav) {
		int count = goodsService.countGoods(search_option,keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<GoodsDTO> list = goodsService.listGoods3(search_option,keyword,start,end);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", list.size());
		map.put("pager", pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);		
		
		mav.setViewName("shop/goods_list3");		
		mav.addObject("map", map);
		return mav;
	}	
	
	@RequestMapping("detail/{good_id}")
	public ModelAndView detail(@PathVariable String good_id, ModelAndView mav) {
		mav.setViewName("shop/goods_detail");
		mav.addObject("dto", goodsService.detailGoods(good_id));
		return mav;
	}
	@RequestMapping("write.do")
	public String write() {
		return "shop/goods_write";
	}
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute GoodsDTO dto) throws Exception {
		String filename = "-";
		
		if(!dto.getFile1().isEmpty()) {			
			filename=dto.getFile1().getOriginalFilename();
			try {
				String path = "D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core"
						+ "\\tmp0\\wtpwebapps\\xProject\\WEB-INF\\views\\img\\";
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		logger.info(filename);
		dto.setImg_path(filename);
		goodsService.insertGoods(dto);
		return "redirect:/shop/goods/list.do";
	}
	@RequestMapping("edit/{good_id}")
	public ModelAndView edit(@PathVariable("good_id")
	String good_id, ModelAndView mav) {		
		mav.setViewName("shop/goods_edit");		
		mav.addObject("dto",goodsService.detailGoods(good_id));
		return mav;
	}
	@RequestMapping("update.do")
	public String update(GoodsDTO dto) {
		String filename = "-";
		
		if(!dto.getFile1().isEmpty()) {
			
			filename = dto.getFile1().getOriginalFilename();
			
			try {
				String path = "D:\\work\\.metadata\\.plugins\\"
						 + "org.eclipse.wst.server.core\\tmp0\\" 
						 + "wtpwebapps\\xProject\\WEB-INF\\views\\img\\";
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setImg_path(filename);

		}else {
			GoodsDTO dto2 = goodsService.detailGoods(dto.getGood_id());
			dto.setImg_path(dto2.getImg_path());
			logger.info(dto2.getImg_path());
		}
		goodsService.updateGoods(dto);
		return "redirect:/shop/goods/list.do";
	}
	@RequestMapping("delete.do")
	public String delete(@RequestParam String good_id) {
		
		String filename = goodsService.fileInfo(good_id);
		System.out.println("첨부파일 이름 : " + filename);
		if(filename != null && filename.equals("-")) {
			String path = "D:\\work\\.metadata\\.plugins\\ "
					 + "org.eclipse.wst.server.core\\tmp0\\ " 
					 + "wtpwebapps\\xProject\\WEB-INF\\views\\img\\";
			File f = new File(path+filename);
			System.out.println("파일존재여부 : " + f.exists());
			if(f.exists()) {
				f.delete();
				System.out.println("삭제되었습니다.");
			}
		}
		goodsService.deleteGoods(good_id);
		return "redirect:/shop/goods/list.do";
	}
	
	@RequestMapping("sale")
	public ModelAndView listOnSale(ModelAndView mav) {
		List<GoodsDTO> list = goodsService.listOnSale();
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", list.size());
		
		mav.setViewName("shop/goods_on_sale");
		mav.addObject("map", map);
		return mav;
	}
}
