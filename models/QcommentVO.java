package models;

public class QcommentVO {
	private int queno, lecno;
    private String title,id,contents;
    
    public QcommentVO(){}
    
    public QcommentVO(int queno, String title, String id, int lecno, String contents) {
    	this.queno=queno;
    	this.title=title;
    	this.id=id;
    	this.lecno=lecno;
    	this.contents=contents;
    }
    
    public int getQueno() {
        return queno;
    }
    public void setQueno(int queno) {
        this.queno = queno;
    }
    public int getLecno() {
        return lecno;
    }
    public void setLecno(int lecno) {
        this.lecno = lecno;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getContents() {
        return contents;
    }
    public void setContents(String contents) {
        this.contents = contents;
    }
    
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof QcommentVO) {
			QcommentVO temp  = (QcommentVO) obj;
			return temp.queno == this.queno;
		}
		return false;
	}
	@Override
	public int hashCode() {
		return queno;
	}
	@Override
	public String toString() {
		return queno + "," + lecno + "," + title + "," + id + ","
				+ contents;
	}
	
}
