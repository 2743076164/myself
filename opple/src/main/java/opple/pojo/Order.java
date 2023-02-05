package opple.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.text.ParseException;
import org.springframework.stereotype.Component;
@Component
public class Order {
	private String id;
    private Double money;
    private Integer number;
    private String receiverAddress;
    private String receiverName;
    private String receiverPhone;
    private String paystate;
    private Date ordertime;
    private Integer uid;
    private List<Orderlist>  orderlist; 


	

	public List<Orderlist> getOrderlist() {
		return orderlist;
	}

	public void setOrderlist(List<Orderlist> orderlist) {
		this.orderlist = orderlist;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getReceiverAddress() {
		return receiverAddress;
	}

	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	public String getPaystate() {
		return paystate;
	}

	public void setPaystate(String paystate) {
		this.paystate = paystate;
	}

	public Date getOrdertime() {
		return ordertime;
	}

	public void setOrderTime(String ordertime) {			
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time1;
		try {
			time1 = sdf.parse(ordertime);
			this.ordertime = time1;
		} catch (ParseException e) {
			e.printStackTrace();
		}		
	}


	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Order() {
		super();
	}

	public Order(String id, Double money, Integer number, String receiverAddress, String receiverName,
			String receiverPhone, String paystate, Date ordertime, Integer uid, List<Orderlist> orderlist) {
		super();
		this.id = id;
		this.money = money;
		this.number = number;
		this.receiverAddress = receiverAddress;
		this.receiverName = receiverName;
		this.receiverPhone = receiverPhone;
		this.paystate = paystate;
		this.ordertime = ordertime;
		this.uid = uid;
		this.orderlist = orderlist;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", money=" + money + ", number=" + number + ", receiverAddress=" + receiverAddress
				+ ", receiverName=" + receiverName + ", receiverPhone=" + receiverPhone + ", paystate=" + paystate
				+ ", ordertime=" + ordertime + ", uid=" + uid + ", orderlist=" + orderlist + "]";
	}

	
	

	
   
}