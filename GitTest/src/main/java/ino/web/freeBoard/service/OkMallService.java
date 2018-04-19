package ino.web.freeBoard.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ino.web.freeBoard.dto.FreeBoardDto;
import ino.web.freeBoard.dto.MemberInfoDto;
import ino.web.freeBoard.dto.OkMallBasketDto;
import ino.web.freeBoard.dto.OkMallBuylistDto;
import ino.web.freeBoard.dto.OkMallDto;
import ino.web.freeBoard.dto.OkMallPointDto;
import ino.web.freeBoard.dto.OkMallCouponDto;
import ino.web.freeBoard.dto.OkMallProcomDto;
import ino.web.freeBoard.mapper.OkMallMapper;

@Service
public class OkMallService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List okmallList(String name){
		List list = new ArrayList();
		list = sqlSessionTemplate.selectList("okMallGetList", name);
		return list;
	}
	
	public List okmalldiacountList(int discount){
		List list = new ArrayList();
		list = sqlSessionTemplate.selectList("okMalldiscountGetList", discount);
		return list;
	}
	
	public OkMallDto getDetailByName(String name){
		return sqlSessionTemplate.selectOne("okMallDetailByName", name);
	}
	
	public OkMallPointDto getPointByUserno(int userno){
		return sqlSessionTemplate.selectOne("okMallPointByUserno", userno);
	}
	
	public List getCouponByUserno(OkMallDto dto){
		List list = new ArrayList();
		list = sqlSessionTemplate.selectList("okMallCouponByUserno", dto);
		return list;
				//selectList("okMallCouponByUserno", userno, brand, kind);
				//selectOne("okMallCouponByUserno", userno, brand, kind);
	}
	
	public void updatepoint(OkMallPointDto pdto){
		sqlSessionTemplate.update("updatepoint", pdto);
	}
	
	public void delectcoupon(double dc){
		sqlSessionTemplate.delete("delectcoupon", dc);
	}
	
	public void okmallbasketInsert(OkMallBasketDto bdto){
		sqlSessionTemplate.insert("okmallbasketInsert",bdto);
	}
	
	public List getbasketUserno(int userno){
		List list = new ArrayList();
		list = sqlSessionTemplate.selectList("getbasketUserno", userno);
		return list;
	}
	
	public List getCouponByno(int userno){
		List list = new ArrayList();
		list = sqlSessionTemplate.selectList("okMallCouponByno", userno);
		return list;
	}
	
	public void okmallbasketUpdate(OkMallBasketDto bdto){
		sqlSessionTemplate.update("updateBasket", bdto);
	}
	
	public void okmallbasketDelete(String name){
		sqlSessionTemplate.delete("okmallbasketDelete", name);
	}
	
	public void okmallbuylistInsert(OkMallBuylistDto buydto){
		System.out.println("여기는 서비스 "+ buydto.toString());
		sqlSessionTemplate.insert("okmallbuylistInsert",buydto);
	}
	
	public List getbuylistUserno(int userno){
		List list = new ArrayList();
		list = sqlSessionTemplate.selectList("getbuylistUserno", userno);
		return list;
	}
	
	public void refundpoint(OkMallPointDto pdto){
		sqlSessionTemplate.update("refundpoint", pdto);
	}
	
	public void delectbuylist(OkMallBuylistDto buydto){
		sqlSessionTemplate.delete("delectbuylist", buydto);
	}
	
	public void okmallcommentInsert(OkMallProcomDto pcdto){
		sqlSessionTemplate.insert("okmallcommentInsert",pcdto);
	}
	
	public List getProcomByName(String name){
		List list = new ArrayList();
		list = sqlSessionTemplate.selectList("getProcomByName", name);
		return list;
	}
	
	
	
	
}
