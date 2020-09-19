package kr.green.ebook.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class EpisodeVo {
	private int e_num;
	private String e_t_title;
	private String e_title;
	private Date e_date;
	private int e_coin;
	private String e_img;
	private String e_edition;
	
	//get&set
	public int getE_num() {
		return e_num;
	}
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}
	public String getE_t_title() {
		return e_t_title;
	}
	public void setE_t_title(String e_t_title) {
		this.e_t_title = e_t_title;
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
	public int getE_coin() {
		return e_coin;
	}
	public void setE_coin(int e_coin) {
		this.e_coin = e_coin;
	}
	public String getE_img() {
		return e_img;
	}
	public void setE_img(String e_img2) {
		this.e_img = e_img2;
	}
	

	public String getE_edition() {
		return e_edition;
	}
	public void setE_edition(String e_edition) {
		this.e_edition = e_edition;
	}
	@Override
	public String toString() {
		return "EpisodeVo [e_num=" + e_num + ", e_t_title=" + e_t_title + ", e_title=" + e_title + ", e_date=" + e_date
				+ ", e_coin=" + e_coin + ", e_img=" + e_img + ", e_edition=" + e_edition + "]";
	}
	
	// tostring (찍어보는역할)

	public boolean iscontain(ArrayList<PayVo> list) {
		if(list == null || list.size() == 0)
			return false;
		for(PayVo tmp : list) {
			if(tmp.getP_title()!=null && tmp.getP_edition() !=null && tmp.getP_title().equals(e_t_title) && tmp.getP_edition().equals(e_edition) )
				return true;
		}
		return false;
	}
}
