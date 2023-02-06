package opple.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import opple.pojo.Cart;

import opple.pojo.RequestCart;
import opple.pojo.NumberByproduct;
import opple.service.CartService;

@Controller
public class CartERest {
	
	@Autowired
	CartService cartService;
	@Autowired
	RequestCart<Cart> result;
	@Autowired
	RequestCart<NumberByproduct> result1;
	
	@RequestMapping(value = "/rest/carts", method = RequestMethod.GET)
	@ResponseBody
	public RequestCart<Cart> allCart() {

		List<Cart> cartList = cartService.allCart();
		if (cartList != null) {
			result.setCode(200);
			result.setMessage("��ѯ���ж���");
			result.setSuccess(true);
			result.setData(cartList);
		} else {
			result.setCode(200);
			result.setMessage("û�в�ѯ������");
			result.setSuccess(false);
			result.setData(null);
		}
		return result;
	}
	
	@RequestMapping(value = "/rest/cart/numberByProductId",method=RequestMethod.GET)
	@ResponseBody
	public RequestCart<NumberByproduct> selectnumberByProductId(){
		List<NumberByproduct> cateList = cartService.selectnumberByProductId();
		if(cateList!=null) {
			result1.setCode(200);
			result1.setMessage("��ƷID��������ϵͼ");
			result1.setSuccess(true);
			result1.setData(cateList);
		}else {
			result1.setCode(404);
			result1.setMessage("û�в�ƷID��������ϵͼ");
			result1.setData(null);
			result1.setSuccess(false);
		}
	    return result1;
	}
	
	

}
