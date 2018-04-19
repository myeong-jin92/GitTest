package ino.web.freeBoard.dto;

import org.apache.ibatis.type.Alias;

@Alias("okMallCouponDto")
public class OkMallCouponDto {

	private int userno;
	private String couponname;
	private int dcprice;
	private double dcpercent;
	private double dc;
	private String brand;
	private String kind;
	
	public OkMallCouponDto() {}
	
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getCouponname() {
		return couponname;
	}
	public void setCouponname(String couponname) {
		this.couponname = couponname;
	}
	public int getDcprice() {
		return dcprice;
	}
	public void setDcprice(int dcprice) {
		this.dcprice = dcprice;
	}
	public double getDcpercent() {
		return dcpercent;
	}
	public void setDcpercent(double dcpercent) {
		this.dcpercent = (dcpercent/100);
	}
	public double getDc() {
		return ((double)dcprice + dcpercent);
	}
	public void setDc(double dc) {
		this.dc = dc;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}

	@Override
	public String toString() {
		return "okMallCouponDto [USERNO=" + userno 
				+ ", COUPONNAME=" + couponname 
				+ ", DCPRICE=" + dcprice 
				+ ", DCPERCENT=" + dcpercent 
				+ ", KIND=" + kind 
				+ ", BRAND=" + brand 
				+ ", dc=" + getDc() + "]";
	}
	
}
