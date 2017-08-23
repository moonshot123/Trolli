package member.model;

import org.hibernate.validator.constraints.NotEmpty;

public class Member {
	   private int membernum; /* 회원번호 */
	   @NotEmpty(message = "이름은 필수사항 입니다.")
	   private String membername; /* 이름 */
	   private int logincheck; /* 회원선택(일반,사업자,관리자) */
	   @NotEmpty(message = "아이디는 필수사항 입니다.")
	   private String memberid; /* 아이디 */
	   @NotEmpty(message = "비밀번호는 필수사항 입니다.")
	   private String memberpw; /* 비밀번호 */
	   @NotEmpty(message = "email 은 필수사항입니다.")
	   private String memberemail; /* 이메일 */
	   @NotEmpty(message = "생일은 필수사항입니다.")
	   private String memberbirth; /* 생일 */
	   private int memberpoint; /* 포인트 */
	   private int memberagree; /* 수신동의 */
	
	public Member(){}

	public int getMembernum() {
		return membernum;
	}

	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public int getLogincheck() {
		return logincheck;
	}

	public void setLogin_check(int login_check) {
		this.logincheck = login_check;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getMemberpw() {
		return memberpw;
	}

	public void setMemberpw(String memberpw) {
		this.memberpw = memberpw;
	}

	public String getMemberemail() {
		return memberemail;
	}

	public void setMemberemail(String memberemail) {
		this.memberemail = memberemail;
	}

	public String getMemberbirth() {
		return memberbirth;
	}

	public void setMemberbirth(String memberbirth) {
		this.memberbirth = memberbirth;
	}

	public int getMemberpoint() {
		return memberpoint;
	}

	public void setMemberpoint(int memberpoint) {
		this.memberpoint = memberpoint;
	}

	public int getMemberagree() {
		return memberagree;
	}

	public void setMemberagree(int memberagree) {
		this.memberagree = memberagree;
	}

	public Member(int membernum, String membername, int logincheck, String memberid, String memberpw,
			String memberemail, String memberbirth, int memberpoint, int memberagree) {
		super();
		this.membernum = membernum;
		this.membername = membername;
		this.logincheck = logincheck;
		this.memberid = memberid;
		this.memberpw = memberpw;
		this.memberemail = memberemail;
		this.memberbirth = memberbirth;
		this.memberpoint = memberpoint;
		this.memberagree = memberagree;
	}

	@Override
	public String toString() {
		return "Member [membernum=" + membernum + ", membername=" + membername + ", logincheck=" + logincheck
				+ ", memberid=" + memberid + ", memberpw=" + memberpw + ", memberemail=" + memberemail
				+ ", memberbirth=" + memberbirth + ", memberpoint=" + memberpoint + ", memberagree=" + memberagree
				+ "]";
	}	
}
