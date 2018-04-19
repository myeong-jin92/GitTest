package ino.web.freeBoard.dto;

import org.apache.ibatis.type.Alias;

@Alias("OkMallProcomDto")
public class OkMallProcomDto {

	private int comnum;
	private String comvalue;
	private int comgrade;
	private String comname;
	private String comdate;
	
	
	public OkMallProcomDto() {}
	
	public int getComnum() {
		return comnum;
	}
	public void setComnum(int comnum) {
		this.comnum = comnum;
	}
	public String getComvalue() {
		return comvalue;
	}
	public void setComvalue(String comvalue) {
		this.comvalue = comvalue;
	}
	public int getComgrade() {
		return comgrade;
	}
	public void setComgrade(int comgrade) {
		this.comgrade = comgrade;
	}
	public String getComname() {
		return comname;
	}
	public void setComname(String comname) {
		this.comname = comname;
	}
	public String getComdate() {
		return comdate;
	}
	public void setComdate(String comdate) {
		this.comdate = comdate;
	}

	@Override
	public String toString() {
		return "OkMallProcomDto ["
				+ "comnum=" + comnum 
				+ ", comvalue=" + comvalue 
				+ ", comgrade=" + comgrade
				+ ", comdate=" + comdate
				+ ", comname=" + comname + "]";
	}
	
}
