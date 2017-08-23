package order.model;

public class Order {
	
	private int order_num; /* 주문번호 */
	private int mem_num;  /* 회원번호 */
	private int h_num; /* 호텔번호 */
	private int r_num; /* 객실번호 */
	public Order(){}
	
	public Order(int order_num, int mem_num, int h_num, int r_num) {
		super();
		this.order_num = order_num;
		this.mem_num = mem_num;
		this.h_num = h_num;
		this.r_num = r_num;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getH_num() {
		return h_num;
	}

	public void setH_num(int h_num) {
		this.h_num = h_num;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	
	
	
	
}
