package member.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hotel.model.Hotel;
import hotel.model.HotelDao;

@Controller
public class MemberLogoutController {
	private static final String command = "logout.mem";
	private static final String getPage = "../main/main_body";
			
	
	@Autowired
	@Qualifier("MyHotelDao")
	private HotelDao hoteldao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doActionGet(	HttpSession session ) {
		
		session.invalidate();
		
		ModelAndView mav = new ModelAndView();
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
		
		
		Map<String, String> map = new HashMap<String, String>();
		
		System.out.println(map);

		List<Hotel> hotelLists = hoteldao.getrecommandhotel(map);
		System.out.println("호텔리스트"+hotelLists+"호텔리스트");
		
		mav.addObject("hotelLists", hotelLists);
		mav.addObject("Dday", Dday);//피커
		mav.addObject("nextday", nextday);//피커
		
		mav.setViewName(getPage);
		
		return mav;	
		
		
	}
}
