package room.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import hotel.model.Hotel;
import utility.Paging3;

@Component("MyRoomDao")
public class RoomDao {
	
	private final String namespace = "room.model.Room"; //bean
	
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public RoomDao(){}

	
	public int GetTotalCount(Map<String, String> map) {
		int cnt =  sqlSessionTemplate.selectOne(namespace+".gettotalroom", map);
		return cnt;
	}

	
	public List<Room> GetDataList(Paging3 pageInfo, Map<String, String> map) {
		List<Room> lists = new ArrayList<Room>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit() );
		lists = sqlSessionTemplate.selectList(namespace + ".GetroomDataList", map, rowBounds);
		
				
		return lists;
	}
	
	
	public void deleteRoom(int roomnum) {
		
		sqlSessionTemplate.delete(namespace+".deleteRoom", roomnum);
		
	}


	public void insertRoom(Room room) {
		
		sqlSessionTemplate.insert(namespace+".insertRoom", room);
		
	}
	
	
	public Room getroomdata(int roomnum) {
		Room room = new Room();
		room = sqlSessionTemplate.selectOne(namespace+".getroomdata",roomnum); 
		return room;
	}
	
	
	public void update(Room room) {
		System.out.println("�닔�젙:�떎�삤");
		sqlSessionTemplate.update(namespace+".updateRoom", room);
		System.out.println(room);
		
	}


	public int GetroomCountbyhotel(Map<String, String> map) {  
		int cnt =  sqlSessionTemplate.selectOne(namespace+".GetroomCountbyhotel", map);
		
		return cnt;
	}

	
	public List<Room> GetroomList(Paging3 pageInfo, String hotelnum) {
		
		List<Room> lists = new ArrayList<Room>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit() );
		lists = sqlSessionTemplate.selectList(namespace + ".roomlist", hotelnum, rowBounds);
		
		return lists;
		
	}

	public List<Room> roomList(Map<String, String> map) {
		
		List<Room> lists = new ArrayList<Room>();
		lists = sqlSessionTemplate.selectList(namespace + ".roomlist", map);
		
		return lists;
		
	}

	public int hotelnumbyroomnum(int roomnum) { 
		
		int hotelnum =sqlSessionTemplate.selectOne(namespace+".gethotelnum", roomnum);
		return hotelnum;
	}


	public Room himagelist(String hotelnum) {
		Room hroom =new Room();
		
		hroom = sqlSessionTemplate.selectOne(namespace+".himagelist", hotelnum);
		// TODO Auto-generated method stub
		return hroom;
	}


	//결제금액
	public int getprice(int roomnum) {
		
		int price = sqlSessionTemplate.selectOne(namespace+".getprice",roomnum);
		
		return price;
	}

	
	


	
	
}
