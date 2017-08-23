package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.Board;
import board.model.BoardDao;

@Controller
public class BoardDetailController {
	private static final String getPage = "BoardDetailView";
	private static final String command = "/detail.bo";
	
	@Autowired
	@Qualifier("myBoardDao")
	private BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGET(@RequestParam("num") int num, Model model,
		@RequestParam(value="pageNumber", required=false) String pageNumber){
		System.out.println("여기는 디테일뷰 컨트럴러 입니다");
		
		Board board = new Board();
		
		board = boardDao.getBoard(num);
		
		boardDao.UpReadCount(num);
		
		if(pageNumber==null){
			pageNumber = "1";
		}
		
		model.addAttribute("board", board);
		model.addAttribute("pageNumber", pageNumber);
		
		return getPage;
	}
	
}
