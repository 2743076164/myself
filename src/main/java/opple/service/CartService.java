package opple.service;

import java.util.List;

import opple.pojo.Cart;
import opple.pojo.Product;
import opple.pojo.User;
import opple.pojo.NumberByproduct;

public interface CartService {

	List<Cart> selectCartByUserId(User user);

	Cart selectCartByUserandProduct(User user, Product product);

	int insertToCart(Cart cart1);

	int updateCart(Cart cart1);
	
	List<Cart> selectCartWithProductByUserId(User user);

	List<Cart> allCart();

	List<NumberByproduct> selectnumberByProductId();

}
