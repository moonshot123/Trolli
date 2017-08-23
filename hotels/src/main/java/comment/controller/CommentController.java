package comment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import comment.model.Comment;
import comment.model.CommentDao;

import utility.Paging2;




@Controller
public class CommentController implements ServletContextAware{

	@Autowired
	@Qualifier("MyCommentDao")
	private CommentDao commentdao;
	
	@Autowired  
    ServletContext servletContext; 
    
    
  //모든후기정보 보여주기
  	@RequestMapping(value = "commentlist.cmt" )
  	public ModelAndView CommentList(
  		@RequestParam(value = "whatColumn", required = false ) String whatColumn,
  		@RequestParam(value = "keyword", required = false ) String keyword,
  		@RequestParam(value = "pageNumber", required = false ) String pageNumber,
  		@RequestParam(value = "pageSize", required = false ) String pageSize,
  		HttpServletRequest request) {
  		
  		Map<String, String> map = new HashMap<String, String>() ;	
  		
  		map.put("whatColumn", whatColumn ) ;
  		map.put("keyword", "%" + keyword + "%" ) ;
  		
  		int totalCount = commentdao.GetTotalCount( map );
  		System.out.print("(totalCount) : " + totalCount + ", ");
  		String url = request.getContextPath() + "/commentlist.cmt" ;
  		
  		ModelAndView mav = new ModelAndView();
  		
  		Paging2 pageInfo 
  			= new Paging2( pageNumber, pageSize, totalCount, url, whatColumn, keyword);
  		
  		System.out.print( "offset : " + pageInfo.getOffset() + ", " ) ; 
  		System.out.print( "limit : " + pageInfo.getLimit() + ", " ) ;  
  		System.out.println("url :"+pageInfo.getUrl()+", ");
  		
  		List<Comment> commentLists = commentdao.GetDataList( pageInfo, map );
  		
  		System.out.println("commentLists.size()" + commentLists.size());
  		mav.addObject( "commentLists", commentLists );		
  		mav.addObject( "pageInfo", pageInfo );
  		mav.setViewName("CommentList"); //jsp
  		return mav;
  	}//모든후기정보 보여주기
	
	
  	
	//후기정보 입력
	@RequestMapping(value = "commentinsert.cmt" )
	public ModelAndView insertComment(Comment bean) {
		System.out.println("comment:"+bean);
		ModelAndView mav = new ModelAndView();
		Integer cnt = -1;
		cnt = commentdao.insertComment(bean);
		mav.setViewName("redirect:/commentlist.cmt");
		return mav;
	}//후기정보 입력	
  	
  	
	//후기정보 수정가져오기
		@RequestMapping(value = "commentupdate.cmt" )
		public String updateCommentdata(
			@RequestParam(value = "commentnum", required = false ) int commentnum,
			Model model) {
			Comment comment = commentdao.getupdatedata(commentnum);
			model.addAttribute("comment",comment);
			return "CommentUpdate";
		}
	
	
	//후기정보 수정
		@RequestMapping(value = "commentupdate2.cmt" )
		public ModelAndView updateComment2(Comment bean) {
				
			ModelAndView mav = new ModelAndView();
			
			Integer cnt = -1;
			cnt = commentdao.updatedata(bean);
			mav.setViewName("redirect:/commentlist.cmt");
			
			return mav;
	}
		
	//후기삭제
	@RequestMapping(value = "commentdelete.cmt" )
		public String deleteRoom(int commentnum) {
			
			int cnt = -1;
			cnt = commentdao.deletedata(commentnum);
			return "redirect:/commentlist.cmt"; 
		}	
	
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		// TODO Auto-generated method stub
		
	}

}
