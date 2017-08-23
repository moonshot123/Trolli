package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberLoginController {
	private static final String gotoPage = "redirect:/main.com";
	private static final String getPage = "../main/main_body"; 
	private static final String command = "login.mem"; 
	
	@Autowired
	@Qualifier("MyMemberDao")
	private MemberDao memberDao;
	
	@Autowired
	@Qualifier("MyHotelDao")
	private HotelDao hoteldao;
	
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doActionPost(
			Member member, 
			HttpSession session,
			HttpServletRequest request, 
			HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView();
		System.out.println("아이디 : " + member.getMemberid());
		System.out.println("비번 : " + member.getMemberpw());
		
		//데이트 피커
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    Calendar cal = Calendar.getInstance();
	    Date dDate = new Date();
	    
	    int yyyy     = cal.get(Calendar.YEAR);    //현재 년도
	    int MM        = cal.get(Calendar.MONTH)+1;   //현재 달
	    int dd        = cal.get(Calendar.DATE);    //현재 날짜
	    cal.set(yyyy, MM, dd); //현재 날짜 세팅
	    String today = String.valueOf(yyyy) + String.valueOf(MM)+ String.valueOf(dd);
	   
	    try {
			dDate = df.parse(today);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    String Dday = df.format(dDate);
	    long lCurTime = dDate.getTime();
	    dDate = new java.util.Date(lCurTime+(1000*60*60*24*+1));
	    String nextday = df.format(dDate);
	    //데이트 피커
		
	    System.out.println("Dday : "+Dday );
	    System.out.println("nextday : "+nextday );
	    
	    //데이트피커
		
		
		Member login= this.memberDao.getId(member.getMemberid());
		PrintWriter writer;
		response.setContentType("text/html;charset=UTF-8");
		writer = response.getWriter(); 
		
		if( login == null ){
			
		     writer.println("<script type='text/javascript'>");
		     writer.println("alert('존재하지 않는 회원입니다.');");
		     writer.println("history.back();");  
		     writer.println("</script>");
		     writer.flush();
		
		     mav.setViewName(getPage); 	
			
		}else{
			if ( member.getMemberid().equals( login.getMemberid() ) && 
						member.getMemberpw().equals( login.getMemberpw() )) {	
			
				session.setAttribute("loginfo", login); 
				mav.setViewName(getPage); 
				
			}else{
				
				 writer = response.getWriter(); 
			     writer.println("<script type='text/javascript'>");
			     writer.println("alert('비밀번호를 확인해주세요.');");
			     writer.println("history.back();"); 
			     writer.println("</script>");
			     writer.flush(); 
			     
			     mav.setViewName(getPage); 	
			}
		}
		
		
		Map<String, String> map = new HashMap<String, String>();
		
		System.out.println(map);

		List<Hotel> hotelLists = hoteldao.getrecommandhotel(map);
		System.out.println("호텔리스트"+hotelLists+"호텔리스트");
		
		
		
		
		mav.addObject("hotelLists", hotelLists);
		mav.addObject("Dday", Dday);//피커
		mav.addObject("nextday", nextday);//피커
		
		
		return mav;
		
	}
	
	
}
