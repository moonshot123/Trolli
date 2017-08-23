package member.model;

public class MemberCommonAndHost {
	private int resnum;
	private String roomimg1;
	private String membername;
	private String hotelname;
	private String roomname;
	private String startdate;
	private String enddate;
	private int roomprice;
	private int totalprice;
	private int membernum;
	
	
	
	public MemberCommonAndHost() {
		super();
	}
	
	public int getMembernum() {
		return membernum;
	}
	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}
	public int getResnum() {
		return resnum;
	}
	public void setResnum(int resnum) {
		this.resnum = resnum;
	}
	public String getRoomimg1() {
		return roomimg1;
	}
	public void setRoomimg1(String roomimg1) {
		this.roomimg1 = roomimg1;
	}
	public String getMembername() {
		return membername;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	public String getHotelname() {
		return hotelname;
	}
	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
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
	public int getRoomprice() {
		return roomprice;
	}
	public void setRoomprice(int roomprice) {
		this.roomprice = roomprice;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public MemberCommonAndHost(int resnum, String roomimg1, String membername, String hotelname, String roomname,
			String startdate, String enddate, int roomprice, int totalprice) {
		super();
		this.resnum = resnum;
		this.roomimg1 = roomimg1;
		this.membername = membername;
		this.hotelname = hotelname;
		this.roomname = roomname;
		this.startdate = startdate;
		this.enddate = enddate;
		this.roomprice = roomprice;
		this.totalprice = totalprice;
	}
	
	
}
