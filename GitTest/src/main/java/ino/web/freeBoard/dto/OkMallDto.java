package ino.web.freeBoard.dto;

import org.apache.ibatis.type.Alias;

@Alias("okMallDto")
public class OkMallDto {

	private String name;
	private int price;
	private double discount;
	private String brand;
	private String kind;
	public int userno = 0;
	
	public OkMallDto() {}
	
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
		this.discount = (discount/100);
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getDp() {
		return (int)(price - (int)(price*discount));
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}

	@Override
	public String toString() {
		return "OkMallDto [name=" + name + ", price=" + price
				+ ", discount=" + discount + ", dp=" + getDp() 
				+ ", brand=" + brand + ""
				+ ", kind=" + kind + "]";
	}
	
}
