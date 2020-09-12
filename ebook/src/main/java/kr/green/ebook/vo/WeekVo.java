package kr.green.ebook.vo;

public class WeekVo {
	private int w_code;
	private String week;
	
	public int getW_code() {
		return w_code;
	}
	public void setW_code(int w_code) {
		this.w_code = w_code;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	@Override
	public String toString() {
		return "week [w_code=" + w_code + ", week=" + week + "]";
	}
	
	
}
