package hotel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import utility.Paging3;

@Controller
public class HotelListController {
	
	private static final String getPage = "HotelList";
	private static final String command = "/hotellist.hot";

	@Autowired
	@Qualifier("MyHotelDao")
	private HotelDao hotelDao;
	 
	@RequestMapping(value = command )
	public ModelAndView doActionPost(
			@RequestParam(value="whatColumn",required=false) String whatColumn,
			@RequestParam(value="keyword",required=false) String keyword,
			@RequestParam(value="pageNumber",required=false) String pageNumber,
			@RequestParam(value="pageSize", required = false) String pageSize,
			HttpServletRequest request){
		
	
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("whatColumn", whatColumn ); //  name contents null
		map.put("keyword", "%"+keyword+"%"); 
		
		int totalCount = hotelDao.GetHostTotalCount(map);
		
		System.out.println("전체(totalCount)"+totalCount+", ");
		String url = request.getContextPath()+this.command;
		
		System.out.println("url: "+url); // /ex/hotellist.hot
		System.out.println("command: "+command);
		ModelAndView mav = new ModelAndView();
		
		Paging3 pageInfo = new Paging3(pageNumber,pageSize,totalCount,url,whatColumn,keyword);
		
		System.out.println("offset :"+pageInfo.getOffset()+", ");
		System.out.println("limit :"+pageInfo.getLimit()+", ");
		System.out.println("url :"+pageInfo.getUrl()+", ");
		
		//호스팅가입하기에서 사용하는 호텔리스트보기
		List<Hotel> hotelLists = hotelDao.GetHostDataList(pageInfo,map);
		
		System.out.println("hotelLists.size(): "+ hotelLists.size());
		mav.addObject("hotelLists", hotelLists);//hotelLists: 
		mav.addObject("pageInfo", pageInfo);
		mav.setViewName(getPage); //"HotelList"
		return mav;
	
	}	
	
}
