package board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.Board;
import board.model.BoardDao;

@Controller
public class BoardReplyController {
	private static final String getPage = "BoardReplyForm";
	private static final String gotoPage = "redirect:/list.bo";
	private static final String command = "/reply.bo";
	
	@Autowired
	@Qualifier("myBoardDao")
	private BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGET(Model model, 
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			@RequestParam(value="ref", required=true) String ref,
			@RequestParam(value="restep", required=true) String restep,
			@RequestParam(value="relevel", required=true) String relevel){
		
		if(pageNumber==null){
			pageNumber = "1";
		}
		
		model.addAttribute("ref", ref);
		model.addAttribute("restep", restep);
		model.addAttribute("relevel", relevel);
		model.addAttribute("pageNumber", pageNumber);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doActionPOST(@ModelAttribute("b_reply") @Valid Board board, BindingResult result, HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		
		int cnt = 0;
		
		if(result.hasErrors()){
			System.out.println("유효성 검사를 통과하지 못했습니다.");
			mav.setViewName(getPage);
			return mav;
		}
		
		board.setIp(request.getRemoteAddr());
		int relevel = board.getRelevel();
		int restep = board.getRestep();
		board.setRelevel(relevel+1);
		board.setRestep(restep+1);
		
		System.out.println("==============================================");
		System.out.println("dlskfjsdlfksjdlfks      "+relevel+","+restep);
		System.out.println("==============================================");
		
		cnt = boardDao.ReplyBoard(board);
		
		mav.setViewName(gotoPage);
		
		return mav;
	}
}
