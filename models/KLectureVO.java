package models;

public class KLectureVO {
	private int lecno;
	private String name, forWho, isFree, crsName;
	private int lecDur,ktno;
	
	public int getLecno() {
		return lecno;
	}
	public void setLecno(int lecno) {
		this.lecno = lecno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getForWho() {
		return forWho;
	}
	public void setForWho(String forWho) {
		this.forWho = forWho;
	}
	public String getIsFree() {
		return isFree;
	}
	public void setIsFree(String isFree) {
		this.isFree = isFree;
	}
	
	public String getCrsName() {
		return crsName;
	}
	public void setCrsName(String crsName) {
		this.crsName = crsName;
	}
	public int getLecDur() {
		return lecDur;
	}
	public void setLecDur(int lecDur) {
		this.lecDur = lecDur;
	}
	public int getKtno() {
		return ktno;
	}
	public void setKtno(int ktno) {
		this.ktno = ktno;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof KLectureVO) {
			KLectureVO temp  = (KLectureVO) obj;
			return temp.lecno == this.lecno;
		}
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return lecno;
	}
	
	@Override
	public String toString() {
		return lecno + "," + name + "," + forWho + "," + isFree
				+ "," + crsName + "," + lecDur + "," + ktno;
	}
}
