package opple.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import opple.dao.OrderMapper;
import opple.pojo.Order;
import opple.service.OrderService;



@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderMapper orderMapper;

	@Override
	public int insert(Order order) {
		// TODO Auto-generated method stub
		return orderMapper.insert(order);
	}

}
