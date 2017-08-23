package hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.model.HotelDao;

@Controller
public class HotelDeleteController {
	
	private static final String gotoPage="redirect:/hotellist.hot";
	private static final String command="/hoteldelete.hot";
	

	@Autowired
	@Qualifier("MyHotelDao")
	private HotelDao hotelDao;
	
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(@RequestParam(value="hotelnum", required=true) int hotelnum) {
		
		System.out.println("HotelDeleteController GET방식 들어옴 ");
	
		int cnt = -1;
		cnt = hotelDao.DeleteData(hotelnum);
		
		
		return gotoPage;	
	}
}
