package kr.green.ebook.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BookeventVo {
	private int ev_num;
	private String ev_title;
	private String ev_img;
	private String ev_t_title;
	private String ev_member;
	private Date ev_date;
	private Date ev_Deldate;
	private String ev_banner;
	private String ev_page;
	private String ev_engtitle;
	
	
	public String getEv_engtitle() {
		return ev_engtitle;
	}
	public void setEv_engtitle(String ev_engtitle) {
		this.ev_engtitle = ev_engtitle;
	}
	public String getEv_page() {
		return ev_page;
	}
	public void setEv_page(String ev_page) {
		this.ev_page = ev_page;
	}
	public String getEv_banner() {
		return ev_banner;
	}
	public void setEv_banner(String ev_banner) {
		this.ev_banner = ev_banner;
	}
	public String getEv_date() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		return transFormat.format(ev_date);
	}
	public void setEv_date(String ev_date) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			this.ev_date = transFormat.parse(ev_date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public void setEv_date(Date ev_date) {
		this.ev_date = ev_date;
	}
	public Date getEv_Deldate() {
		return ev_Deldate;
	}
	public void setEv_Deldate(Date ev_Deldate) {
		this.ev_Deldate = ev_Deldate;
	}
	public String getEv_member() {
		return ev_member;
	}
	public void setEv_member(String ev_member) {
		this.ev_member = ev_member;
	}
	public int getEv_num() {
		return ev_num;
	}
	public void setEv_num(int ev_num) {
		this.ev_num = ev_num;
	}
	public String getEv_title() {
		return ev_title;
	}
	public void setEv_title(String ev_title) {
		this.ev_title = ev_title;
	}
	public String getEv_img() {
		return ev_img;
	}
	public void setEv_img(String ev_img) {
		this.ev_img = ev_img;
	}
	public String getEv_t_title() {
		return ev_t_title;
	}
	public void setEv_t_title(String ev_t_title) {
		this.ev_t_title = ev_t_title;
	}
	@Override
	public String toString() {
		return "EventVo [ev_num=" + ev_num + ", ev_title=" + ev_title + ", ev_img=" + ev_img + ", ev_t_title="
				+ ev_t_title + ", ev_member=" + ev_member + ", ev_date=" + ev_date + ", ev_Deldate=" + ev_Deldate
				+ ", ev_banner=" + ev_banner + ", ev_page=" + ev_page + ", ev_engtitle=" + ev_engtitle + "]";
	}

	
}
