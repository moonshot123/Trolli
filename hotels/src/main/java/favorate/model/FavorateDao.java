package favorate.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging2;



@Component("MyFavorateDao")
public class FavorateDao {
	
	private final String namespace = "favorate.model.Favorate"; //bean


	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public FavorateDao(){}
	
	//토탈카운트
	public int GetTotalCount(Map<String, String> map) {
		int cnt =  sqlSessionTemplate.selectOne(namespace+".GetTotalCount", map);
		return cnt;
	}
	
	
	//위시리스트
	public List<Favorate> GetDataList(Paging2 pageInfo, Map<String, String> map) {
		List<Favorate> list= new ArrayList<Favorate>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit() );
		list = sqlSessionTemplate.selectList(namespace + ".GetDataList", map, rowBounds);
		return list;
		}
	
	//위시리스트 삽입
	public int insertFavorate(Favorate bean) {
		int cnt =-1;
		cnt = sqlSessionTemplate.insert(namespace+".insertFavorate",bean);
		System.out.println("위시리스트 dao에서 삽입: "+bean);
		return cnt;
	}
	
	//위시리스트삭제
	public int deletedata(int hotelnum) {
		int cnt =-1;
		cnt = sqlSessionTemplate.delete(namespace+".deletedata", hotelnum);
		return cnt;
	}

}
