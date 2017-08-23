package hotel.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.model.Hotel;
import hotel.model.HotelDao;

@Controller
public class HotelDetailController {
	private static final String getPage="/HotelDetail";
	private static final String command="/hoteldetail.hot";
	

	@Autowired
	@Qualifier("MyHotelDao")
	private HotelDao hotelDao;
	
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(@RequestParam(value="hotelnum", required=true) int hotelnum,Model model) {
		
		Hotel hotel = hotelDao.GetData(hotelnum);
		
		model.addAttribute("hotel",hotel);
		
		return getPage;
	}
}
