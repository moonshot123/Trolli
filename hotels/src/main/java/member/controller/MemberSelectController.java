package member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import member.model.Member;
import member.model.MemberCommonAndHost;
import member.model.MemberDao;
import reservation.model.AdminStatic;
import reservation.model.Reservation;
import reservation.model.ReservationDao;
import utility.Paging3;
import utility.Paging6;
import utility.Paging7;

@Controller
public class MemberSelectController {
	
	private static final String getPage = "./../mypage/MyPage";
	private static final String command = "member.mem";
	
	@Autowired
	@Qualifier("MyMemberDao")
	private MemberDao memberdao;
	
	
	@Autowired
	@Qualifier("MyHotelDao")
	private HotelDao hoteldao;
	
	
	@Autowired
	@Qualifier("MyReservationDao")
	private ReservationDao reservationDao;
	
	
	
	@RequestMapping(value = command )
	public ModelAndView doActionPost(
			@RequestParam(value="whatColumn",required=false) String whatColumn,
			@RequestParam(value="keyword",required=false) String keyword,
			@RequestParam(value="pageNumber",required=false) String pageNumber,
			@RequestParam(value="pageSize", required = false) String pageSize,
			
			@RequestParam(value="whatColumn2",required=false) String whatColumn2,
			@RequestParam(value="keyword2",required=false) String keyword2,
			@RequestParam(value="pageNumber2",required=false) String pageNumber2,
			@RequestParam(value="pageSize2", required = false) String pageSize2,
			
			@RequestParam(value="whatColumn3",required=false) String whatColumn3,
			@RequestParam(value="keyword3",required=false) String keyword3,
			@RequestParam(value="pageNumber3",required=false) String pageNumber3,
			@RequestParam(value="pageSize3", required = false) String pageSize3,
			
			HttpServletRequest request,
			@RequestParam(value="membernum", required = false) int membernum,
			HttpSession session
			/*int membernum*/
			) {
		
		/*  회원등급알아보려고 일단 정보 받아옴  */
		Member loginfo = (Member) session.getAttribute("loginfo");
		Member member = memberdao.getloginchek(membernum);
		//Member member = memberdao.getloginchek(membernum);
		
		ModelAndView mav = new ModelAndView();
		Map<String, String> map;
		Map<String, String> map2;
		Map<String, String> map3;
		
		System.out.println("회원등급 확인 하기:"+member.getLogincheck());
		
		
		
		
		
		
		if(member.getLogincheck() == 3 ){
			//일반 회원
			System.out.println("회원등급 : 일반회원입니다.");
			
			map = new HashMap<String, String>();
			map.put("whatColumn", whatColumn ); 
			map.put("keyword", "%"+keyword+"%");
			String memnumber = String.valueOf(membernum);
			map.put("membernum", memnumber);
			
			int totalCount1 = memberdao.GetBuyTotalCount(map);
			String url = request.getContextPath()+this.command;
			Paging6 pageInfo = new Paging6(pageNumber,pageSize,totalCount1,url,whatColumn,keyword, membernum);
			
			List<MemberCommonAndHost> MyBuylist= memberdao.MyBuyList(pageInfo,map);
			
			mav.addObject("MyBuylist", MyBuylist);
			mav.addObject("pageInfo", pageInfo);
			
			mav.setViewName(getPage); 
			
		}else if(member.getLogincheck() == 2){
			//호스트 회원
			System.out.println("회원등급 : 호스트등급 입니다.");
			
			map = new HashMap<String, String>();
			map.put("whatColumn", whatColumn ); 
			map.put("keyword", "%"+keyword+"%");
			String memnumber = String.valueOf(membernum);
			map.put("membernum", memnumber);
			
			int totalCount1 = memberdao.GetBuyTotalCount(map);
			String url = request.getContextPath()+this.command;
			Paging6 pageInfo = new Paging6(pageNumber,pageSize,totalCount1,url,whatColumn,keyword, membernum);
			
			List<MemberCommonAndHost> MyBuylist= memberdao.MyBuyList(pageInfo,map);
			
			mav.addObject("MyBuylist", MyBuylist);
			mav.addObject("pageInfo", pageInfo);
			
			//////////////////////////////////////////////여기까지 룸 결제 리스트
			
			map2 = new HashMap<String, String>();
			map2.put("whatColumn", whatColumn ); 
			map2.put("keyword", "%"+keyword+"%");
			
			int totalCount2 = memberdao.GetSellTotalCount(map);
			Paging7 pageInfo2 = new Paging7(pageNumber,pageSize,totalCount1,url,whatColumn,keyword, membernum);
			
			List<MemberCommonAndHost> MySellList= memberdao.MySellList(pageInfo2,map);
			
			System.out.println("MySellList.size"+MySellList.size());
			mav.addObject("MySellList", MySellList);
			mav.addObject("pageInfo2", pageInfo2);
			
			
			
			mav.setViewName(getPage); 
			
		}else{
			//admin
			System.out.println("회원등급 : 관리자 입니다.");
			
			
			//전체회원정보리스트 보기
			map = new HashMap<String, String>();
			
			map.put("whatColumn", whatColumn ); //  name contents null
			map.put("keyword", "%"+keyword+"%"); 
			
			int totalCount = memberdao.GetmemberTotalCount(map);
			
			System.out.println("전체(totalCount)"+totalCount+", ");
			String url = request.getContextPath()+"/"+this.command;
			
			System.out.println("url: "+url); // /ex/hotellist.hot
			System.out.println("command: "+command);
			
			Paging6 pageInfo = new Paging6(pageNumber,pageSize,totalCount,url,whatColumn,keyword,membernum);
			
			System.out.println("offset :"+pageInfo.getOffset()+", ");
			System.out.println("limit :"+pageInfo.getLimit()+", ");
			System.out.println("url :"+pageInfo.getUrl()+", ");
			
			List<Member> allmemberlist= memberdao.getAllMemberList(pageInfo,map);
			
			List<Member> allmemberlist2= memberdao.getAllMemberList2(map);
			
			System.out.println("allmemberlist.size(): "+ allmemberlist.size());
			mav.addObject("allmemberlist", allmemberlist);
			mav.addObject("allmemberlist2", allmemberlist2);
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("totalCount", totalCount);
			
			
			
			System.out.println("================= 회원정보 리스트 ===================");
			
			
			
			map2 = new HashMap<String, String>();
			
			map2.put("whatColumn", whatColumn2 ); //  name contents null
			map2.put("keyword", "%"+keyword2+"%"); 
			
			int totalCount2 = hoteldao.GetHotelTotalCount(map2);  
			     
			System.out.println("전체(totalCount)"+totalCount2+", ");
			String url2 = request.getContextPath()+"/"+this.command;
			
			System.out.println("url: "+url2); 
			System.out.println("command: "+command);
			
			Paging7 pageInfo2 = new Paging7(pageNumber2,pageSize,totalCount2,url2,whatColumn,keyword,membernum);
			
			System.out.println("offset :"+pageInfo2.getOffset()+", ");
			System.out.println("limit :"+pageInfo2.getLimit()+", ");
			System.out.println("url :"+pageInfo2.getUrl()+", ");
			
			List<Hotel> allHotellist= hoteldao.getAllHotelList(pageInfo2,map2);
			
			List<Hotel> allHotellist2= hoteldao.getAllHotelList2(map2);
			  
			System.out.println("hotelLists.size(): "+ allHotellist.size());   
			mav.addObject("allHotellist", allHotellist);
			mav.addObject("allHotellist2", allHotellist2);
			mav.addObject("pageInfo2", pageInfo2);
			mav.addObject("totalCount2", totalCount2);
			
			
			
			System.out.println("================= 호텔정보 리스트 ===================");
			
			
			

			
			//결제 리스트는 뺴고 정보만 보내주자...
			map3 = new HashMap<String, String>();
			
			map3.put("whatColumn", whatColumn3 ); //  name contents null
			map3.put("keyword", "%"+keyword3+"%"); 

			int totalCount3 = reservationDao.GetReservationCount(map3);  
			System.out.println("전체(totalCount3)"+totalCount3+", ");
			String url3 = request.getContextPath()+this.command;
			System.out.println("url: "+url3); // /ex/hotellist.hot
			System.out.println("command: "+command);
			Paging3 pageInfo3 = new Paging3(pageNumber3,pageSize3,totalCount3,url3,whatColumn3,keyword3);
			
			System.out.println("offset :"+pageInfo3.getOffset()+", ");
			System.out.println("limit :"+pageInfo3.getLimit()+", ");
			System.out.println("url :"+pageInfo3.getUrl()+", ");
			
			List<Reservation> reservationdata= reservationDao.getReservartionData();
			List<AdminStatic> adminstatic = reservationDao.getlinegraph();
			System.out.println(adminstatic);
			System.out.println("========djdjdjdjdjdjdj"+adminstatic.size());
			System.out.println("============="+reservationdata);
			
			System.out.println("reservationdata.size(): "+ reservationdata.size());
			mav.addObject("reservationdata", reservationdata);
			mav.addObject("adminstatic", adminstatic);
			mav.addObject("pageInfo3", pageInfo3);
			
			System.out.println(reservationdata.size());
			System.out.println("================= 결제정보 ===================");
			
			mav.setViewName(getPage); 
			
		}
		
		
		
	
		return mav;
	}

	
	
		
}
