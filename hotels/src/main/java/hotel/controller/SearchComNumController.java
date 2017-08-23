package hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hotel.model.HotelDao;

@Controller
public class SearchComNumController {

	
	@Autowired
	@Qualifier("MyHotelDao")
	private HotelDao hoteldao;
	
	@ResponseBody
	@RequestMapping(value="/checkccc.hot",method=RequestMethod.POST)
	public String searchComPost(@RequestParam("companyregnum") String companyregnum) {
		System.out.println("!!"+companyregnum+"!@#!@");
		int cnt =0;
		System.out.println(cnt);
		cnt = hoteldao.searchCompany(companyregnum);
		System.out.println(cnt); 
	    return "{\"cnt\":"+cnt+"}";
	}
	
}
