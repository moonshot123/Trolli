package board.controller;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
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
public class boardInsertController {
	private static final String command = "/insert.bo";
	private static final String getpage = "BoardInsertForm";	
	private static final String gotopage = "redirect:/list.bo";	

	@Autowired
	@Qualifier("myBoardDao")
	private BoardDao boardDao; 

	@Autowired
	ServletContext servletContext;

	@RequestMapping(value=command, method=RequestMethod.GET)
	 public String doActionGet(
	   Model model, HttpSession session,HttpServletResponse response,
	   @RequestParam(value="pageNumber", required=false) String pageNumber)throws Exception{

	  System.out.println(this.getClass()+"GET방식 들어옴");
	  /*System.out.println("loginfo : " + session.getAttribute("loginfo"));*/  
	  System.out.println("loginfo : "+session.getAttribute("loginfo"));


	  if(session.getAttribute("loginfo")==null){
	   response.setContentType("text/html; charset=UTF-8");
	   PrintWriter out = response.getWriter();
	   out.println("<script>alert('로그인 정보를 확인해주세요.')");
	   out.println("location.href='list.bo'</script>");
	   out.flush(); 
	   out.close(); 
	 
	  }  
	  return getpage;
	  
	  /*if(pageNumber==null){
	   pageNumber = "1";
	  }

	  model.addAttribute("pageNumber", pageNumber);

	  return getpage;*/
	  /*주석 처리가된 이부분은 글을 쓰고 나면 해당 페이지에 남아 있으라는건데 구현 하기가 힘들어 ^^*/

	 }

	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doActionPOST(
			@ModelAttribute("b_insert") 
			@Valid Board board, BindingResult result, 
			HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		System.out.println("인서트 컨드럴러 POST 방식들어옴");		

		int cnt = 0;

		if(result.hasErrors()){
			System.out.println("유효성 검사를 통과하지 못했습니다.");
			mav.setViewName(getpage);
			return mav;
		}

		board.setIp(request.getRemoteAddr());

		cnt = boardDao.InsertBoard(board);

		mav.setViewName(gotopage);

		return mav;
	}



}
