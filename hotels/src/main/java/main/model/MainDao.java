package main.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MyMainDao")
public class MainDao {

	

	private final String namespace = "main.model.Main"; //bean


	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public MainDao(){}
	
	
	
}
