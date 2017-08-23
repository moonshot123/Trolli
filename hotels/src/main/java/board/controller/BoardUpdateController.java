package board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
public class BoardUpdateController {
	private static final String getPage = "BoardtUpdateForm";
	private static final String gotoPage = "redirect:/list.bo";
	private static final String command = "/update.bo";
	
	@Autowired
	@Qualifier("myBoardDao")
	private BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGET(@RequestParam("num") int num, Model model, 
		@RequestParam(value="pageNumber", required=false) String pageNumber){
		
		Board board = new Board();
		
		board = boardDao.getBoard(num);
		
		if(pageNumber==null){
			pageNumber = "1";
		}
		
		model.addAttribute("board", board);
		model.addAttribute("pageNumber", pageNumber);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doActionPOST(Board board, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		
		System.out.println(this.getClass()+"POST방식");
		System.out.println("비밀번호 : " + board.getPasswd());
		
		ModelAndView mav = new ModelAndView();
		
		Board db_board = boardDao.getBoard(board.getNum());
		
		PrintWriter writer;
		response.setContentType("text/html; charset=UTF-8");
		
		if(board.getPasswd()==null){
			System.out.println("비밀번호를 입력해 주세요.");
			writer = response.getWriter();
			writer.println("<script type='text/javascript'>");
			writer.println("alert('비밀번호를 입력해 주세요.')");
			writer.println("</script>");
			writer.flush();
			mav.setViewName(getPage);
		}else{
			if(board.getPasswd().equals(db_board.getPasswd())){
				int cnt = 0;
				cnt = boardDao.UpdateBoard(board);
				mav.setViewName(gotoPage);
			}else{
				System.out.println("비밀번호가 틀렸습니다.");
				writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('비밀번호가 틀렸습니다.')");
				writer.println("</script>");
				writer.flush();
				return new ModelAndView(getPage);
			}
		}
		
		return mav;
	}
}
