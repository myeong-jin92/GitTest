package ino.web.freeBoard.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ino.web.freeBoard.dto.MemberInfoDto;
import ino.web.freeBoard.mapper.MemberInfoMapper;

@Service
public class MemberInfoService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberInfoDto getDetailByName(String name){
		return sqlSessionTemplate.selectOne("memberInfoDetailByName", name);
	}
	
}
