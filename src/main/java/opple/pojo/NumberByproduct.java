package opple.pojo;

import org.springframework.stereotype.Controller;

@Controller
public class NumberByproduct {
	private String productId ;
	private int number;
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public NumberByproduct(String productId, int number) {
		super();
		this.productId = productId;
		this.number = number;
	}
	public NumberByproduct() {
		super();
	}
	@Override
	public String toString() {
		return "NumberByproduct [productId=" + productId + ", number=" + number + "]";
	}
	
	
	

}
