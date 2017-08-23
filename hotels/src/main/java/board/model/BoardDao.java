package board.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;
import utility.Paging2;

@Component("myBoardDao")
public class BoardDao {

	private String namespace = "board.model.Board";

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int GetTotalCount(Map<String, String> map) {

		int cnt = 0;
		cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return cnt;
	}

	public List<Board> getBoardList(Paging2 pageInfo, Map<String, String> map) {
		List<Board> lists = new ArrayList<Board>();

		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());

		lists = sqlSessionTemplate.selectList(namespace+".getBoardList", map, rowBounds);

		return lists;
	}

	public int InsertBoard(Board board) {
		int cnt = 0;

		cnt = sqlSessionTemplate.insert(namespace+".InsertBoard", board);

		return cnt;
	}

	public Board getBoard(int num) {
		Board board = new Board();

		board = sqlSessionTemplate.selectOne(namespace+".getBoard", num);

		return board;
	}

	public void UpReadCount(int num) {
		sqlSessionTemplate.update(namespace+".UpReadCount", num);
	}

	public int UpdateBoard(Board board) {
		int cnt = 0;

		cnt = sqlSessionTemplate.delete(namespace+".UpdateBoard", board);

		return cnt;
	}

	public int DeleteBoard(int num) {
	int cnt = 0;
		
		cnt = sqlSessionTemplate.delete(namespace+".DeleteBoard", num);
		
		return cnt;
	}

	public int ReplyBoard(Board board) {
	int cnt = 0;
		
		cnt = sqlSessionTemplate.insert(namespace+".ReplyBoard", board);
		
		return cnt;
	}

}
