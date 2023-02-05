package opple.dao;

import java.util.List;

import opple.pojo.Orderlist;

public interface OrderListMapper {

	int insert(Orderlist orderList);
	List<Orderlist>  selectOrderlistByOid(String id);

}
