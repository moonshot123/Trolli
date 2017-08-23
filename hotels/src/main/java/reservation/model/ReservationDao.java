package reservation.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging3;

@Component("MyReservationDao")
public class ReservationDao {
	
	private final String namespace = "reservation.model.Reservation"; //bean
	private final String namespace2 = "reservation.model.AdminStatic";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public ReservationDao(){}

	public List<Reservation> getReservartionData() {
		List<Reservation> list= new ArrayList<Reservation>();
		list = sqlSessionTemplate.selectList(namespace+".getReservartionData");
		return list;
	}

	
	public int GetReservationCount(Map<String, String> map3) {
		System.out.println("다오1");
		int cnt  = sqlSessionTemplate.selectOne(namespace+".GetReservationCount", map3);
		System.out.println("다오2");
		
		return cnt;
	}

	public void deletelist(int resnum) {
		sqlSessionTemplate.delete(namespace+".deletelist", resnum);
	}

	public int serchmembernum(int resnum) {
		int membernum = sqlSessionTemplate.selectOne(namespace+".serchmembernum", resnum);
		System.out.println("membernum 다오다오다오"+membernum);
		return membernum;
	}

	public List<AdminStatic> getlinegraph() {
		List<AdminStatic> list = new ArrayList<AdminStatic>();
		list = sqlSessionTemplate.selectList(namespace2+".getlinegraph");
		return list;
	}

	
	
	public Reservation insertservation(Reservation data) {
		Reservation res=new Reservation();
		sqlSessionTemplate.insert(namespace+".insertreservation", data);
		sqlSessionTemplate.update(namespace+".updateprice", data);
		res = sqlSessionTemplate.selectOne(namespace+".getreservation", data);
		return res;
	}

	
	
	
	
	
}
