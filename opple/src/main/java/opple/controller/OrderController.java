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
	    System.out.println(">>>>��ʼ�µ��ˡ�������������" );
	    //����order����Ļ�ȡ	    
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
	    //��ȡ��ǰ������
        Date date = new Date();
        //����Ҫ��ȡ��ʲô����ʱ��
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //��ȡString���͵�ʱ��
        String orderTime = sdf.format(date);			
		order.setOrderTime(orderTime);
		order.setId(user.getId()+"_"+orderTime);
		System.out.println("������Ϣ:"  + order.toString());
		//�򶩵�order���в���һ����¼
		int n1 = orderService.insert(order);		
		//�����������
	    //�������鴦��ʼ
	    //��������orderList����Ļ�ȡ	   
	    //�򶩵���ϸorderList���в���N����¼
	    List<Orderlist> orderLists=new ArrayList<Orderlist>();
	    List<Cart> cartlists=  (List<Cart>) session.getAttribute("mycart");
	    for (Cart cart : cartlists) {
	    	orderList.setOid(order.getId());
	    	orderList.setPid(cart.getProductId());
	    	orderList.setBuynum(cart.getNumber());	    	
	    	orderLists.add(orderList);
	    	System.out.println("��������:  "  + orderList.toString());
	    	int n2= orderListService.insert(orderList);
		}
	       
	    model.addAttribute("order", order);
	    model.addAttribute("orderLists", orderLists);
	    model.addAttribute("cartlists", cartlists);
	    
	    return "order";
	}
     
}
