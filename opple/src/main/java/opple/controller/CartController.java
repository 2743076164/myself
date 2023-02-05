package opple.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import opple.pojo.Cart;
import opple.pojo.Product;
import opple.pojo.User;
import opple.service.CartService;
import opple.service.UserService;

@Controller
@SessionAttributes("user")
public class CartController {
	@Autowired
    UserService userService;
	@Autowired
	CartService cartService;
	@Autowired
	Cart cart1;
	@Autowired
	User user;
	@Autowired
	Cart cart;
	
	@RequestMapping(value = "/insertToCart", method = RequestMethod.POST)
	public String insertToCart( Product product,Integer num,  HttpSession session, Model model) throws IllegalStateException, IOException {	
		user = (User) session.getAttribute("user");
		User result = userService.userLogin(user); 
	    System.out.println("进入添加到购物车。。。。。。。" + num);		
	
		//查看此用户是否有购物车信息
		List<Cart> userCartList = cartService.selectCartByUserId(result);			//查看此用户购物车中是否存在此商品
		cart = cartService.selectCartByUserandProduct(result, product);
		
        //如果此用户购物车不为空
		if (userCartList!= null) {
			
			//如果商品不在购物车中，则在购物车中加入此商品
	        if (cart==null) {
	        	//如果商品不在购物车中，则在购物车中加入此商品,同时商品数量暂设置为1
				cart1= new Cart(); 	
				cart1.setUserId(result.getId());
				cart1.setProductId(product.getId());
				cart1.setNumber(1);
			} else {
				cart1.setId(cart.getId());
				cart1.setUserId(result.getId());
				cart1.setProductId(product.getId());
				cart1.setNumber(cart.getNumber() + num );
			}					
		} else {
			
			userCartList = new ArrayList<Cart>();	
		}		
		//获取当前的日期
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String cartTime = sdf.format(date);				
		cart1.setCartTime(cartTime);
		cart1.setStatus(0);		
		System.out.println("cart:    "+ cart1.toString());
		int n=-1;
		if (cart1.getNumber()==1) {
			n= cartService.insertToCart(cart1);
		} 
		else
		{
		   n= cartService.updateCart(cart1);
		}
		//userCartList = cartService.selectCartByUserId(user);
		userCartList = cartService.selectCartWithProductByUserId(result);
		model.addAttribute("userCartList", userCartList);	
		session.setAttribute("mycart", userCartList);//新加
		return "cart";	

		//model.addAttribute("userCartList", userCartList);	
		
		//System.out.println("新的购物车。。"+ userCartList.size());	
	//	return "cart";			
	}
	
	@RequestMapping(value = "/goorder", method = RequestMethod.POST)
	public String goorder( int total,int totalnum , Product product,User user,HttpSession session, Model model) throws IllegalStateException, IOException {		
	    System.out.println("去支付。。。。。。。" );		
	    User users = userService.userLogin(user); 
	    
	    user = (User) session.getAttribute("user");

	    System.out.println(users.toString());
	    System.out.println("总价："+ total);
	    System.out.println("数量："+ totalnum);
	    System.out.println(users.getTelephone());

	    model.addAttribute("users", users);
	    model.addAttribute("total", total);
	    model.addAttribute("totalnum", totalnum);	    
	    return "goorder";
	}
	
	
	@RequestMapping("/cartList")
	public String allCart(Model model) {
		List<Cart> cartList=cartService.allCart();
		model.addAttribute("cartList",cartList);
		return "cartList";
	}

}