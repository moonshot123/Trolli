package reservation.model;

public class Reservation {
	
	private int resnum; /* 예약번호 */ 
	private int membernum; /* 회원번호 */
	private int roomnum; /* 객실번호 */
	private String startdate; /* 시작날짜 */
	private String enddate; /* 종료날짜 */
	private String place; /* 호텔위치 */
	private int totalpay; /* 총가격 */
	
	public Reservation(){}
	
	public Reservation(int resnum, int membernum, int roomnum, String startdate, String enddate, String place,
			int totalpay) {
		super();
		this.resnum = resnum;
		this.membernum = membernum;
		this.roomnum = roomnum;
		this.startdate = startdate;
		this.enddate = enddate;
		this.place = place;
		this.totalpay = totalpay;
	}
	
	public int getResnum() {
		return resnum;
	}

	public void setResnum(int resnum) {
		this.resnum = resnum;
	}

	public int getMembernum() {
		return membernum;
	}

	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}

	public int getRoomnum() {
		return roomnum;
	}

	public void setRoomnum(int roomnum) {
		this.roomnum = roomnum;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}
	
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public int getTotalpay() {
		return totalpay;
	}

	public void setTotalpay(int totalpay) {
		this.totalpay = totalpay;
	}

	@Override
	public String toString() {
		return "Reservation [resnum=" + resnum + ", membernum=" + membernum + ", roomnum=" + roomnum + ", startdate="
				+ startdate + ", enddate=" + enddate + ", place=" + place + ", totalpay=" + totalpay + "]";
	}
	
	
	
	
	
	
}
