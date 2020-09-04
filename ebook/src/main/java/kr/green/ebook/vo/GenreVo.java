package kr.green.ebook.vo;

public class GenreVo {
	private int g_code;
	private String g_type;
	
	public int getG_code() {
		return g_code;
	}
	public void setG_code(int g_code) {
		this.g_code = g_code;
	}
	public String getG_type() {
		return g_type;
	}
	public void setG_type(String g_type) {
		this.g_type = g_type;
	}
	
	@Override
	public String toString() {
		return "GenreVo [g_code=" + g_code + ", g_type=" + g_type + "]";
	}

	
	
	
	
}
