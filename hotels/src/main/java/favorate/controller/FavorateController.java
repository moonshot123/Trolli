package favorate.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import favorate.model.Favorate;
import favorate.model.FavorateDao;
import room.model.RoomDao;
import utility.Paging2;




@Controller
public class FavorateController implements ServletContextAware{

	
	//어노테이션
    @Autowired
	@Qualifier("MyFavorateDao")
	private FavorateDao favorateDao;
	
    @Autowired
	@Qualifier("MyRoomDao")
	private RoomDao roomdao;
    
	//리스트
	@RequestMapping(value = "favorate.fav")
	public ModelAndView ListPost(
			@RequestParam(value = "hotelnum", required = false ) String hotelnum,
	  		@RequestParam(value = "whatColumn", required = false ) String whatColumn,
	  		@RequestParam(value = "keyword", required = false ) String keyword,
	  		@RequestParam(value = "pageNumber", required = false ) String pageNumber,
	  		@RequestParam(value = "pageSize", required = false ) String pageSize,
	  		HttpServletRequest request) {
	  		
	  		Map<String, String> map = new HashMap<String, String>() ;	
	  		
	  		map.put("whatColumn", whatColumn ) ;
	  		map.put("keyword", "%" + keyword + "%" ) ;
	  		
	  		int totalCount = favorateDao.GetTotalCount(map);
	  		System.out.print("(totalCount) : " + totalCount + ", ");
	  		String url = request.getContextPath() + "/favorate.fav" ;
	  		
	  		ModelAndView mav = new ModelAndView();
	  		
	  		Paging2 pageInfo 
	  			= new Paging2( pageNumber, pageSize, totalCount, url, whatColumn, keyword);
	  		
	  		System.out.print( "offset : " + pageInfo.getOffset() + ", " ) ; 
	  		System.out.print( "limit : " + pageInfo.getLimit() + ", " ) ;  
	  		System.out.println("url :"+pageInfo.getUrl()+", ");
	  		
	  	    List<Favorate> favorateList = favorateDao.GetDataList( pageInfo, map );

	  	    
	  		System.out.println("favorateList.size()" + favorateList.size());
	  		mav.addObject( "favorateList", favorateList );

	  		mav.addObject( "pageInfo", pageInfo );
	  		mav.setViewName("HFavorate"); //jsp
	  		return mav;
	  	}
	

	//삽입
	@RequestMapping(value = "favorateinsert.fav" )
	public ModelAndView insertComment(@ModelAttribute("bean") @Valid Favorate bean,
			HttpServletRequest request, BindingResult bindingResult) {
		
		
		System.out.println("favorateinsert:"+bean);
		ModelAndView mav = new ModelAndView();
		
		//유효성검사
		if(bindingResult.hasErrors()){
			System.out.println("유효성 검사 오류입니다");
				mav.setViewName("/favorateinsert.fav");
				return mav;
			}
		
		int hotelnum = bean.getHotelnum();
		String hotelimg1 = bean.getHotelimg1();
		String hotelname = bean.getHotelname();
		int hotelscore = bean.getHotelscore();
		
		
		System.out.println(hotelnum+"호텔넘버");
		System.out.println(hotelname+"호텔이름");
		System.out.println(hotelimg1+"호텔이미지1");
		System.out.println(hotelscore+"호텔점수");
		
		
		int cnt = -1;
		cnt = favorateDao.insertFavorate(bean);
		System.out.println("위시리스트 삽입내용:"+bean);
		/*mav.addObject("hotelnum", hotelnum);

		mav.addObject("hotelname", hotelname);
		mav.addObject("hotelimg1", hotelimg1);*/
		mav.setViewName("redirect:/favorate.fav");
		return mav;
	}
	
	//삭제
	@RequestMapping(value = "favoratedelete.fav" )
	public String deleteData(int hotelnum) {
		
		int cnt = -1;
		cnt = favorateDao.deletedata(hotelnum);
		return "redirect:/favorate.fav"; 
	}

	@Override
	public void setServletContext(ServletContext arg0) {
		// TODO Auto-generated method stub
		
	}
	
	
	
}
