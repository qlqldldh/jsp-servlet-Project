package models;

public class KCourseVO {
	private String name;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof KCourseVO) {
			KCourseVO temp = (KCourseVO) obj;
			return temp.name.equals(this.name);
		}
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return name.hashCode();
	}
	@Override
	public String toString() {
		return name;
	}
	
}
