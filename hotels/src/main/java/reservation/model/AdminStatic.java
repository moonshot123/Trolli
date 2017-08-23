package reservation.model;

public class AdminStatic {
	private String place;
	private String month;
	private int count;
	
	
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public AdminStatic(String place, String month, int count) {
		super();
		this.place = place;
		this.month = month;
		this.count = count;
	}
	@Override
	public String toString() {
		return "AdminStatic [place=" + place + ", month=" + month + ", count=" + count + "]";
	}
	
	
	public AdminStatic(){}
	
	
	
	
}
