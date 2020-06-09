package models;

public class Pair {
	public String first;
	public String second;
	
	public Pair(String first, String second) {
		this.first=first;
		this.second=second;
	}
	
	public Pair() {}

	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Pair) {
			Pair temp = (Pair) obj;
			return temp.first.equals(this.first) && temp.second.equals(this.second);
		}
		return false;
	}

	@Override
	public int hashCode() {
		return first.hashCode() + second.hashCode();
	}

	@Override
	public String toString() {
		return "Pair [first=" + first + ", second=" + second + "]";
	}
	
}
