package order.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MyOrderDao")
public class OrderDao {
	
	private final String namespace = "order.model.Order"; //bean


	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public OrderDao(){}

	public Order GetAlldata() {
		return null;
	}
	
}
