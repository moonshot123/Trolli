package hotel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import utility.Paging;

@Controller
public class HotelController {

	private static final String getPage = "searchview";
	private static final String command = "search.hot";

	@Autowired
	@Qualifier("MyHotelDao")
	private HotelDao hotelDao;

	@RequestMapping(value = command)
	public ModelAndView doActionPost(
			@RequestParam(value = "search_p", required = false ) String search_p,
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pageSize", required = false ) String pageSize,
			@RequestParam(value = "searchStart", required = false ) String searchStart,
			@RequestParam(value = "searchEnd", required = false ) String searchEnd,
			@RequestParam(value = "roompeople", required = false ) String roompeople,
			@RequestParam(value = "sort", required = false ) String sort,
			Model model,
			HttpServletRequest request, 
			HttpServletResponse response	) throws IOException, ParseException  {


		System.out.print("검색할 단어(search_p) : " + search_p + ", ");
		System.out.print("pageNumber : " + pageNumber + ", ");
		System.out.print("pageSize : " + pageSize + ", ");
		System.out.println();
		System.out.println("roompeople : " + roompeople);
		System.out.println("sort : " + sort);
		
		ModelAndView mav = new ModelAndView();
	      SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");

	      if(searchEnd != "" && searchStart != ""){
	         Date S = s.parse(searchStart);
	         Date E = s.parse(searchEnd);


	         int compare = S.compareTo(E);
	         PrintWriter writer;
	         response.setContentType("text/html;charset=UTF-8");
	         writer = response.getWriter(); 

	         if( compare == 0 ){

	            writer.println("<script type='text/javascript'>");
	            writer.println("alert('체크아웃날짜가 체크인 날짜 이후인지 확인해주세요.');");
	            writer.println("history.back();");  
	            writer.println("</script>");
	            writer.flush();

	            mav.setViewName("redirect:/main.com");    

	         }
	      }
		
		
		
	/*	
		*/
		
		
		
		
		Map<String, String> map = new HashMap<String, String>() ;	

		map.put("search_p", "%" + search_p + "%" ) ;
		map.put("roompeople", roompeople ) ;
		map.put("searchStart", searchStart ) ;
		map.put("searchEnd", searchEnd ) ;
		map.put("sort", sort ) ;


		int totalCount = hotelDao.GetTotalCount( map );
		System.out.print("전체 행수(totalCount) : " + totalCount + ", ");
		String url = request.getContextPath() + "/" + this.command ;



		Paging pageInfo 
		= new Paging( pageNumber, pageSize, totalCount, url, search_p, roompeople, searchStart, searchEnd, sort);

		System.out.print( "offset : " + pageInfo.getOffset() + ", " ) ; 
		System.out.print( "limit : " + pageInfo.getLimit() + ", " ) ;  

		if(sort.equals("0")){
			System.out.println("sort0 들어옴");
			List<Hotel> hotelLists = hotelDao.GetDataList( pageInfo, map );
			System.out.println("조회된 건수: " + hotelLists.size());
			mav.addObject( "hotelLists", hotelLists );
			
		}else if(sort.equals("1")){
			System.out.println("sort1 들어옴");
			List<Hotel> hotelLists = hotelDao.GetDataList1( pageInfo, map );
			System.out.println("조회된 건수: " + hotelLists.size());
			mav.addObject( "hotelLists", hotelLists );	
			
		}else{
			System.out.println("sort2 들어옴");
			List<Hotel> hotelLists = hotelDao.GetDataList2( pageInfo, map );
			System.out.println("조회된 건수: " + hotelLists.size());
			mav.addObject( "hotelLists", hotelLists );	
		}

			
		mav.addObject( "pageInfo", pageInfo );
		mav.addObject( "searchStart", searchStart );
		mav.addObject( "searchEnd", searchEnd );
		mav.addObject( "roompeople", roompeople );
		mav.addObject( "search_p", search_p );
		mav.addObject( "sort", sort );
		mav.setViewName(getPage);

		//System.out.println("hotelLists : "+hotelLists);
		System.out.println("searchStartdate : "+ searchStart);
		System.out.println("serchEnddate : "+ searchEnd);
		System.out.println("search_p : " + search_p);
		System.out.println("roompeople : " + roompeople);
		System.out.println("sort (0,1,2) : " + sort);
		return mav;
	}
	
}

