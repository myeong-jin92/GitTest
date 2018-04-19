package ino.web.freeBoard.dto;

import org.apache.ibatis.type.Alias;

@Alias("okMallPointDto")
public class OkMallPointDto {

	private int userno;
	private int point;
	
	public OkMallPointDto() {}
	
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}


	@Override
	public String toString() {
		return "okMallPointDto [USERNO=" + userno + ""
				+ ", POINT=" + point + "]";
	}
	
}
