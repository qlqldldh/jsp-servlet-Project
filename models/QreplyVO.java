package models;

public class QreplyVO {
	private int qrno;
    private String reply;
    private int queno;
    
    public int getQrno() {
        return qrno;
    }
    public void setQrno(int qrno) {
        this.qrno = qrno;
    }
    public int getQueno() {
        return queno;
    }
    public void setQueno(int queno) {
        this.queno = queno;
    }
    public String getReply() {
        return reply;
    }
    public void setReply(String reply) {
        this.reply = reply;
    }
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof QreplyVO) {
			QreplyVO temp = (QreplyVO) obj;
			return temp.qrno==this.qrno;
		}
		return false;
	}
	@Override
	public int hashCode() {
		return qrno;
	}
	@Override
	public String toString() {
		return qrno + "," + queno + "," + reply;
	}
    
}
