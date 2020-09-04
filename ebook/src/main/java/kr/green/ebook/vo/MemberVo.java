package kr.green.ebook.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberVo {
	private int m_num;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String gender;
	private String isDel;
	private int coin;
	private String auth;
	private Date signup_date;
	
	
	//get,set
	public String getSignup_date() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return transFormat.format(signup_date);
	}
	public void setSignup_date(Date signup_date) {
		this.signup_date = signup_date;
	}
	public void setSignup_date(String signup_date) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			this.signup_date = transFormat.parse(signup_date);
		}catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	public int getCoin() {
		return coin;
	}
	public void setCoin(int coin) {
		this.coin = coin;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	@Override
	public String toString() {
		return "MemberVo [m_num=" + m_num + ", id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email
				+ ", gender=" + gender + ", isDel=" + isDel + ", coin=" + coin + ", auth=" + auth + ", signup_date="
				+ signup_date + "]";
	}

	
	
}
