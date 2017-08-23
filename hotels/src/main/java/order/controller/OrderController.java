package order.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import member.model.MemberDao;
import order.model.OrderDao;
import reservation.model.Reservation;
import reservation.model.ReservationDao;
import room.model.Room;
import room.model.RoomDao;

@Controller
public class OrderController {
	
	private static final String getPage = "OrderPage";
	private static final String command = "orderpage.ord";
	
	private static final String getPage2 = "OrderPage2";
	private static final String command2 = "orderpage2.ord";
	
	private static final String getPage3 = "OrderPage3";
	private static final String command3 = "orderpage3.ord";
	
	@Autowired
	@Qualifier("MyOrderDao")
	private OrderDao orderdao;
	
	@Autowired
	@Qualifier("MyHotelDao")
	private HotelDao hoteldao;
	
	@Autowired
	@Qualifier("MyRoomDao")
	private RoomDao roomdao;
	
	@Autowired
	@Qualifier("MyReservationDao")
	private ReservationDao reservationdao;
	
	@Autowired
	@Qualifier("MyMemberDao")
	private MemberDao memberdao;
	
	
	
	
	@RequestMapping(value = command )
	public ModelAndView doActionPost(
			@RequestParam(value = "roomnum", required = false ) int roomnum,
			@RequestParam(value = "searchStart", required = false ) String searchStart,
			@RequestParam(value = "searchEnd", required = false ) String searchEnd
			) {
		ModelAndView mav = new ModelAndView();
		
		Room roomdata = roomdao.getroomdata(roomnum);
		System.out.println("roomnum++++++++"+roomnum);
		System.out.println("roomdata.getHotelnum++++++++"+roomdata.getHotelnum());
		System.out.println("roomdata.++++++++"+roomdata);
		Hotel hoteldata = hoteldao.GetData(roomdata.getHotelnum());
		
		mav.addObject("hoteldata", hoteldata);
		mav.addObject("roomdata", roomdata);
		mav.addObject("searchStart", searchStart);
		mav.addObject("searchEnd", searchEnd);
		mav.addObject("roomnum", roomnum);
		
		mav.setViewName(getPage);
		return mav;
	}
	
	
	
	
	@RequestMapping(value = command2 )
	public ModelAndView doActionPost2(
			String id,
			@RequestParam(value = "searchStart", required = false ) String searchStart,
			@RequestParam(value = "searchEnd", required = false ) String searchEnd,
			int roomnum,
			int hotelnum
			) {
		ModelAndView mav = new ModelAndView();
		
		
		System.out.println( "point++++++++++++"+id);
		int point = memberdao.getpoint(id);
		System.out.println( "point++++++++++++"+point);
		mav.addObject("point", point);
		
		System.out.println(roomnum);
		System.out.println(hotelnum);
		
		Hotel hoteldata = hoteldao.GetData(hotelnum);
		Room roomdata = roomdao.getroomdata(roomnum);
		
		mav.addObject("hoteldata", hoteldata);
		mav.addObject("roomdata", roomdata);
		mav.addObject("searchStart", searchStart);
		mav.addObject("searchEnd", searchEnd);
		
		
		mav.setViewName(getPage2);
		return mav;
	}
	

	
	
	
	
	@RequestMapping(value = command3 )
	public ModelAndView doActionPost3(
			String id,
			@RequestParam(value = "searchStart", required = false ) String searchStart,
			@RequestParam(value = "searchEnd", required = false ) String searchEnd,
			int roomnum,
			int hotelnum
			) {
		ModelAndView mav = new ModelAndView();
		
		
		int membernum = memberdao.getmembernum(id);
		Hotel hoteldata = hoteldao.GetData(hotelnum);
		Room roomdata = roomdao.getroomdata(roomnum);
		
		
		Reservation data = new Reservation();
		
		data.setMembernum(membernum);
		data.setRoomnum(roomnum);
		data.setStartdate(searchStart);
		data.setEnddate(searchEnd);
		data.setPlace(hoteldata.getHoteladdr());
		data.setTotalpay(roomdata.getRoomprice());
		
		
		Reservation reservation = reservationdao.insertservation(data);  
		
		
		System.out.println(reservation.getResnum());
		mav.addObject("reservation", reservation);
		System.out.println("===============reservation==============================="+reservation);
		mav.addObject("hoteldata", hoteldata);
		mav.addObject("roomdata", roomdata);
		mav.addObject("searchStart", searchStart);
		mav.addObject("searchEnd", searchEnd);
		mav.setViewName(getPage3);
		return mav;
	}
	
	
}
