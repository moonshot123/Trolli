package hotel.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Hotel {
	private int hotelnum;/* 호텔번호 */
	private int membernum;/* 회원번호 */
	@NotEmpty(message = "사업자등록번호는 필수사항 입니다.")
	private String companyregnum;/* 사업자등록번호 */
	private String hotelcategory;/* 호텔카테고리 */
	@NotEmpty(message = "호텔이름은 필수사항 입니다.")
	private String hotelname;/* 호텔이름 */
	@NotEmpty(message = "호텔주소는 필수사항 입니다.")
	private String hoteladdr;/* 호텔주소 */
	private String hotelimg1;/* 호텔이미지1 */
	private String hotelimg2;/* 호텔이미지2 */
	private String hotelimg3;/* 호텔이미지3 */
	private String hotelimg4;/* 호텔이미지4 */
	private String hotelproduce1; /* 호텔소개1 */
	private String hotelproduce2; /* 호텔소개2 */
	private String hotelproduce3; /* 호텔소개3 */
	private String hotelfacility; /* 부대시설 */
	private int hotelscore; /* 평점 */
	private int roomprice;
	private int rank;
	private int rownum;
	
	
	
	
	
	

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public Hotel(){
		super();
		
	}
	
	public Hotel(int hotelnum, int membernum, String companyregnum, String hotelcategory, String hotelname,
			String hoteladdr, String hotelimg1, String hotelimg2, String hotelimg3, String hotelimg4,
			String hotelproduce1, String hotelproduce2, String hotelproduce3, String hotelfacility, int hotelscore,
			int roomprice, MultipartFile uploadimg1, String uploadimg11, MultipartFile uploadimg2, String uploadimg22,
			MultipartFile uploadimg3, String uploadimg33, MultipartFile uploadimg4, String uploadimg44) {
		super();
		this.hotelnum = hotelnum;
		this.membernum = membernum;
		this.companyregnum = companyregnum;
		this.hotelcategory = hotelcategory;
		this.hotelname = hotelname;
		this.hoteladdr = hoteladdr;
		this.hotelimg1 = hotelimg1;
		this.hotelimg2 = hotelimg2;
		this.hotelimg3 = hotelimg3;
		this.hotelimg4 = hotelimg4;
		this.hotelproduce1 = hotelproduce1;
		this.hotelproduce2 = hotelproduce2;
		this.hotelproduce3 = hotelproduce3;
		this.hotelfacility = hotelfacility;
		this.hotelscore = hotelscore;
		this.roomprice = roomprice;
		this.uploadimg1 = uploadimg1;
		this.uploadimg11 = uploadimg11;
		this.uploadimg2 = uploadimg2;
		this.uploadimg22 = uploadimg22;
		this.uploadimg3 = uploadimg3;
		this.uploadimg33 = uploadimg33;
		this.uploadimg4 = uploadimg4;
		this.uploadimg44 = uploadimg44;
	}

	

	public Hotel(int hotelnum, int membernum, String companyregnum, String hotelcategory, String hotelname,
			String hoteladdr, String hotelimg1, String hotelimg2, String hotelimg3, String hotelimg4,
			String hotelproduce1, String hotelproduce2, String hotelproduce3, String hotelfacility, int hotelscore,
			int roomprice, int rank, MultipartFile uploadimg1, String uploadimg11, MultipartFile uploadimg2,
			String uploadimg22, MultipartFile uploadimg3, String uploadimg33, MultipartFile uploadimg4,
			String uploadimg44) {
		super();
		this.hotelnum = hotelnum;
		this.membernum = membernum;
		this.companyregnum = companyregnum;
		this.hotelcategory = hotelcategory;
		this.hotelname = hotelname;
		this.hoteladdr = hoteladdr;
		this.hotelimg1 = hotelimg1;
		this.hotelimg2 = hotelimg2;
		this.hotelimg3 = hotelimg3;
		this.hotelimg4 = hotelimg4;
		this.hotelproduce1 = hotelproduce1;
		this.hotelproduce2 = hotelproduce2;
		this.hotelproduce3 = hotelproduce3;
		this.hotelfacility = hotelfacility;
		this.hotelscore = hotelscore;
		this.roomprice = roomprice;
		this.rank = rank;
		this.uploadimg1 = uploadimg1;
		this.uploadimg11 = uploadimg11;
		this.uploadimg2 = uploadimg2;
		this.uploadimg22 = uploadimg22;
		this.uploadimg3 = uploadimg3;
		this.uploadimg33 = uploadimg33;
		this.uploadimg4 = uploadimg4;
		this.uploadimg44 = uploadimg44;
	}

	public int getRoomprice() {
		return roomprice;
	}

	public void setRoomprice(int roomprice) {
		this.roomprice = roomprice;
	}


	
	@Override
	public String toString() {
		return "Hotel [hotelnum=" + hotelnum + ", membernum=" + membernum + ", companyregnum=" + companyregnum
				+ ", hotelcategory=" + hotelcategory + ", hotelname=" + hotelname + ", hoteladdr=" + hoteladdr
				+ ", hotelimg1=" + hotelimg1 + ", hotelimg2=" + hotelimg2 + ", hotelimg3=" + hotelimg3 + ", hotelimg4="
				+ hotelimg4 + ", hotelproduce1=" + hotelproduce1 + ", hotelproduce2=" + hotelproduce2
				+ ", hotelproduce3=" + hotelproduce3 + ", hotelfacility=" + hotelfacility + ", hotelscore=" + hotelscore
				+ ", roomprice=" + roomprice + ", rank=" + rank + ", uploadimg1=" + uploadimg1 + ", uploadimg11="
				+ uploadimg11 + ", uploadimg2=" + uploadimg2 + ", uploadimg22=" + uploadimg22 + ", uploadimg3="
				+ uploadimg3 + ", uploadimg33=" + uploadimg33 + ", uploadimg4=" + uploadimg4 + ", uploadimg44="
				+ uploadimg44 + "]";
	}
	
	
	
	
	public int getHotelnum() {
		return hotelnum;
	}

	public void setHotelnum(int hotelnum) {
		this.hotelnum = hotelnum;
	}

	public int getMembernum() {
		return membernum;
	}

	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}

	public String getCompanyregnum() {
		return companyregnum;
	}

	public void setCompanyregnum(String companyregnum) {
		this.companyregnum = companyregnum;
	}

	public String getHotelcategory() {
		return hotelcategory;
	}

	public void setHotelcategory(String hotelcategory) {
		this.hotelcategory = hotelcategory;
	}

	public String getHotelname() {
		return hotelname;
	}

	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}

	public String getHoteladdr() {
		return hoteladdr;
	}

	public void setHoteladdr(String hoteladdr) {
		this.hoteladdr = hoteladdr;
	}

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

	public String getHotelproduce1() {
		return hotelproduce1;
	}

	public void setHotelproduce1(String hotelproduce1) {
		this.hotelproduce1 = hotelproduce1;
	}

	public String getHotelproduce2() {
		return hotelproduce2;
	}

	public void setHotelproduce2(String hotelproduce2) {
		this.hotelproduce2 = hotelproduce2;
	}

	public String getHotelproduce3() {
		return hotelproduce3;
	}

	public void setHotelproduce3(String hotelproduce3) {
		this.hotelproduce3 = hotelproduce3;
	}

	public String getHotelfacility() {
		return hotelfacility;
	}

	public void setHotelfacility(String hotelfacility) {
		this.hotelfacility = hotelfacility;
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
	
	
	private MultipartFile uploadimg2;
	private String uploadimg22;
	
	public MultipartFile getUploadimg2(){
		return uploadimg2;
	}
	
	public void setUploadimg2(MultipartFile uploadimg2){
		this.uploadimg2 = uploadimg2;
		
		if(this.uploadimg2 != null){
			this.hotelimg2 = this.uploadimg2.getOriginalFilename(); //Tulips.jpg
			System.out.println("upload.getName(): "+uploadimg2.getName()); //upload
			System.out.println("upload.getOriginalFilename(): "+uploadimg2.getOriginalFilename()); //Tulips.jpg
		}
		
	}
	
	public String getUploadimg22() {
		return uploadimg22;
	}
	public void setUploadimg22(String uploadimg22) {
		this.uploadimg22 = uploadimg22;
	}
	
	private MultipartFile uploadimg3;
	private String uploadimg33;
	
	public MultipartFile getUploadimg3(){
		return uploadimg3;
	}
	
	public void setUploadimg3(MultipartFile uploadimg3){
		this.uploadimg3 = uploadimg3;
		
		if(this.uploadimg3 != null){
			this.hotelimg3 = this.uploadimg3.getOriginalFilename(); //Tulips.jpg
			System.out.println("upload.getName(): "+uploadimg3.getName()); //upload
			System.out.println("upload.getOriginalFilename(): "+uploadimg3.getOriginalFilename()); //Tulips.jpg
		}
		
	}
	
	public String getUploadimg33() {
		return uploadimg33;
	}
	public void setUploadimg33(String uploadimg33) {
		this.uploadimg33 = uploadimg33;
	}
	
	
	
	private MultipartFile uploadimg4;
	private String uploadimg44;
	
	public MultipartFile getUploadimg4(){
		return uploadimg4;
	}
	
	public void setUploadimg4(MultipartFile uploadimg4){
		this.uploadimg4 = uploadimg4;
		
		if(this.uploadimg4 != null){
			this.hotelimg4 = this.uploadimg4.getOriginalFilename(); //Tulips.jpg
			System.out.println("upload.getName(): "+uploadimg4.getName()); //upload
			System.out.println("upload.getOriginalFilename(): "+uploadimg4.getOriginalFilename()); //Tulips.jpg
		}
		
	}
	
	public String getUploadimg44() {
		return uploadimg44;
	}
	public void setUploadimg44(String uploadimg44) {
		this.uploadimg44 = uploadimg44;
	}

	
}
