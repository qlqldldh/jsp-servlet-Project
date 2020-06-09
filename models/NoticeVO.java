package models;

public class NoticeVO {
	private String title;
	private String contents;
	
	public NoticeVO() {}
	
	public NoticeVO(String title, String contents) {
		this.title=title;
		this.contents=contents;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
//	public String getUpdate() {
//		return update;
//	}
//	public void setUpdate(String update) {
//		this.update = update;
//	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	@Override
	public String toString() {
		return title + "," +contents;
	}
	
}
