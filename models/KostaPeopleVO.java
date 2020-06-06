package models;

public class KostaPeopleVO {
	private String id,password, name;
	private int age;
	private String email;
	
	public KostaPeopleVO() {}
	
	public KostaPeopleVO(String id, String password, String name, int age, String email) {
		this.id=id;
		this.password=password;
		this.name=name;
		this.age=age;
		this.email=email;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public boolean equals(Object obj) {
		
		if(obj instanceof KostaPeopleVO) {
			KostaPeopleVO temp = (KostaPeopleVO) obj;
			return temp.id.equals(this.id);
		}
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return id.hashCode();
	}
	@Override
	public String toString() {
		return id + "," + password + "," + name + "," + age + ","
				+ email;
	}
	
}
