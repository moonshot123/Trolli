package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class hostregisterController {
	
	
	
	private static final String command = "hostregister.mem"; 
	
	@Autowired
	@Qualifier("MyMemberDao")
	private MemberDao memberDao;
	
	@RequestMapping(value = command)
	public String doActionPost1(HttpSession session){
		System.out.println("세션아이디 : " + session.getAttributeNames());
		/*System.out.println("세션아이디등급 : " + session.getAttribute(arg0));*/
		return "../hostregister/hostregister";
	}
	
	
	
	@RequestMapping(value = "hostreg.mem")
	public String doActionPost(HttpSession session, int membernum  ){
		
		/*System.out.println("세션아이디등급 : " + session.getAttribute(arg0));*/
		
		//헷갈림
		memberDao.changehost(membernum);
		System.out.println("membernum"+membernum);
		
		
		/*session.invalidate(); 지우고 다시만들지 말고 그위에다가 다시저장하면됨*/
		
		Member login= this.memberDao.getbynum(membernum);
		session.setAttribute("loginfo", login);
		
		
		return "../hostregister/hostregister";
	}
	
	
	
	
	
}
