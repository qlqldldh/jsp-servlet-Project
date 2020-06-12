package models;

public class TestVO {
	private int nums;
	private int id;

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

	@Override
	public String toString() {
		return "TestVO [nums=" + nums + "]";
	}
}
