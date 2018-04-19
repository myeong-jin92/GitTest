package ino.web.freeBoard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

import ino.web.freeBoard.dto.OkMallDto;

public interface OkMallMapper {
	
	  @Select("SELECT NAME, PRICE, DISCOUNT, BRAND FROM "
	  		+ "(SELECT NAME, PRICE, DISCOUNT, BRAND"
	  		+ "FROM NIKE "
	  		+ "UNION ALL"
	  		+ "SELECT NAME, PRICE, DISCOUNT, BRAND"
	  		+ " FROM ADIDAS "
	  		+ "UNION ALL"
	  		+ "SELECT NAME, PRICE, DISCOUNT, BRAND"
	  		+ "FROM NEWBALANCE) "
          )
	  public OkMallDto okMallGetList2();
	
}



