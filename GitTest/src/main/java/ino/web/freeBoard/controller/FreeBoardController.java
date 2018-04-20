package ino.web.freeBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ino.web.freeBoard.dto.FreeBoardDto;
import ino.web.freeBoard.service.FreeBoardService;


@Controller
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService freeBoardService;
	
	//기본 페이지 이동 로그인 실행 페이지
	@RequestMapping("/main.ino")
	public ModelAndView main(HttpServletRequest request){		
		ModelAndView mav = new ModelAndView();

		mav.setViewName("main");

		return mav;
	}
	//비회원 로그인 페이지 바로 게시판 메인으로 이동 권한제안..
	@RequestMapping("/nomemberLogin.ino")
	public ModelAndView nomemberLogin(HttpServletRequest request){		
		ModelAndView mav = new ModelAndView();

		List list = freeBoardService.freeBoardList();
		
		mav.setViewName("boardMain");
		mav.addObject("freeBoardList",list);
		return mav;
	}
	//회원가입 페이지 이동
	@RequestMapping("/memberSign.ino")
	public ModelAndView memberSign(HttpServletRequest request){		
		ModelAndView mav = new ModelAndView();

		mav.setViewName("main");

		return mav;
	}
	//회원 로그인 DB확인후 진행 게시판으로 이동
	@RequestMapping("/memberLogin.ino")
	public ModelAndView memberLogin(HttpServletRequest request){		
		ModelAndView mav = new ModelAndView();

		List list = freeBoardService.freeBoardList();
		
		mav.setViewName("boardMain");
		mav.addObject("freeBoardList",list);
		return mav;
	}
	//게시판 메인 페이지
	@RequestMapping("/boardmain.ino")
	public ModelAndView boardmain(HttpServletRequest request){		
		ModelAndView mav = new ModelAndView();
		
		List list = freeBoardService.freeBoardList();
		
		mav.setViewName("boardMain");
		mav.addObject("freeBoardList",list);
		return mav;
	}

	@RequestMapping("/freeBoardInsert.ino")
	public String freeBoardInsert(){
		return "freeBoardInsert";
	}
	
	@RequestMapping("/freeBoardInsertPro.ino")
	public String freeBoardInsertPro(HttpServletRequest request, FreeBoardDto dto){
		ModelAndView mav = new ModelAndView();
		
		freeBoardService.freeBoardInsertPro(dto);
		
		dto.setNum(freeBoardService.getNewNum());
		
		 return "redirect:/main.ino";
	}
	
	@RequestMapping("/freeBoardDetail.ino")
	public ModelAndView freeBoardDetail(HttpServletRequest request){
		
		int num = Integer.parseInt(request.getParameter("num"));
		FreeBoardDto dto = freeBoardService.getDetailByNum(num);

		System.out.println(dto.toString());
		
		return new ModelAndView("freeBoardDetail", "freeBoardDto", dto);
	}
	
	@RequestMapping("/freeBoardModify.ino")
	public String freeBoardModify(HttpServletRequest request, FreeBoardDto dto){
		ModelAndView mav = new ModelAndView();
		
		freeBoardService.freeBoardModify(dto);
		
		dto.setNum(freeBoardService.getNewNum());
		
		return "redirect:/main.ino";
		//return "redirect:freeBoardDetail.ino?num="+dto.getNum();
	}
		
	@RequestMapping("/freeBoardDelete.ino")
	public String FreeBoardDelete(int num){
		
		freeBoardService.FreeBoardDelete(num);
		
		return "redirect:/main.ino";
	}
	
	
	
}
