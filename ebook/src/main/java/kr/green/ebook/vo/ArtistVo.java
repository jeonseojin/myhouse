package kr.green.ebook.vo;

public class ArtistVo {
	private String name;
	private String intro;
	private String toon_title;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getToon_title() {
		return toon_title;
	}
	public void setToon_title(String toon_title) {
		this.toon_title = toon_title;
	}
	@Override
	public String toString() {
		return "artist [name=" + name + ", intro=" + intro + ", toon_title=" + toon_title + "]";
	}
	
	
}
