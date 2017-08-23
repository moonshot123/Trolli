package comment.model;

public class Comment {

	private int commentnum;
	private int membernum;
	private int hotelnum;
	private String comments;
	private String score;
	private int rownum;
		
	public Comment() {
		super();
	}
	
	public Comment(int rownum, int commentnum, int membernum, int hotelnum, String comments, String score) {
	super();
	this.commentnum = commentnum;
	this.membernum = membernum;
	this.hotelnum = hotelnum;
	this.comments = comments;
	this.score = score;
	this.rownum = rownum;
}
	
	

	@Override
	public String toString() {
		return "Comment [rownum=" + rownum + "commentnum=" + commentnum + ", membernum=" + membernum + ", hotelnum=" + hotelnum
				+ ", comments=" + comments + ", score=" + score + "]";
	}


	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}


	public int getCommentnum() {
		return commentnum;
	}

	public void setCommentnum(int commentnum) {
		this.commentnum = commentnum;
	}

	public int getMembernum() {
		return membernum;
	}

	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}

	public int getHotelnum() {
		return hotelnum;
	}

	public void setHotelnum(int hotelnum) {
		this.hotelnum = hotelnum;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}
	
	
	
}
