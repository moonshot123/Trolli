package mail;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class MailController {
 
  @Autowired
  private JavaMailSender mailSender;
 
  
  //사이트 메인페이지
	private static final String getPage = "mailForm";
	private static final String gotoPage = "redirect:/main.com";
	private static final String command = "mail.mi";
 
  // mailForm
  @RequestMapping(value = command, method = RequestMethod.GET)
  public ModelAndView mailForm() {
	  ModelAndView mav = new ModelAndView();
		
		mav.setViewName(getPage);
		return mav;
  }  
 
  // mailSending 코드
  @RequestMapping(value = command, method = RequestMethod.POST)
  public String mailSending(HttpServletRequest request) {
   
    String setfrom = "bestkeyplay@gmail.com";         
    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
    String title   = request.getParameter("title");      // 제목
    String content = request.getParameter("content");    // 내용
   
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper 
                        = new MimeMessageHelper(message, true, "UTF-8");
 
      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
      messageHelper.setTo(tomail);     // 받는사람 이메일
      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
      messageHelper.setText(content);  // 메일 내용
     
/*      Naver나 Google의 SMTP 서버는 메일 보내기를 대행해주는 역할만을 수행해왔었습니다.

      위의 SMTP 서버를 이용하여 메일보내기 로직을 처리하는 페이지를 만드는데 무리가 없었죠.

      그러나 어느 순간부터, 저희가 위에서 만들었던 SMTPAuthenticator 클래스 내의 인증정보와

      mailForm.html에 입력하는 from 부분의 계정이 같지 않으면 전송이 불가능해졌습니다. ㅠㅠ

      즉, 보내는 사람의 주소는 SMTP 서버에 인증하는 계정과 같아야만 전송이 가능합니다..*/

      
      
      mailSender.send(message);
    } catch(Exception e){
      System.out.println(e);
      
    }
    

    return "redirect:/mail.mi";
  }
} 
