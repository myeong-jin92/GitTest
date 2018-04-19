package ino.web.freeBoard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

import ino.web.freeBoard.dto.MemberInfoDto;

public interface MemberInfoMapper {
	
	  @Select("SELECT NAME, AGE, ADR, PHONE FROM MEMBERINFO")
	  public MemberInfoDto freeBoardGetList2();
	
}



