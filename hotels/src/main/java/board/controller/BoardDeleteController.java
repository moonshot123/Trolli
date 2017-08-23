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
public class BoardDeleteController {
	private static final String command = "/delete.bo";
	
	@Autowired
	@Qualifier("myBoardDao")
	private BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGET(@RequestParam("num") int num, Model model,
		@RequestParam(value="pageNumber", required=false) String pageNumber){
		
		int cnt = 0;

		cnt = boardDao.DeleteBoard(num);
		
		return "redirect:/list.bo?pageNumber="+pageNumber;
	}
}
