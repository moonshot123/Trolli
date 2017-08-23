package hotel.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;
import utility.Paging3;
import utility.Paging7;

@Component("MyHotelDao")
public class HotelDao {
	
	
	private final String namespace = "hotel.model.Hotel"; //bean


	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public HotelDao(){}
	
	/*검색 부분*/
	public int GetTotalCount( Map<String, String> map ) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return cnt;
	}
	/*검색 정렬*/
	public List<Hotel> GetDataList( Paging pageInfo, Map<String,String> map ) {
		List<Hotel> lists = new ArrayList<Hotel>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit() );
		lists = sqlSessionTemplate.selectList(namespace + ".GetDataList", map, rowBounds);
		return lists;
	}
	/*검색 정렬*/
	public List<Hotel> GetDataList1( Paging pageInfo, Map<String,String> map ) {
		List<Hotel> lists = new ArrayList<Hotel>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit() );
		lists = sqlSessionTemplate.selectList(namespace + ".GetDataList1", map, rowBounds);
		return lists;
	}
	/*검색 정렬*/
	public List<Hotel> GetDataList2( Paging pageInfo, Map<String,String> map ) {
		List<Hotel> lists = new ArrayList<Hotel>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit() );
		lists = sqlSessionTemplate.selectList(namespace + ".GetDataList2", map, rowBounds);
		return lists;
	}
	
	/*------------------------------------------------------------------------------------------*/
	/*호스팅가입하기에서 호텔 정보가져오기(gettotal)*/
	public int GetHostTotalCount( Map<String, String> map ) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".GetHostTotalCount", map);
		return cnt;
	}
	
	
	/*호스팅가입하기에서 호텔 정보가져오기*/
	public List<Hotel> GetHostDataList( Paging3 pageInfo, Map<String,String> map ) {
		List<Hotel> lists = new ArrayList<Hotel>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit() );
		lists = sqlSessionTemplate.selectList(namespace + ".GetHostDataList", map, rowBounds);
		return lists;
	}
	
	
	/*호텔 등록*/
	public Integer InsertData(Hotel hotel) {
		Integer cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".InsertData", hotel);
		return cnt;
	}

	/*호텔 삭제*/
	public int DeleteData(int hotelnum) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".DeleteData", hotelnum);
		return cnt;
	}
	
	/*호텔 상세정보가져오기*/
	public Hotel GetData(int hotelnum) {
		Hotel bean = null;
		bean = sqlSessionTemplate.selectOne(namespace + ".GetData",	hotelnum);
		return bean;
	}
	
	
	
	/*호텔 업데이트*/
	public Integer UpdateData(Hotel bean) { 
		Integer cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".UpdateData", bean);
		return cnt;
	}
	
	
	/*호텔 디테일뷰*/
	public Integer DetailView(Hotel bean) {
		Integer cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".DetailView", bean);
		return cnt;
	}
	
	
	public int GetHotelTotalCount(Map<String, String> map2) {
		int cnt  = sqlSessionTemplate.selectOne(namespace+".GetHotelTotalCount", map2);
		return cnt;
	}
  
	
//////////////////////////////////////////////////////////////////////////////////////////////
	public List<Hotel> getAllHotelList(Paging7 pageInfo2, Map<String, String> map2) {
		List<Hotel> list= new ArrayList<Hotel>();
		RowBounds rowBounds = new RowBounds(pageInfo2.getOffset(), pageInfo2.getLimit() );
		list = sqlSessionTemplate.selectList(namespace+".getAllHotelList", map2, rowBounds);
		return list;
	}
	
	public List<Hotel> getAllHotelList2(Map<String, String> map2) {
	      List<Hotel> list= new ArrayList<Hotel>();
	      list = sqlSessionTemplate.selectList(namespace+".getAllHotelList", map2);
	      return list;
	   }

	public List<Hotel> getrecommandhotel(Map<String,String> map) {
		List<Hotel> lists = new ArrayList<Hotel>();
		lists = sqlSessionTemplate.selectList(namespace+".getrecommandhotel",map);
		return lists;
	}
	
	
	//사업자등록번호 찾기
	public int searchCompany(String companyregnum) {
		int cnt = 0;
		cnt = sqlSessionTemplate.selectOne(namespace+".searchCompany",companyregnum);
		return cnt;
	}

}
