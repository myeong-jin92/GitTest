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
import ino.web.freeBoard.dto.MemberInfoDto;
import ino.web.freeBoard.service.MemberInfoService;
import ino.web.freeBoard.dto.OkMallDto;
import ino.web.freeBoard.dto.OkMallPointDto;
import ino.web.freeBoard.dto.OkMallCouponDto;
import ino.web.freeBoard.dto.OkMallBasketDto;
import ino.web.freeBoard.dto.OkMallBuylistDto;
import ino.web.freeBoard.dto.OkMallProcomDto;
import ino.web.freeBoard.service.OkMallService;

@Controller
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService freeBoardService;
	@Autowired
	private MemberInfoService memberInfoService;
	@Autowired
	private OkMallService okmallService;
	
	
	@RequestMapping("/main.ino")
	public ModelAndView main(HttpServletRequest request){		
		ModelAndView mav = new ModelAndView();
		
		
		List list = freeBoardService.freeBoardList();
		//List list = freeBoardService.freeBoardList();
		
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
	
	@RequestMapping("/memberInfoSearch.ino")
	public ModelAndView memberInfoSearch(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memberInfoSearch");
		//mav.addObject("freeBoardList",list);
		return mav;
	}
	
	@RequestMapping("/memberInfoDetail.ino")
	public ModelAndView memberInfoDetail(HttpServletRequest request){
		
		String name = request.getParameter("name");
		System.out.println(name);
		
		MemberInfoDto dto = memberInfoService.getDetailByName(name);
		
		System.out.println(dto.toString());
		
		return new ModelAndView("memberInfoDetail", "memberInfoDto", dto);
	}
	
	@RequestMapping("/okmall.ino")
	public ModelAndView okmall(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("okmall");
		//mav.addObject("freeBoardList",list);
		return mav;
	}
	
	@RequestMapping("/okmallname.ino")
	public ModelAndView okmallname(HttpServletRequest request){
		
		String name = request.getParameter("name");
		List list = okmallService.okmallList(name);
		//List list = freeBoardService.freeBoardList();
		
		System.out.println(list);
		
		return new ModelAndView("okmallname", "okmallList", list);
		
		//mav.setViewName("okmallname");
		//mav.addObject("okmallList",list);
		
	}
	
	@RequestMapping("/okmalldiscount.ino")
	public ModelAndView okmalldiscount(HttpServletRequest request){
		
		int discount = Integer.parseInt(request.getParameter("discount"));
		List list = okmallService.okmalldiacountList(discount);
		//List list = freeBoardService.freeBoardList();
		
		System.out.println(list);
		
		return new ModelAndView("okmallname", "okmallList", list);
		
		//mav.setViewName("okmallname");
		//mav.addObject("okmallList",list);
		
	}
	
	@RequestMapping("/okmalldetail.ino")
	public ModelAndView okmalldetail(HttpServletRequest request){
		//System.out.println("에러확인 1");
		String name = request.getParameter("name");
		int userno = 0;
		//System.out.println("에러확인 2 값 확인"+name);
		OkMallDto dto = okmallService.getDetailByName(name);
		//System.out.println("에러확인 3");
		OkMallPointDto pdto = okmallService.getPointByUserno(userno);
		//System.out.println("에러확인 4");
		List cdto = okmallService.getCouponByUserno(dto);
		//System.out.println("에러확인 5");
		List pcdto = okmallService.getProcomByName(name);
		//System.out.println("에러확인 6");
		
		System.out.println(dto.toString());
		System.out.println(pdto.toString());
		System.out.println(cdto.toString());
		System.out.println(pcdto.toString());
		
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("dto", dto);
		result.put("pdto", pdto);
		result.put("cdto", cdto);
		result.put("pcdto", pcdto);
		
		return new ModelAndView("okmalldetail", "okMallDto", result);
	}
	
	@RequestMapping("/okmallbuy.ino")
	public String okmallbuy(HttpServletRequest request, OkMallPointDto pdto, OkMallCouponDto cdto, OkMallBuylistDto buydto){
		ModelAndView mav = new ModelAndView();
		System.out.println("buy 컨트롤러 도착");
		//System.out.println("coupon : "+request.getParameter("coupon"));
		//System.out.println("point : "+request.getParameter("point"));
		int userno = 0;
		double dc = Double.parseDouble(request.getParameter("coupon"));
		int point = Integer.parseInt(request.getParameter("point"));
		
		//System.out.println("변수 설정 완료"+dc+"----" +point);
		
		if(dc == 0){
		}else{
			okmallService.delectcoupon(dc);
		}
				
		okmallService.updatepoint(pdto);
		pdto.setUserno(userno);
		pdto.setPoint(point);
		
		System.out.println("여기는 컨트롤"+buydto.toString());
		if(buydto.getName() == null){
			buydto.setName("포인트사용");
			buydto.setBrand(" ");
			buydto.setCouponname(" ");
			buydto.setKind(" ");
		}
		okmallService.okmallbuylistInsert(buydto);
		
//(freeBoardService.getNewNum()); 이게만약userno와 dc 로 name을가지고 오는 셀렉문이면?
		
		return "redirect:/okmall.ino";
	}
	
	//okmallbasket 테이블 불러와서 품목 나열
	@RequestMapping("/okmallbasket.ino")
	public ModelAndView okmallbasket(HttpServletRequest request){
		
		int userno = 0;
		
		List list = okmallService.getbasketUserno(userno);
		System.out.println("테이블 데이터"+list);
		
		List clist = okmallService.getCouponByno(userno);
		System.out.println("쿠폰"+clist.toString());
		
		OkMallPointDto pdto = okmallService.getPointByUserno(userno);
		System.out.println(pdto.toString());
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("pdto", pdto);
		result.put("clist", clist);
		
		
		
		
		return new ModelAndView("okmallbasket", "okmallList", result);
		
		
		//ModelAndView mav = new ModelAndView();
		//mav.setViewName("okmallbasket");
		//return mav; 
		 
		 
		
	}
	
	
	@RequestMapping("/okmallbasketInsert.ino")
	public String okmallbasketInsert(HttpServletRequest request, OkMallBasketDto bdto){
		//System.out.println("컨트롤 도착1");
		ModelAndView mav = new ModelAndView();
		//System.out.println("ModelAndView mav 생성1");
		//System.out.println(bdto.toString()+"위1");
		
		
		System.out.println(bdto.toString());
		okmallService.okmallbasketInsert(bdto);
		
		
		return "redirect:/okmallbasket.ino";
	}
	
	@RequestMapping("/okmallbasketUpdate.ino")
	public String okmallbasketUpdate(HttpServletRequest request, OkMallBasketDto bdto){
		//System.out.println("여기는 왜 안와???");
		ModelAndView mav = new ModelAndView();
		
		
		//request.getParameter("couponname1")
		
		System.out.println("값확인!!update" +bdto);
		//System.out.println("업데이트 성공???");

		okmallService.okmallbasketUpdate(bdto);
		
		System.out.println("됬어!!!update" +bdto);
		
		return "redirect:/okmallbasket.ino";
	}
	
	@RequestMapping("/okmallbasketDelete.ino")
	public String okmallbasketDelete(HttpServletRequest request){
		//System.out.println("여기는 왜 안와???");
		ModelAndView mav = new ModelAndView();
		
		String name = request.getParameter("name");
		//String count = request.getParameter("count");
		System.out.println("값확인!!delete" +name);

		okmallService.okmallbasketDelete(name);
		
		System.out.println("됬어!!!delete");
		
		return "redirect:/okmallbasket.ino";
	}
	
	@RequestMapping("/okmallbuylist.ino")
	public ModelAndView okmallbuylist(HttpServletRequest request){
		
		int userno = 0;
		//System.out.println(userno);
		List list = okmallService.getbuylistUserno(userno);
		System.out.println("buylist 데이터"+list);
		
		return new ModelAndView("okmallbuylist", "okmallList", list );
	}
	
	@RequestMapping("/okmallrefund.ino")
	public String okmallrefund(HttpServletRequest request, OkMallPointDto pdto, OkMallBuylistDto buydto){
		//System.out.println("환불 컨트롤 오나??");
		ModelAndView mav = new ModelAndView();
		//System.out.println("환불 MAV 오나??");
		int userno = 0;
		int point = Integer.parseInt(request.getParameter("point"));
		String name = request.getParameter("name");
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		//System.out.println("포인트 환불 "+point);
		okmallService.refundpoint(pdto);
		pdto.setUserno(userno);
		pdto.setPoint(point);
		
		okmallService.delectbuylist(buydto);
		buydto.setName(name);
		buydto.setNum(num);
		
		
		
		return "redirect:/okmallbuylist.ino";
	}
	
	@RequestMapping("/okmallcommentInsert.ino")
	public String okmallcommentInsert(HttpServletRequest request, OkMallProcomDto pcdto){
		//System.out.println("댓글등록 컨트롤");
		ModelAndView mav = new ModelAndView();
		
		int comgrade = Integer.parseInt(request.getParameter("comgrade"));
		String comvalue = request.getParameter("comvalue");
		String comname = request.getParameter("comname");
		
		pcdto.setComname(comname);
		pcdto.setComvalue(comvalue);
		pcdto.setComgrade(comgrade);
		//System.out.println("댓글등록 컨트롤1");
		okmallService.okmallcommentInsert(pcdto);
		System.out.println(pcdto.toString());
		//System.out.println("댓글등록 컨트롤2");
		return "redirect:/okmalldetail.ino?name="+pcdto.getComname();
	}
	
	
}
