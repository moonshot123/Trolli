package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.Board;
import board.model.BoardDao;

import utility.Paging2;

@Controller
public class BoardListController {
	private static final String getpage = "BoardList";
	private static final String command = "/list.bo";

	@Autowired
	@Qualifier("myBoardDao")
	private BoardDao boardDao;

	@RequestMapping(value=command)
	public ModelAndView doActionGet(
			@RequestParam(value="whatColumn", required=false) String whatColumn,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			@RequestParam(value="pageSize", required=false) String pageSize,
			HttpServletRequest reuqest
			){
		System.out.println("검색할 컬럼(whatColumn) : " + whatColumn + ", ");
		System.out.println("검색할 단어(keyword) : " + keyword + ", ");
		System.out.println("pageNumber : " + pageNumber + ", ");
		System.out.println("pageSize : " + pageSize + ", ");
		//한 페이지에 보여줄 건수(레코드 갯수)

		Map<String, String> map = new HashMap<String, String>();

		map.put("whatColumn", whatColumn);
		map.put("keyword" , "%" +keyword + "%");

		int totalCount = boardDao.GetTotalCount(map);

		System.out.println("전체 행수(totalCount) :  " + totalCount + ", ");
		String url = reuqest.getContextPath() + this.command;

		System.out.println("url : " + url); //url : /ex/list.ab

		ModelAndView mav = new ModelAndView();


		Paging2 pageInfo = new Paging2( pageNumber, pageSize, totalCount, url, whatColumn, keyword);

		System.out.println("offset : " + pageInfo.getOffset() + ", ");
		System.out.println("limit : " + pageInfo.getLimit() + ", ");
		System.out.println("url : " + pageInfo.getUrl() + ", ");
		List<Board> b_Lists = boardDao.getBoardList(pageInfo, map);
		// map 에는 whatColumn, keyword가 담겨있다.

		System.out.println("조회된 건수 : " + b_Lists.size());
		mav.addObject("b_Lists", b_Lists);
		mav.addObject("pageInfo", pageInfo);
		mav.setViewName(getpage); 

		return mav;

	}


}
