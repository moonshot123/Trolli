package company.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MyCompanyDao")
public class CompanyDao {
	
	
	private final String namespace = "company.model.Company"; //bean
	
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public CompanyDao(){}
	
	
	
}
