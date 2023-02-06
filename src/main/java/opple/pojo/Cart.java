package opple.pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class Cart {
	private Integer id;
    private Integer productId;
    private Integer userId;
//    private username
    private Integer number;
    private Integer status;
    private Date cartTime;
    private Product product;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCartTime() {
		return cartTime;
	}
	public void setCartTime(String cartTime) {			
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time1;
		try {
			time1 = sdf.parse(cartTime);
			this.cartTime = time1;
		} catch (ParseException e) {
			e.printStackTrace();
		}		
	}
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Cart() {
		super();
	}
	
	public Cart(Integer id, Integer productId, Integer userId, Integer number, Integer status, Date cartTime,
			Product product) {
		super();
		this.id = id;
		this.productId = productId;
		this.userId = userId;
		this.number = number;
		this.status = status;
		this.cartTime = cartTime;
		this.product = product;
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", productId=" + productId + ", userId=" + userId + ", number=" + number + ", status="
				+ status + ", cartTime=" + cartTime + ", product=" + product + "]";
	}
	
    

}
