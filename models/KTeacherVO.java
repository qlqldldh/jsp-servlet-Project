package models;

public class KTeacherVO {
	private int kteacherNo;
	private String ktid;
	
	public KTeacherVO() {}
	
	public KTeacherVO(int kteacherNo, String ktid) {
		this.kteacherNo=kteacherNo;
		this.ktid=ktid;
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
		return kteacherNo + "," + ktid;
	}
	
}
