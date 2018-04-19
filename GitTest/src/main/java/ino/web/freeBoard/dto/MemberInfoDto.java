package ino.web.freeBoard.dto;

import org.apache.ibatis.type.Alias;

@Alias("memberinfoDto")
public class MemberInfoDto {

	private String name;
	private int age;
	private String adr;
	private String phone;
	
	public MemberInfoDto() {}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAdr() {
		return adr;
	}

	public void setAdr(String adr) {
		this.adr = adr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "MemberInfoDto [name=" + name + ", age=" + age
				+ ", adr=" + adr + ", phone=" + phone + "]";
	}
	
}
