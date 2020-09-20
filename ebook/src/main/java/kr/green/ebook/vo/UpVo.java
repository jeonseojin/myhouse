package kr.green.ebook.vo;

public class UpVo {
	private int up_num;
	private String up_title;
	private String up_id;
	public int getUp_num() {
		return up_num;
	}
	public void setUp_num(int up_num) {
		this.up_num = up_num;
	}
	public String getUp_title() {
		return up_title;
	}
	public void setUp_title(String up_title) {
		this.up_title = up_title;
	}
	public String getUp_id() {
		return up_id;
	}
	public void setUp_id(String up_id) {
		this.up_id = up_id;
	}
	@Override
	public String toString() {
		return "UpVo [up_num=" + up_num + ", up_title=" + up_title + ", up_id=" + up_id + "]";
	}

}
