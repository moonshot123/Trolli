package room.model;

import org.springframework.web.multipart.MultipartFile;

public class Room {
	
	private int roomnum; /* 객실번호 */
	private int hotelnum; /* 호텔번호 */
	private String roomname; /* 객실이름 */
	private String roomsize; /* 객실크기 */
	private String roompeople; /* 수용인원 */
	private String roomimg1; /* 객실이미지1 */
	private String roomimg2; /* 객실이미지2 */
	private String roomproduce1; /* 객실소개1 */
	private String roomproduce2; /* 객실소개2 */
	private String roomproduce3; /* 객실소개3 */
	private String startdate; /* 시작날짜 */
	private String enddate; /* 종료날짜 */
	private int roomprice; /* 객실가격 */
	private String roompoint; /* 객실포인트 */
	
	
	private String hotelimg1; /* 객실포인트 */
	private String hotelimg2; /* 객실포인트 */
	private String hotelimg3; /* 객실포인트 */
	private String hotelimg4; /* 객실포인트 */
	
	public String getHotelimg1() {
		return hotelimg1;
	}

	public void setHotelimg1(String hotelimg1) {
		this.hotelimg1 = hotelimg1;
	}

	public String getHotelimg2() {
		return hotelimg2;
	}

	public void setHotelimg2(String hotelimg2) {
		this.hotelimg2 = hotelimg2;
	}

	public String getHotelimg3() {
		return hotelimg3;
	}

	public void setHotelimg3(String hotelimg3) {
		this.hotelimg3 = hotelimg3;
	}

	public String getHotelimg4() {
		return hotelimg4;
	}

	public void setHotelimg4(String hotelimg4) {
		this.hotelimg4 = hotelimg4;
	}



	
	public Room(){}
	
	public Room(int roomnum, int hotelnum, String roomname, String roomsize, String roompeople, String roomimg1,
			String roomimg2, String roomproduce1, String roomproduce2, String roomproduce3, String startdate,
			String enddate, int roomprice, String roompoint) {
		super();
		this.roomnum = roomnum;
		this.hotelnum = hotelnum;
		this.roomname = roomname;
		this.roomsize = roomsize;
		this.roompeople = roompeople;
		this.roomimg1 = roomimg1;
		this.roomimg2 = roomimg2;
		this.roomproduce1 = roomproduce1;
		this.roomproduce2 = roomproduce2;
		this.roomproduce3 = roomproduce3;
		this.startdate = startdate;
		this.enddate = enddate;
		this.roomprice = roomprice;
		this.roompoint = roompoint;
	}
	
	
	public int getRoomnum() {
		return roomnum;
	}

	public void setRoomnum(int roomnum) {
		this.roomnum = roomnum;
	}

	public int getHotelnum() {
		return hotelnum;
	}

	public void setHotelnum(int hotelnum) {
		this.hotelnum = hotelnum;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getRoomsize() {
		return roomsize;
	}

	public void setRoomsize(String roomsize) {
		this.roomsize = roomsize;
	}

	public String getRoompeople() {
		return roompeople;
	}

	public void setRoompeople(String roompeople) {
		this.roompeople = roompeople;
	}

	public String getRoomimg1() {
		return roomimg1;
	}

	public void setRoomimg1(String roomimg1) {
		this.roomimg1 = roomimg1;
	}

	public String getRoomimg2() {
		return roomimg2;
	}

	public void setRoomimg2(String roomimg2) {
		this.roomimg2 = roomimg2;
	}

	public String getRoomproduce1() {
		return roomproduce1;
	}

	public void setRoomproduce1(String roomproduce1) {
		this.roomproduce1 = roomproduce1;
	}

	public String getRoomproduce2() {
		return roomproduce2;
	}

	public void setRoomproduce2(String roomproduce2) {
		this.roomproduce2 = roomproduce2;
	}

	public String getRoomproduce3() {
		return roomproduce3;
	}

	public void setRoomproduce3(String roomproduce3) {
		this.roomproduce3 = roomproduce3;
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

	public String getRoompoint() {
		return roompoint;
	}

	public void setRoompoint(String roompoint) {
		this.roompoint = roompoint;
	}

	

	private MultipartFile upload1;	
	private MultipartFile upload2;	
	private String upload11; 
	private String upload22;
	
	
	public MultipartFile getUpload1() {
		return upload1;
	}

	public void setUpload1(MultipartFile upload1) {
		this.upload1 = upload1;
		
		if( this.upload1 != null){
			System.out.println("upload1.getName():"+upload1.getName()); 
			System.out.println("upload1.getOriginalFilename():" +
					upload1.getOriginalFilename()); 
			this.roomimg1 = this.upload1.getOriginalFilename();
		}
		
	}

	public MultipartFile getUpload2() {
		return upload2;
	}

	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
		
		if( this.upload2 != null){
			System.out.println("upload2.getName():"+upload2.getName()); 
			System.out.println("upload2.getOriginalFilename():" +
					upload2.getOriginalFilename()); 
			this.roomimg2 = this.upload2.getOriginalFilename();
		}
		
	}

	public String getUpload11() {
		return upload11;
	}

	public void setUpload11(String upload11) {
		this.upload11 = upload11;
	}

	public String getUpload22() {
		return upload22;
	}

	public void setUpload22(String upload22) {
		this.upload22 = upload22;
	}

	@Override
	public String toString() {
		return "Room [roomnum=" + roomnum + ", hotelnum=" + hotelnum + ", roomname=" + roomname + ", roomsize="
				+ roomsize + ", roompeople=" + roompeople + ", roomimg1=" + roomimg1 + ", roomimg2=" + roomimg2
				+ ", roomproduce1=" + roomproduce1 + ", roomproduce2=" + roomproduce2 + ", roomproduce3=" + roomproduce3
				+ ", startdate=" + startdate + ", enddate=" + enddate + ", roomprice=" + roomprice + ", roompoint="
				+ roompoint + ", upload1=" + upload1 + ", upload2=" + upload2 + ", upload11=" + upload11 + ", upload22="
				+ upload22 + "]";
	} 
	
	
	
}
