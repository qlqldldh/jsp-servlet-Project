package models;

public class KStudentVO {
	private int kstudNo; // kstudid in table. name mismatching
	private String ksid;
	private int lecno = 0;
	
	public KStudentVO() {}
	
<<<<<<< HEAD
	public KStudentVO(int kstudNo, String ksid) {
		this(kstudNo,ksid,0);
	}
	
=======
>>>>>>> b49b337691fbea7ad6aebc884876c43cea973ce3
	public KStudentVO(int kstudNo, String ksid, int lecno) {
		this.kstudNo=kstudNo;
		this.ksid=ksid;
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
		return kstudNo + "," + ksid + "," + lecno;
	}
}
