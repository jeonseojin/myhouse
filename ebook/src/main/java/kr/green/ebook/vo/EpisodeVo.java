package kr.green.ebook.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EpisodeVo {
	private int e_num;
	private String e_title;
	private Date e_date;
	private String e_img;
	private int e_coin;
	private String e_t_title;
	private int e_edition;
	
	
	public int getE_num() {
		return e_num;
	}
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
	}
	public String getE_date() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		return transFormat.format(e_date);
	}
	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}
	public void setE_date(String e_date) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			this.e_date = transFormat.parse(e_date);
		}catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public String getE_img() {
		return e_img;
	}
	public void setE_img(String e_img) {
		this.e_img = e_img;
	}
	public int getE_coin() {
		return e_coin;
	}
	public void setE_coin(int e_coin) {
		this.e_coin = e_coin;
	}
	
	public String getE_t_title() {
		return e_t_title;
	}
	public void setE_t_title(String e_t_title) {
		this.e_t_title = e_t_title;
	}
	
	public int getE_edition() {
		return e_edition;
	}
	public void setE_edition(int e_edition) {
		this.e_edition = e_edition;
	}
	@Override
	public String toString() {
		return "EpisodeVo [e_num=" + e_num + ", e_title=" + e_title + ", e_date=" + e_date + ", e_img=" + e_img
				+ ", e_coin=" + e_coin + ", e_t_title=" + e_t_title + ", e_edition=" + e_edition + "]";
	}
	
	
	
	
	
}
