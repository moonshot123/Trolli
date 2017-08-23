package hotel.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hotel.model.Hotel;
import hotel.model.HotelDao;

@Controller
public class HotelInsertController implements ServletContextAware{

	private static final String getPage="/HotelInsert";
	private static final String gotoPage="redirect:/hotellist.hot";
	private static final String command="/hotelinsert.hot";
	

	@Autowired
	@Qualifier("MyHotelDao")
	private HotelDao hotelDao;
	
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionGet(HttpSession session) {
		System.out.println(this.getClass()+"Get방식 들어옴");
		System.out.println("로그인포: " + session.getAttribute("loginfo"));
		System.out.println("================================================");
		return getPage;	
			
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView doActionPost(@ModelAttribute("hotel") @Valid Hotel hotel,
			BindingResult bindingResult){
		
		
		
		
		
		System.out.println(this.getClass() + " POST 방식 들어옴");
		// bindingResult
		ModelAndView mav = new ModelAndView();
		
		//유효성검사
		if(bindingResult.hasErrors()){
			System.out.println("유효성 검사 오류입니다");
				mav.setViewName(getPage);
				return mav;
			}
		
		
		String uploadPath=servletContext.getRealPath("/resources");
		System.out.println("uploadPath : "+uploadPath);
		
		System.out.println("=====================================");
		System.out.println(hotel);
		System.out.println("=====================================");
		
		
		

		//C:\SPRING2_KYY\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\hotels\resources
		
		MultipartFile multi1 = hotel.getUploadimg1();
		System.out.println("multi1:"+multi1);
		System.out.println("==============================");
		MultipartFile multi2 = hotel.getUploadimg2();
		System.out.println("multi2:"+multi2);
		System.out.println("==============================");
		MultipartFile multi3 = hotel.getUploadimg3();
		System.out.println("multi3:"+multi3);
		System.out.println("==============================");
		MultipartFile multi4 = hotel.getUploadimg4();
		System.out.println("multi4:"+multi4);
		System.out.println("==============================");

		System.out.println("빈즈");
		System.out.println(hotel);
		System.out.println("===================================================");
		
		// 데이터베이스에 추가하는 코드
		Integer cnt = -1;
		cnt = hotelDao.InsertData(hotel);
		
		
		if(cnt != -1){ // 성공
		
			mav.setViewName(gotoPage); // redirect:/list.hot
		
			 File destination1 = new File(uploadPath + File.separator+ multi1.getOriginalFilename());

	         
	         File destination2 = new File(uploadPath + File.separator+ multi2.getOriginalFilename());


	         File destination3 = new File(uploadPath + File.separator+ multi3.getOriginalFilename());


	         File destination4 = new File(uploadPath + File.separator+ multi4.getOriginalFilename());
	         
	         System.out.println(destination1);
	        
	         System.out.println("등록에 성공하셨습니다.");
	         
	         try {
	            multi1.transferTo(destination1);
	            multi2.transferTo(destination2);
	            multi3.transferTo(destination3);
	            multi4.transferTo(destination4);
	            // transferTo:원하는 위치에 저장할 때 사용
	            
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }else { //실패
	    	  System.out.println("업로드에 실패하였습니다.");
	    	  mav.setViewName(getPage);
	    	//HotelInsert.java
	      }
			return mav;
	   }
	   
	@Override
	public void setServletContext(ServletContext context) {
		// TODO Auto-generated method stub
		servletContext=context;		
	}

	

}
