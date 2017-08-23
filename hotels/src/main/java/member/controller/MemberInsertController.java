package member.controller;

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
public class MemberInsertController {
	private static final String getPage = "memregister";
	private static final String gotoPage = "redirect:/main.com";
	private static final String command = "memregister.mem"; 
	/*private static final String command2 = "id_check.mem";*/

	@Autowired
	@Qualifier("MyMemberDao")
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet() {
		
		return getPage;	
		
	}


	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doActionPost(
			@ModelAttribute("member") @Valid Member member, 
			BindingResult bindingResult) {
		ModelAndView mav = new ModelAndView();

		if (bindingResult.hasErrors()) {
			System.out.println("유효성 검사 오류입니다");
			mav.setViewName(getPage); 
			return mav;
		} 


		int cnt = -1;
		cnt = memberDao.Insertmember(member);
		
		//memberDao 의 insertmember 메서드에서 sql 실행 후 main.com 를 호출함
		mav.setViewName(gotoPage); 
		return mav;
	}
	
	
}

