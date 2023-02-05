package opple.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import opple.dao.OrderListMapper;
import opple.pojo.Orderlist;
import opple.service.OrderListService;

@Service
public class OrderListServiceImpl implements OrderListService{
	
	@Autowired
	OrderListMapper orderListMapper;

	@Override
	public int insert(Orderlist orderList) {
		// TODO Auto-generated method stub
		return orderListMapper.insert(orderList);
	}

}
