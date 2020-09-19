package kr.green.ebook.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ClaimVo {
	private int cl_num;//문의 번호 
	private String cl_title;//문의 제목 
	private String cl_content;//문의내용/답변내용
	private String cl_member;//문의자/답변자(관리자) 
	private String cl_auth;//문의는 USER/답변은 ADMIN 
	private String cl_file;//문의하는 첨부파일 
	private Date cl_date;//문의 날짜/답변날짜 
	private String cl_type;//문의 종류 
	private int cl_answer;//답변(번호)
	 
	 
	public int getCl_answer() {
		return cl_answer;
	}
	public void setCl_answer(int cl_answer) {
		this.cl_answer = cl_answer;
	}
	public String getCl_content() {
		return cl_content;
	}
	public void setCl_content(String cl_content) {
		this.cl_content = cl_content;
	}
	public int getCl_num() { 
		return cl_num; 
	} 
	public void setcl_num(int cl_num) { 
		this.cl_num = cl_num; 
	} 
	public String getCl_title() { 
		return cl_title; 
	} 
	public void setCl_title(String cl_title) { 
		this.cl_title = cl_title; 
	} 
	public String getCl_member() { 
		return cl_member; 
	} 
	public void setCl_member(String cl_member) { 
		this.cl_member = cl_member; 
	} 
	public String getCl_auth() { 
		return cl_auth; 
	} 
	public void setCl_auth(String cl_auth) { 
		this.cl_auth = cl_auth; 
	} 
	public String getCl_file() { 
		return cl_file; 
	} 
	public void setCl_file(String cl_file) { 
		this.cl_file = cl_file; 
	} 
	public String getCl_date() { 
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
		return transFormat.format(cl_date); 
	} 
	public void setCl_date(String cl_date) { 
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
		try { 
			this.cl_date = transFormat.parse(cl_date); 
		} catch (ParseException e) { 
			e.printStackTrace(); 
		} 
	} 
	public void setCl_date(Date cl_date) { 
		this.cl_date = cl_date; 
	} 
	 
	public String getCl_type() { 
		return cl_type; 
	} 
	public void setCl_type(String cl_type) { 
		this.cl_type = cl_type; 
	}
	@Override
	public String toString() {
		return "ClaimVo [cl_num=" + cl_num + ", cl_title=" + cl_title + ", cl_content=" + cl_content + ", cl_member="
				+ cl_member + ", cl_auth=" + cl_auth + ", cl_file=" + cl_file + ", cl_date=" + cl_date + ", cl_type="
				+ cl_type + ", cl_answer=" + cl_answer + "]";
	} 

}
