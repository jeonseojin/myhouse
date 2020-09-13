package kr.green.ebook.vo;

public class ArtistVo {
	private int ch_num;
	private String ch_title;
	private String ch_member;
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
	public String getCh_member() {
		return ch_member;
	}
	public void setCh_member(String ch_member) {
		this.ch_member = ch_member;
	}
	@Override
	public String toString() {
		return "ArtistVo [ch_num=" + ch_num + ", ch_title=" + ch_title + ", ch_member=" + ch_member + "]";
	}
	
	
	
}
