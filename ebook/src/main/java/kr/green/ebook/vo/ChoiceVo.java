package kr.green.ebook.vo;

public class ChoiceVo {
	private int ch_num;
	private String ch_title;
	private String ch_id;
	public int getCh_num() {
		return ch_num;
	}
	public void setCh_num(int ch_num) {
		this.ch_num = ch_num;
	}
	public String getCh_title() {
		return ch_title;
	}
	public void setCh_title(String ch_title) {
		this.ch_title = ch_title;
	}
	public String getCh_id() {
		return ch_id;
	}
	public void setCh_id(String ch_id) {
		this.ch_id = ch_id;
	}
	@Override
	public String toString() {
		return "ChoiceVo [ch_num=" + ch_num + ", ch_title=" + ch_title + ", ch_id=" + ch_id + "]";
	}
	
	
}
