package models;

public class KTeacherVO {
	private int kteacherNo;
	private String ktid,pos;
	
	public KTeacherVO() {}
	
	public KTeacherVO(int kteacherNo, String ktid) {
		this(kteacherNo,ktid,null);
	}
	
	public KTeacherVO(int kteacherNo, String ktid, String pos) {
		this.kteacherNo=kteacherNo;
		this.ktid=ktid;
		this.pos=pos;
	}
	
	public int getKteacherNo() {
		return kteacherNo;
	}
	public void setKteacherNo(int kteacherNo) {
		this.kteacherNo = kteacherNo;
	}
	public String getKtid() {
		return ktid;
	}
	public void setKtid(String ktid) {
		this.ktid = ktid;
	}
	public String getPos() {
		return pos;
	}
	public void setPos(String pos) {
		this.pos = pos;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof KTeacherVO) {
			KTeacherVO temp = (KTeacherVO) obj;
			return temp.kteacherNo == this.kteacherNo;
		}
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return kteacherNo;
	}
	@Override
	public String toString() {
		return kteacherNo + "," + ktid + "," + pos;
	}
	
}
