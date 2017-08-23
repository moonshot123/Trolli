package member.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberUpdateController {
	
	private static final String getPage = "./updatememform";
	private static final String command = "updatemem.mem";
	private static final String gotoPage = "redirect:/main.com";
	private static final String command2 = "updateform.mem";
	
	
	@Autowired
	@Qualifier("MyMemberDao")
	private MemberDao memberDao;
	
	@RequestMapping(value = command)
	public ModelAndView doAction1( int membernum ) {
		// 회원가입페이지로 가기
		ModelAndView mav =new ModelAndView();
		Member mem = memberDao.GetAlldata(membernum);
		
		System.out.println(mem);
		mav.addObject("member", mem);
		mav.setViewName(getPage);
		return mav;	
		
	}
	
	
	@RequestMapping(value = command2)
	public ModelAndView doAction2(
			@ModelAttribute("member") @Valid Member member, 
			BindingResult bindingResult, 
			HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if (bindingResult.hasErrors()) {
			System.out.println("유효성 검사 오류입니다");
			mav.setViewName(getPage); // 유효성 검사 오류 시 회원가입으로 돌아감
			return mav;
		} 
		
		//session.invalidate();
		
		
		Member memberupdate = memberDao.updatemember(member); 
		
		session.setAttribute("loginfo", memberupdate);
		
		mav.setViewName(gotoPage); 
		
		return mav;
	}
	
	
	
	
}



