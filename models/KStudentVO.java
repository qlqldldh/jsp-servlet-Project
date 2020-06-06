package models;

public class KStudentVO {
	private int kstudNo; // kstudid in table. name mismatching
	private String ksid,ktype;
	private int lecno = 0;
	
	public KStudentVO() {}
	
	
	public KStudentVO(int kstudNo, String ksid) {
		this(kstudNo,ksid,null,0);
	}
	
	public KStudentVO(int kstudNo, String ksid, String ktype, int lecno) {
		this.kstudNo=kstudNo;
		this.ksid=ksid;
		this.ktype=ktype;
		this.lecno=lecno;
	}
	
	public int getKstudNo() {
		return kstudNo;
	}
	public void setKstudNo(int kstudNo) {
		this.kstudNo = kstudNo;
	}
	public String getKsid() {
		return ksid;
	}
	public void setKsid(String ksid) {
		this.ksid = ksid;
	}
	public String getKtype() {
		return ktype;
	}
	public void setKtype(String ktype) {
		this.ktype = ktype;
	}
	
	public int getLecno() {
		return lecno;
	}
	public void setLecno(int lecno) {
		this.lecno = lecno;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof KStudentVO) {
			KStudentVO temp  = (KStudentVO) obj;
			return temp.kstudNo==this.kstudNo;
		}
		
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return kstudNo;
	}
	@Override
	public String toString() {
		return kstudNo + "," + ksid + "," + ktype
				+ "," + lecno;
	}
}
