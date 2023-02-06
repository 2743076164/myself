package opple.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import opple.dao.CartMapper;
import opple.pojo.Cart;
import opple.pojo.Product;
import opple.pojo.User;
import opple.pojo.NumberByproduct;
import opple.service.CartService;
@Service
public class CartServiceImpl implements CartService{
	@Autowired
    CartMapper cartMapper;
	@Autowired
	Cart resultCart;
	@Autowired
	Cart cart;
	@Override
	public int insertToCart(Cart cart) {
		// TODO Auto-generated method stub
		return cartMapper.insertToCart(cart);
	}
	@Override
	public List<Cart> selectCartByUserId(User user) {
		List<Cart> result = cartMapper.selectCartByUserId(user);
    	return result;
	}
	@Override
	public Cart selectCartByUserandProduct(User user, Product product) {
		cart.setUserId(user.getId());
		cart.setProductId(product.getId());
		return cartMapper.selectCartByUserandProduct(cart);
	}
	@Override
	public int updateCart(Cart cart1) {
		// TODO Auto-generated method stub
		return cartMapper.updateCart(cart);
	}
	@Override
	public List<Cart> selectCartWithProductByUserId(User user) {
		// TODO Auto-generated method stub
		return cartMapper.selectCartWithProductByUserId(user);
	}
	@Override
	public List<Cart> allCart() {
		// TODO Auto-generated method stub
		return cartMapper.allCart();
	}
	@Override
	public List<NumberByproduct> selectnumberByProductId() {
		// TODO Auto-generated method stub
		return cartMapper.selectnumberByProductId();
	}
	
}