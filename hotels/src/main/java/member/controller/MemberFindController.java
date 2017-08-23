package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberFindController {
	private static final String getPage = "find_id";
	private static final String getPage2 = "find_pw";
	private static final String gotoPage = "../main/main_body";
	private static final String command = "findID.mem"; 
	private static final String command2 = "findPW.mem";
	@Autowired
	@Qualifier("MyMemberDao")
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(	HttpSession session ) {
		
		return getPage;	

	}
	@RequestMapping(value = command2, method = RequestMethod.GET)
	public String doActionGet2(	HttpSession session ) {
		
		return getPage2;	
		
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doActionPost(
			@ModelAttribute("member") Member member,HttpServletResponse response) throws IOException {
		System.out.println(member.getMembername());
		System.out.println(member.getMemberemail());
		Member find= this.memberDao.findID(member);
		
		PrintWriter writer;
		response.setContentType("text/html;charset=UTF-8");
		writer = response.getWriter(); 
		
		if( find == null ){
			
		     writer.println("<script type='text/javascript'>");
		     writer.println("alert('잘못된 정보입니다.');");
		     writer.println("</script>");
		     writer.flush();
		
		     return new ModelAndView( getPage ) ; 	
			
		}else{
			writer.println("<script type='text/javascript'>");
		     writer.println("alert('찾으시는 ID 는 "+find.getMemberid()+" 입니다');");
		     writer.println("</script>");
		     writer.flush();
		
		     return new ModelAndView( gotoPage ) ; 
			
		}
	}
	
	@RequestMapping(value = command2, method = RequestMethod.POST)
	public ModelAndView doActionPost2(
			@ModelAttribute("member") Member member,HttpServletResponse response) throws IOException {
		System.out.println(member.getMemberpw());
		System.out.println(member.getMembername());
		System.out.println(member.getMemberemail());
		Member find= this.memberDao.findPW(member);
		
		PrintWriter writer;
		response.setContentType("text/html;charset=UTF-8");
		writer = response.getWriter(); 
		
		if( find == null ){
			
		     writer.println("<script type='text/javascript'>");
		     writer.println("alert('잘못된 정보입니다.');");
		     writer.println("</script>");
		     writer.flush();
		
		     return new ModelAndView( getPage2 ) ; 	
			
		}else{
			writer.println("<script type='text/javascript'>");
		     writer.println("alert('찾으시는 Password 는 "+find.getMemberpw()+" 입니다');");
		     writer.println("</script>");
		     writer.flush();
		
		     return new ModelAndView( gotoPage ) ; 
			
		}
	}
}
