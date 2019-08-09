package com.example.xProject.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
//import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCrypt;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.xProject.model.user.dto.UserDTO;
import com.example.xProject.service.shop.GoodsCartService;
import com.example.xProject.service.user.Pager;
import com.example.xProject.service.user.UserService;

@Controller
@RequestMapping("user/*")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserService userService;
	@Inject
	GoodsCartService goodscartService;
	
	@RequestMapping("signup.do")
	public String signup() {
		return "user/join";
	}
	
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public int idCheck(@RequestParam String userid) {
		String id_check = userService.idCheck(userid);
		logger.info(userid);
		logger.info(id_check);
		int result=0;
		if(id_check != null) { //입력한 아이디가 이미 존재할 때
			result=1;
		}
		return result;
	}
	
	@RequestMapping("join.do")
	public String join(@ModelAttribute UserDTO dto) {
		dto.setPasswd(BCrypt.hashpw(dto.getPasswd(), BCrypt.gensalt())); 
		userService.join(dto);
		return "home";
	}
	
	@RequestMapping("login.do")
	public String login() {
		return "user/login";
	}
		
	  @RequestMapping("login_check.do") 
	  public ModelAndView login_check(UserDTO dto, HttpSession session, ModelAndView mav) {
		  UserDTO dto2 = userService.login(dto.getUserid());
		  if(dto2 != null) {
			  if(BCrypt.checkpw(dto.getPasswd(), dto2.getPasswd())) {
				  logger.info(dto.getPasswd()+" / "+dto2.getPasswd());
				  System.out.println(dto.getUserid()+" / "+dto2.getName());
				  session.setAttribute("userid", dto.getUserid());				  
				  session.setAttribute("name", dto2.getName());
				  session.setAttribute("passwd", dto2.getPasswd());
				  mav.setViewName("home");
				  mav.addObject("message", "success");
			  }else {				  
				  mav.setViewName("user/login");
				  mav.addObject("message", "error");
			  }
		  }else {			  
			  mav.setViewName("user/login");
			  mav.addObject("message", "error");
		  }
		  return mav;
	  }	 
	  
	  @RequestMapping("logout.do")
	  public ModelAndView logout(HttpSession session, ModelAndView mav) {
		  session.invalidate();
		  System.out.println("logout!");
		  mav.setViewName("user/login");
		  mav.addObject("message", "logout");
		  return mav;
	  }
	  
	  @RequestMapping("list.do")
	  public ModelAndView userList(@RequestParam(defaultValue="name") String search_option,
				@RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="1") int curPage,
				ModelAndView mav, HttpSession session) {
		  String userid = (String)session.getAttribute("userid");
		  Map<String,Object> map = new HashMap<>();
		  int count = userService.countUsers(search_option,keyword);
		  Pager pager = new Pager(count,curPage);
		  int start = pager.getPageBegin();
		  int end = pager.getPageEnd();
		  if(userid!=null && userid.equals("admin")) {
			  List<UserDTO> list = userService.userList(search_option,keyword,start,end);
			  map.put("list", list);
			  map.put("count", list.size());
			  map.put("pager", pager);
			  map.put("search_option", search_option);
			  map.put("keyword", keyword);
			  mav.setViewName("user/user_list");
			  mav.addObject("map", map);
		  }
		  return mav;
	  }
	  
	  @RequestMapping("view.do")
	  public ModelAndView myPage(String userid, ModelAndView mav) {
		  mav.setViewName("user/mypage");
		  mav.addObject("dto", userService.viewUser(userid));
		  return mav;
	  }
	  
	  @RequestMapping("update.do")
	  public String update(@ModelAttribute UserDTO dto) {		  
		  dto.setPasswd(BCrypt.hashpw(dto.getPasswd(), BCrypt.gensalt()));
		  userService.update(dto);  
		  return "home";
	  }
	  
	  @RequestMapping("dropout.do") //회원탈퇴
	  public String dropout(@RequestParam String userid, HttpSession session) {
		  userService.dropout(userid);
		  session.invalidate();
		  return "home";
	  }
	  
	  @RequestMapping("delete.do") //회원관리 페이지에서 회원 삭제(by 관리자)
	  public String deleteUser(@RequestParam String userid) {
		  userService.deleteUser(userid);
		  return "redirect:/user/list.do";
	  }
}
