package reservation.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hotel.model.HotelDao;
import reservation.model.ReservationDao;

@Controller
public class ReservationController {

	private static final String getPage = "redirect:/member.mem";
	private static final String command = "listdelete.res";

	@Autowired
	@Qualifier("MyReservationDao")
	private ReservationDao reservationdao;
 
	@RequestMapping(value = command )
	public ModelAndView doActionPost( int resnum) {
		System.out.println("resnum +++"+ resnum);
		
		int membernum = reservationdao.serchmembernum(resnum);
		System.out.println("membernum +++"+ membernum);
		
		reservationdao.deletelist(resnum);
		System.out.println("===========================");
		ModelAndView mav = new ModelAndView();
		mav.addObject("membernum", membernum);
		mav.setViewName(getPage);
		return mav;
		
		
	}
}
