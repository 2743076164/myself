package opple.dao;

import java.util.List;

import opple.pojo.Order;

public interface OrderMapper {

	int insert(Order order);
	List<Order> selectOrderByUid(Integer uid);

}
