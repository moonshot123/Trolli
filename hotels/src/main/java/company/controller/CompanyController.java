package company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import company.model.CompanyDao;

@Controller
public class CompanyController {
			
	
		//어노테이션
		@Autowired
		@Qualifier("MyCompanyDao")
		private CompanyDao companydao;
		 
		
		@RequestMapping(value ="showcompany.co" )
		public String doActionPost() {
			return "ShowCompany";
		}
			
		@RequestMapping(value ="people.co" )
		public String people() {
			return "People";
		}
		
		@RequestMapping(value ="rule.co" )
		public String rule() {
			return "Rule";
		}
		
		@RequestMapping(value ="qna.co" )
		public String qna() {
			return "qna";
		}
	
}
