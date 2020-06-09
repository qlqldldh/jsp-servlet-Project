package models;

public class KBoardVO {
	private int boardNo, lecno;
	private String startDate, loc, purpose, contents, ktarget;
	
	public KBoardVO() {}
	
	public KBoardVO(int boardNo, int lecno, String startDate, String loc, String purpose, String contents, String ktarget) {
		this.boardNo = boardNo;
		this.lecno = lecno;
		this.startDate = startDate;
		this.loc = loc;
		this.purpose = purpose;
		this.contents = contents;
		this.ktarget = ktarget;
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getLecno() {
		return lecno;
	}
	public void setLecno(int lecno) {
		this.lecno = lecno;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getKtarget() {
		return ktarget;
	}
	public void setKtarget(String ktarget) {
		this.ktarget = ktarget;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof KBoardVO) {
			KBoardVO temp = (KBoardVO) obj;
			return temp.boardNo==this.boardNo;
		}
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return boardNo;
	}
	
	@Override
	public String toString() {
		return boardNo + "," + lecno + "," + startDate + "," + loc
				+ "," + purpose + "," + contents + "," + ktarget;
	}
}
