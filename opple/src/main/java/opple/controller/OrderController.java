package opple.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import opple.pojo.Cart;
import opple.pojo.Order;
import opple.pojo.Orderlist;
import opple.pojo.User;
import opple.service.OrderListService;
import opple.service.OrderService;
import opple.service.UserService;

@Controller
@SessionAttributes(value={"user","mycart"})
public class OrderController {
	
	@Autowired
	OrderService orderService;	
	@Autowired
	User user;
	@Autowired
	Order order;
	@Autowired
	Cart cart;
	@Autowired
	Orderlist orderList;
	@Autowired
	OrderListService orderListService;
	@Autowired
    UserService userService;

	@RequestMapping(value = "/order", method = RequestMethod.POST)
	
	public String order(HttpServletRequest request, User user, HttpSession session, Model model) throws IllegalStateException, IOException {		
	    System.out.println(">>>>开始下单了。。。。。。。" );
	    //订单order对象的获取	    
	    user = (User) session.getAttribute("user");
	    
	    User users = userService.userLogin(user); 
	    
	    String name= request.getParameter("name");
	    String address= request.getParameter("address");
	    String telephone= request.getParameter("telephone");
	    
	    String newaddress= request.getParameter("newname");
	    String newname= request.getParameter("newaddress");
	    String newtelephone= request.getParameter("newtelephone");
	    String total= request.getParameter("total");
	    String totalnum= request.getParameter("totalnum");	 
	    
	    System.out.println("totalnum:"+totalnum);
	    
	    order.setMoney( Double.valueOf(total));	    
	    order.setUid(users.getId());
	    order.setPaystate("1");  
	    order.setNumber(Integer.valueOf(totalnum));
	    
	    if ( !newname.equals("") &&  !newaddress.equals("")  && !newtelephone.equals("") ) {
			order.setReceiverName(newname);
			order.setReceiverAddress(newaddress);
			order.setReceiverPhone(newtelephone);
		}
	    else
	    {
	    	order.setReceiverName(name);
			order.setReceiverAddress(address);
			order.setReceiverPhone(telephone);
	    }
	    //获取当前的日期
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String orderTime = sdf.format(date);			
		order.setOrderTime(orderTime);
		order.setId(user.getId()+"_"+orderTime);
		System.out.println("订单信息:"  + order.toString());
		//向订单order表中插入一条记录
		int n1 = orderService.insert(order);		
		//订单处理结束
	    //订单详情处理开始
	    //订单详情orderList对象的获取	   
	    //向订单明细orderList表中插入N条记录
	    List<Orderlist> orderLists=new ArrayList<Orderlist>();
	    List<Cart> cartlists=  (List<Cart>) session.getAttribute("mycart");
	    for (Cart cart : cartlists) {
	    	orderList.setOid(order.getId());
	    	orderList.setPid(cart.getProductId());
	    	orderList.setBuynum(cart.getNumber());	    	
	    	orderLists.add(orderList);
	    	System.out.println("订单详情:  "  + orderList.toString());
	    	int n2= orderListService.insert(orderList);
		}
	       
	    model.addAttribute("order", order);
	    model.addAttribute("orderLists", orderLists);
	    model.addAttribute("cartlists", cartlists);
	    
	    return "order";
	}
     
}
