package room.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import room.model.Comment;
import room.model.CommentDao;
import room.model.Room;
import room.model.RoomDao;
import utility.Paging;
import utility.Paging3;

@Controller
public class RoomController implements ServletContextAware{

	@Autowired
	@Qualifier("MyRoomDao")
	private RoomDao roomdao;

	@Autowired
	@Qualifier("MyCommentDao")
	private CommentDao commentdao;

	@Autowired
	@Qualifier("MyHotelDao")
	private HotelDao hotelDao;
	
	//@Autowired  
    ServletContext servletContext; 
    
	
    //룸정보 입력
	@RequestMapping(value = "insertRoom.roo" )
	public ModelAndView insertRoom(
			@RequestParam(value = "hotelnum", required = false ) int hotelnum) {
		System.out.println("hotelnum+++++++hotelnum: "+hotelnum);
		ModelAndView mav = new ModelAndView();
		mav.addObject( "hotelnum", hotelnum );
		mav.setViewName("InsertRoom");
		return mav;
	}	
	
	//룸정보  DB입력
	@RequestMapping(value = "insertRoom2.roo" )
	public ModelAndView insertDBRoom( 
			@RequestParam(value = "hotelnum", required = false ) int hotelnum,
			@ModelAttribute("room") @Valid Room room
			){	
		
		System.out.println(room);
		System.out.println("dmdmddm"+room.getHotelnum());	
		roomdao.insertRoom(room);
		ModelAndView mav = new ModelAndView();
		
		String uploadPath=servletContext.getRealPath("/resources");
		System.out.println("uploadPath:"+uploadPath);
		
		MultipartFile multi1 = room.getUpload1();
		MultipartFile multi2 = room.getUpload2();
		System.out.println("multi1::::"+multi1);
		System.out.println("multi2::::"+multi2);
		
		File destination1 = 
				new File(uploadPath + File.separator +multi1.getOriginalFilename());
		
		File destination2 = 
				new File(uploadPath + File.separator +multi2.getOriginalFilename());
		
		System.out.println("destination1:::::"+destination1);
		System.out.println("destination2:::::"+destination2);
		
		try {
			multi1.transferTo(destination1);
			multi2.transferTo(destination2);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
		mav.addObject( "hotelnum", hotelnum );
		mav.setViewName("redirect:/rooms.roo");
		
		return mav; 	
	}//룸정보  DB입력
	
	
	
	
	
	
	//룸정보 수정
	@RequestMapping(value = "updateRoom.roo" )
	public String updateRoom(
		@RequestParam(value = "roomnum", required = false ) int roomnum,
		Model model) {
		Room room = roomdao.getroomdata(roomnum);
		model.addAttribute("room",room);
		return "UpdateRoom";
	}
	
	
	
	
	//룸정보 수정폼
	@RequestMapping(value = "updateRoom2.roo" )
	public ModelAndView updateRoom2(Room room) {
		int hotelnum = roomdao.hotelnumbyroomnum(room.getRoomnum());
		roomdao.update(room);
		ModelAndView mav = new ModelAndView();
		
		
		String uploadPath=servletContext.getRealPath("/resources");
		System.out.println("uploadPath:"+uploadPath);
		
		MultipartFile multi1 = room.getUpload1();
		MultipartFile multi2 = room.getUpload2();
		System.out.println("multi1::::"+multi1);
		System.out.println("multi2::::"+multi2);
		
		File destination1 = 
				new File(uploadPath + File.separator +multi1.getOriginalFilename());
		File destination11 = new File(uploadPath + File.separator+ room.getUpload11()); 

		File destination2 = 
				new File(uploadPath + File.separator +multi2.getOriginalFilename());
		
		File destination22 = new File(uploadPath + File.separator+ room.getUpload22());

		System.out.println("destination1:::::"+destination1);
		System.out.println("destination11:::::"+destination11);
		System.out.println("destination2:::::"+destination2);
		System.out.println("destination22:::::"+destination22);

        destination11.delete();
        destination22.delete();
		
		try {
		multi1.transferTo(destination1);
			multi2.transferTo(destination2);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
		
		mav.addObject( "hotelnum", hotelnum );
		mav.setViewName("redirect:/rooms.roo");
		
		return mav; 
	}
		
	//룸정보 삭제
	@RequestMapping(value = "deleteRoom.roo" )
	public ModelAndView deleteRoom(
			@RequestParam(value = "roomnum", required = false ) int roomnum
			) {
		int hotelnum = roomdao.hotelnumbyroomnum(roomnum); 
		System.out.println("hotelnum+++++hotelnum : "+hotelnum);
		System.out.println("roomnum+++++roomnum : "+roomnum);
		
		roomdao.deleteRoom(roomnum);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject( "hotelnum", hotelnum );
		mav.setViewName("redirect:/rooms.roo");
		
		
		return mav; 
	}//룸정보 삭제  return "redirect:/listRoom.roo";
	
	
	
	//검색된룸정보 보여주기
	@RequestMapping(value = "rooms.roo" )
	public ModelAndView Room(
			@RequestParam(value = "hotelnum", required = false ) String hotelnum,
			@RequestParam(value = "whatColumn", required = false ) String whatColumn,
			@RequestParam(value = "keyword", required = false ) String keyword,
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pageSize", required = false ) String pageSize,
			HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>() ;	
		
		map.put("hotelnum", hotelnum ) ;
		
		int GetroomCountbyhotel = roomdao.GetroomCountbyhotel( map );  
		
		System.out.print("(GetroomCountbyhotel) : " + GetroomCountbyhotel + ", ");
		String url = request.getContextPath() + "/rooms.roo" ;
		
		ModelAndView mav = new ModelAndView() ;
		
		Paging3 pageInfo 
			= new Paging3( pageNumber, pageSize, GetroomCountbyhotel, url, whatColumn, keyword) ;
		
		System.out.print( "offset : " + pageInfo.getOffset() + ", " ) ; 
		System.out.print( "limit : " + pageInfo.getLimit() + ", " ) ;  
		System.out.println("url :"+pageInfo.getUrl()+", ");
		
		List<Room> roomLists = roomdao.GetroomList(pageInfo,hotelnum);
		
		//List<Room> roomLists = roomdao.GetDataList( pageInfo, map );
		
		System.out.println("hotelLists.size()" + roomLists.size());
		mav.addObject( "roomLists", roomLists );		
		mav.addObject( "pageInfo", pageInfo );
		mav.addObject( "hotelnum", hotelnum );
		mav.setViewName("ListRoom");
		return mav;
	}//검색된룸정보 보여주기
	
	
	
	
	
	//모든룸정보 보여주기
	@RequestMapping(value = "listRoom.roo" )
	public ModelAndView listRoom(
		@RequestParam(value = "whatColumn", required = false ) String whatColumn,
		@RequestParam(value = "keyword", required = false ) String keyword,
		@RequestParam(value = "pageNumber", required = false ) String pageNumber,
		@RequestParam(value = "pageSize", required = false ) String pageSize,
		HttpServletRequest request) {
		
		Map<String, String> map = new HashMap<String, String>() ;	
		
		map.put("whatColumn", whatColumn ) ;
		map.put("keyword", "%" + keyword + "%" ) ;
		
		int totalCount = roomdao.GetTotalCount( map );
		System.out.print("(totalCount) : " + totalCount + ", ");
		String url = request.getContextPath() + "/listRoom.roo" ;
		
		ModelAndView mav = new ModelAndView();
		
		Paging3 pageInfo 
			= new Paging3( pageNumber, pageSize, totalCount, url, whatColumn, keyword);
		
		System.out.print( "offset : " + pageInfo.getOffset() + ", " ) ; 
		System.out.print( "limit : " + pageInfo.getLimit() + ", " ) ;  
		System.out.println("url :"+pageInfo.getUrl()+", ");
		
		List<Room> roomLists = roomdao.GetDataList( pageInfo, map );
		
		System.out.println("hotelLists.size()" + roomLists.size());
		mav.addObject( "roomLists", roomLists );		
		mav.addObject( "pageInfo", pageInfo );
		mav.setViewName("ListRoom");
		return mav;
	}//모든룸정보 보여주기
	

	
	/*roomList, commentList*/
	@RequestMapping(value = "room.roo" )
	public ModelAndView Room1(
			@RequestParam(value = "hotelnum", required = false ) String hotelnum,
			@RequestParam(value = "searchStart", required = false ) String searchStart,
			@RequestParam(value = "searchEnd", required = false ) String searchEnd,
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pageSize", required = false ) String pageSize,
			
			HttpServletRequest request) {
		
		Map<String, String> map = new HashMap<String, String>() ;	
		
		map.put("hotelnum", hotelnum ) ;
		map.put("searchStart", searchStart);
		map.put("searchEnd", searchEnd);
		
		int roomCount = roomdao.GetroomCountbyhotel( map );  
		System.out.println("=========rommcount========");
		System.out.println(roomCount);
		
		int commentCount = commentdao.GetTotalCount( map );
		System.out.println(commentCount);
		
		System.out.print("(GetroomCountbyhotel) : " + roomCount + ", ");
		System.out.print("(GetCommentCountbyhotel) : " + commentCount + ", ");
		String url = request.getContextPath() + "/room.roo" ;
		
		ModelAndView mav = new ModelAndView();
		
		Paging pageInfo 
			= new Paging( pageNumber, pageSize, commentCount, url, hotelnum) ;
		
		System.out.print( "offset : " + pageInfo.getOffset() + ", " ) ; 
		System.out.print( "limit : " + pageInfo.getLimit() + ", " ) ;  
		System.out.println("url :"+pageInfo.getUrl()+", ");
		System.out.println("hotelnum : " + hotelnum);
		
		
		List<Room> roomLists = roomdao.roomList(map);		//룸의 리스트들
		Room hroomLists = roomdao.himagelist(hotelnum);			//호텔의 이미지들
		
		int hotelnumber = Integer.parseInt(hotelnum);			//String hotelnum을 int로
		Hotel hotel = hotelDao.GetData(hotelnumber);			//hotelnum을 참조한 호텔의 정보들
		
		List<Comment> commentLists = commentdao.GetDataList(pageInfo, map);
		
		//List<Room> roomLists = roomdao.GetDataList( pageInfo, map );
		
		String carouselnum = "0";
		
		System.out.println("hotelLists.size()" + roomLists.size());
		mav.addObject( "roomLists", roomLists );	
		mav.addObject( "hroomLists", hroomLists );	
		mav.addObject( "commentLists", commentLists );	
		mav.addObject( "pageInfo", pageInfo );
		mav.addObject( "hotelnum", hotelnum );
		mav.addObject( "hotel", hotel);

		
		mav.addObject( "searchStart", searchStart );//피커
		mav.addObject( "searchEnd", searchEnd );//피커
		
		mav.addObject( "carouselnum", carouselnum );
		
		mav.setViewName("roomview");
		System.out.println("carouselnum = "+ carouselnum);
		return mav;
	}/*roomList + commentList*/
	
	
	@RequestMapping(value = "commentinsert.roo" )
	public ModelAndView insertComment(
			Comment bean,
			@RequestParam(value = "hotelnum", required = false ) String hotelnum,
			@RequestParam(value = "hotelscore", required = false ) String hotelscore,
			HttpServletRequest request) {
		System.out.println("insert comment:"+bean);
		ModelAndView mav = new ModelAndView();
		int cnt = -1;
		cnt = commentdao.insertComment(bean);
		System.out.println("insertComment의 cnt = "+ cnt);
		mav.addObject("hotelnum", hotelnum);
		mav.addObject("hotelscore", hotelscore);
		mav.setViewName("redirect:/room.roo");
		return mav;
		
	}//�썑湲곗젙蹂� �엯�젰	
/*	
 * @RequestMapping(value = "commentinsert.roo" )
	public ModelAndView insertComment(Comment bean) {
		System.out.println("comment:"+bean);
		ModelAndView mav = new ModelAndView();
		Integer cnt = -1;
		cnt = commentdao.insertComment(bean);
		mav.setViewName("redirect:/room.roo");
		return mav;
		
	}//�썑湲곗젙蹂� �엯�젰	
*/  	
  	
	//�썑湲곗젙蹂� �닔�젙媛��졇�삤湲�
		@RequestMapping(value = "commentupdate.roo" )
		public String updateCommentdata(
			@RequestParam(value = "commentnum", required = false ) int commentnum,
			Model model) {
			Comment comment = commentdao.getupdatedata(commentnum);
			model.addAttribute("comment",comment);
			return "CommentUpdate";
		}
	
	
	//�썑湲곗젙蹂� �닔�젙
		@RequestMapping(value = "commentupdate2.roo" )
		public ModelAndView updateComment2(Comment bean) {
				
			ModelAndView mav = new ModelAndView();
			
			Integer cnt = -1;
			cnt = commentdao.updatedata(bean);
			mav.setViewName("redirect:/room.roo");
			
			return mav;
	}
		
	//후기삭제
	@RequestMapping(value = "commentdelete.roo" )
		public String deleteComment(
				@RequestParam(value = "commentnum", required = false ) int commentnum,
				@RequestParam(value = "hotelnum", required = false ) int hotelnum,
				Model model) {
			
					
					int cnt = commentdao.deletedata(commentnum);
					return "redirect:/room.roo?hotelnum="+hotelnum ; 
		}

	@Override
	public void setServletContext(ServletContext servletContext) {
		// TODO Auto-generated method stub
		this.servletContext=servletContext;
		
	}	
	
}
