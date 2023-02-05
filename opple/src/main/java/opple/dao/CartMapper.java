package opple.dao;

import java.util.List;

import opple.pojo.Cart;
import opple.pojo.User;
import opple.pojo.NumberByproduct;

public interface CartMapper {
	
	List<Cart> selectCartByUserId(User user);
	Cart selectCartByUserandProduct(Cart cart);
	int insertToCart(Cart cart);
	int updateCart(Cart cart);
	List<Cart> selectCartWithProductByUserId(User user);
	List<Cart> allCart();
	List<NumberByproduct> selectnumberByProductId();

}
