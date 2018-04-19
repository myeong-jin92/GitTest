package ino.web.freeBoard.dto;

import org.apache.ibatis.type.Alias;

@Alias("freeBoardDto")
public class FreeBoardDto {

	private int num1;
	private int num;
	private String title;
	private String name;
	private String regdate;
	private String content;
	private int readcnt;
	
	public FreeBoardDto() {}
	
	public int getNum1() {
		return num1;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	@Override
	public String toString() {
		return "FreeBoardDto [num1=" + num1 + ", num=" + num + ", title=" + title + ", name=" + name + ", regdate=" + regdate
				+ ", content=" + content + ", readcnt=" + readcnt + "]";
	}
	
}
