package models;

public class RqlectureVO {
	private int rqno;
    private String rqlec, id;
    
    public int getRqno() {
        return rqno;
    }
    public void setRqno(int rqno) {
        this.rqno = rqno;
    }
    public String getRqlec() {
        return rqlec;
    }
    public void setRqlec(String rqlec) {
        this.rqlec = rqlec;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof RqlectureVO) {
			RqlectureVO temp = (RqlectureVO) obj;
			return temp.rqno==this.rqno;
		}
		return false;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return rqno;
	}
	@Override
	public String toString() {
		return rqno + "," + rqlec + "," + id;
	}
    
}
