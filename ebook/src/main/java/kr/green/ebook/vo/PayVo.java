package kr.green.ebook.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PayVo {
	private int p_num;//총 충전번호
	private String p_member;//사용/충전 회원
	private Date p_date;//충전날짜
	private Date p_usedate;//사용날짜
	private String p_title;//충전한 웹툰제목
	private String p_edition;//충전한 연재 번호
	private int p_price;//충전 금액
	private int p_charging;//충전한 코인
	private int p_coin;//사용한 코인
	private int p_point;//덤으로 주는 충전 포인트
	private String p_one;//첫구매작품
	
	
	public String getP_one() {
		return p_one;
	}
	public void setP_one(String p_one) {
		this.p_one = p_one;
	}
	public int getP_charging() {
		return p_charging;
	}
	public void setP_charging(int p_charging) {
		this.p_charging = p_charging;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_member() {
		return p_member;
	}
	public void setP_member(String p_member) {
		this.p_member = p_member;
	}
	public String getP_date() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return transFormat.format(p_date);
	}
	public void setP_date(String p_date) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			this.p_date = transFormat.parse(p_date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	public Date getP_usedate() {
		return p_usedate;
	}
	public void setP_usedate(Date p_usedate) {
		this.p_usedate = p_usedate;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_edition() {
		return p_edition;
	}
	public void setP_edition(String p_edition) {
		this.p_edition = p_edition;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_coin() {
		return p_coin;
	}
	public void setP_coin(int p_coin) {
		this.p_coin = p_coin;
	}
	public int getP_point() {
		return p_point;
	}
	public void setP_point(int p_point) {
		this.p_point = p_point;
	}
	@Override
	public String toString() {
		return "PayVo [p_num=" + p_num + ", p_member=" + p_member + ", p_date=" + p_date + ", p_usedate=" + p_usedate
				+ ", p_title=" + p_title + ", p_edition=" + p_edition + ", p_price=" + p_price + ", p_charging="
				+ p_charging + ", p_coin=" + p_coin + ", p_point=" + p_point + ", p_one=" + p_one + "]";
	}

	
}
