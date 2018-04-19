package ino.web.freeBoard.dto;

import org.apache.ibatis.type.Alias;

@Alias("okMallBasketDto")
public class OkMallBasketDto {

	public int userno = 0;
	private String name;
	private int price;
	private double discount;
	private String brand;
	private String kind;
	private String couponname;
	private double coupondc;
	private int point;
	private int count;
	
	public OkMallBasketDto() {}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
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
	public String getCouponname() {
		return couponname;
	}
	public void setCouponname(String couponname) {
		this.couponname = couponname;
	}
	public double getCoupondc() {
		return coupondc;
	}
	public void setCoupondc(double coupondc) {
		this.coupondc = coupondc;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getDp() {
		return (int)(price - (int)(price*discount));
	}

	@Override
	public String toString() {
		return "OkMallBasketDto ["
				+ "  userno=" + userno
				+ ", name=" + name 
				+ ", price=" + price
				+ ", discount=" + discount  
				+ ", brand=" + brand
				+ ", kind=" + kind
				+ ", couponname=" + couponname
				+ ", coupondc=" + coupondc
				+ ", point=" + point
				+ ", count=" + count
				+ ", dp=" + getDp()
				+ "]";
	}
	
}
