package member.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberDao;

@Controller
public class SearchIdController {
	
	@Autowired
	@Qualifier("MyMemberDao")
	private MemberDao memberDao;
	
	@ResponseBody
	@RequestMapping(value = "/checkid.mem",method=RequestMethod.POST)
	public String selectId(@RequestParam("memberid") String memberid) {
		System.out.println("!!"+memberid+"!@#!@");
		int cnt =0;
		System.out.println(cnt);
		cnt = memberDao.SearchId(memberid);
		System.out.println(cnt); 
	    return "{\"cnt\":"+cnt+"}";
	}
	


	
}
