package comment.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging2;


@Component("MyCommentDao")
public class CommentDao {
	
private final String namespace = "comment.model.Comment"; //bean
	
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public CommentDao(){}

	//후기 토탈카운트
	public int GetTotalCount(Map<String, String> map) {
		int cnt =  sqlSessionTemplate.selectOne(namespace+".GetTotalCount", map);
		return cnt;
	}

	//후기 리스트
	public List<Comment> GetDataList(Paging2 pageInfo, Map<String, String> map) {
		List<Comment> lists = new ArrayList<Comment>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit() );
		lists = sqlSessionTemplate.selectList(namespace + ".GetDataList", map, rowBounds);
		return lists;
	}
	
	//후기작성
	
	public Integer insertComment(Comment bean) {
		Integer cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".insertComment", bean);
		return cnt;
		
	}
	
	//수정하기 가져온것
	public Comment getupdatedata(int commentnum) {
		Comment comment = new Comment();
		comment = sqlSessionTemplate.selectOne(namespace+".getupdatedata",commentnum); 
		return comment;
	}//수정하기 가져온것
	
	//수정하기 버튼작동
	public Integer updatedata(Comment bean) {
		Integer cnt=-1;
		System.out.println("수정:dao");
		sqlSessionTemplate.update(namespace+".updatedata", bean);
		System.out.println(bean);
		return cnt;
	}
	//수정하기 버튼작동

	//후기삭제
	public int deletedata(int commentnum) {
		int cnt =-1;
		cnt = sqlSessionTemplate.delete(namespace+".deletedata", commentnum);
		return cnt;
	}
	

	
	
}
