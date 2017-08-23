package hotel.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hotel.model.Hotel;
import hotel.model.HotelDao;

@Controller
public class HotelUpdateController implements ServletContextAware{
	private static final String getPage="/HotelUpdate";
	private static final String gotoPage="redirect:/hotellist.hot";
	private static final String command="/hotelupdate.hot";
	

	@Autowired
	@Qualifier("MyHotelDao")
	private HotelDao hotelDao;

	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(@RequestParam(value="hotelnum", required=true) 
								int hotelnum,Model model) {
			System.out.println("넘어오는 호텔번호:"+hotelnum);
			Hotel hotel = hotelDao.GetData(hotelnum);
			model.addAttribute("hotel",hotel);
			return getPage;
		
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doActionPost(@ModelAttribute("hotel") @Valid Hotel hotel,
			BindingResult bindingResult) {
		
		System.out.println("=========tostring============");
		System.out.println(hotel);
		System.out.println("=============================");
		System.out.println("HotelUpdateController POST방식");
		
		MultipartFile multi1 = hotel.getUploadimg1();
		System.out.println("multi1:"+multi1);
		System.out.println("==============================");
		MultipartFile multi2 = hotel.getUploadimg2();
		MultipartFile multi3 = hotel.getUploadimg3();
		MultipartFile multi4 = hotel.getUploadimg4();

		// bindingResult
		ModelAndView mav = new ModelAndView();
		
		String uploadDir=servletContext.getRealPath("/resources");
		System.out.println("PUCon uploadDir : "+uploadDir);
		
		Integer cnt = -1;
		cnt = hotelDao.UpdateData(hotel);
		
		if(cnt != -1){ // 성공
			
			mav.setViewName(gotoPage);
		
			 File destination1 = new File(uploadDir + File.separator+ multi1.getOriginalFilename());

	         File destination11 = new File(uploadDir + File.separator+ hotel.getUploadimg11());

	         
	        File destination2 = new File(uploadDir + File.separator+ multi2.getOriginalFilename());

	         File destination22 = new File(uploadDir + File.separator+ hotel.getUploadimg22());

	         
	         
	         File destination3 = new File(uploadDir + File.separator+ multi3.getOriginalFilename());

	         File destination33 = new File(uploadDir + File.separator+ hotel.getUploadimg33());

	        
	         
	         File destination4 = new File(uploadDir + File.separator+ multi4.getOriginalFilename());

	         File destination44 = new File(uploadDir + File.separator+ hotel.getUploadimg44());

	         destination11.delete();
	         destination22.delete();
	         destination33.delete();
	         destination44.delete();
	         
	         System.out.println("업로드에 성공하셨습니다.");
	         
	         try {
	            multi1.transferTo(destination1);
	            multi2.transferTo(destination2);
	            multi3.transferTo(destination3);
	            multi4.transferTo(destination4);
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }else { //실패
	    	  System.out.println("업로드에 실패하였습니다.");
	    	  mav.setViewName(getPage);
	      }
			return mav;
	   }
	   
	@Override
	public void setServletContext(ServletContext context) {
		// TODO Auto-generated method stub
		servletContext=context;		
	}
	

}
