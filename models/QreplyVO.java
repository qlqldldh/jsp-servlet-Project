package models;

public class QreplyVO {
	private int qrno;
    private String reply;
    private int queno;
    private String id;
    
    public QreplyVO() {}
    
    public QreplyVO(int qrno, String reply, int queno, String id) {
    	this.qrno=qrno;
    	this.reply=reply;
    	this.queno=queno;
    	this.id=id;
    }
    
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
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
		return qrno + "," + queno + "," + reply + "," + id;
	}
    
}
