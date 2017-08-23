package favorate.model;

import org.springframework.web.multipart.MultipartFile;

public class Favorate {
	private int favoratenum;
	private int hotelnum;/* 호텔번호 */
	private String hotelname;/* 호텔이름 */
	private int membernum;/* 맴버번호 */
	private String hotelimg1;/* 호텔이미지1 */
	private int hotelscore; /* 평점 */
	public int getFavoratenum() {
		return favoratenum;
	}
	public void setFavoratenum(int favoratenum) {
		this.favoratenum = favoratenum;
	}
	public int getHotelnum() {
		return hotelnum;
	}
	public void setHotelnum(int hotelnum) {
		this.hotelnum = hotelnum;
	}
	public String getHotelname() {
		return hotelname;
	}
	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}
	public int getMembernum() {
		return membernum;
	}
	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}
	public String getHotelimg1() {
		return hotelimg1;
	}
	public void setHotelimg1(String hotelimg1) {
		this.hotelimg1 = hotelimg1;
	}
	public int getHotelscore() {
		return hotelscore;
	}
	public void setHotelscore(int hotelscore) {
		this.hotelscore = hotelscore;
	}
	
	private MultipartFile uploadimg1;
	private String uploadimg11;
	
	public MultipartFile getUploadimg1(){
		return uploadimg1;
	}
	
	public void setUploadimg1(MultipartFile uploadimg1){
		this.uploadimg1 = uploadimg1;
		
		if(this.uploadimg1 != null){
			this.hotelimg1 = this.uploadimg1.getOriginalFilename(); //Tulips.jpg
			System.out.println("upload.getName(): "+uploadimg1.getName()); //upload
			System.out.println("upload.getOriginalFilename(): "+uploadimg1.getOriginalFilename()); //Tulips.jpg
		}
	}
	
	public String getUploadimg11() {
		return uploadimg11;
	}
	public void setUploadimg11(String uploadimg11) {
		this.uploadimg11 = uploadimg11;
	}
	
	public Favorate(){
		
		super();
	}
	@Override
	public String toString() {
		return "Favorate [favoratenum=" + favoratenum + ", hotelnum=" + hotelnum + ", hotelname=" + hotelname
				+ ", membernum=" + membernum + ", hotelimg1=" + hotelimg1 + ", hotelscore=" + hotelscore
				+ ", uploadimg1=" + uploadimg1 + ", uploadimg11=" + uploadimg11 + "]";
	}
	public Favorate(int favoratenum, int hotelnum, String hotelname, int membernum, String hotelimg1, int hotelscore,
			MultipartFile uploadimg1, String uploadimg11) {
		super();
		this.favoratenum = favoratenum;
		this.hotelnum = hotelnum;
		this.hotelname = hotelname;
		this.membernum = membernum;
		this.hotelimg1 = hotelimg1;
		this.hotelscore = hotelscore;
		this.uploadimg1 = uploadimg1;
		this.uploadimg11 = uploadimg11;
	}
	

	
	
	
	
	
}
