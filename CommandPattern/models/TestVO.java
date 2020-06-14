package models;

public class TestVO {
	private int nums;
	private int id;
	
	public TestVO() {}
	
	public TestVO(int nums, int id) {
		this.nums=nums;
		this.id=id;
	}
	
	public int getNums() {
		return nums;
	}
	public void setNums(int nums) {
		this.nums = nums;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
