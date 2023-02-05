package opple.pojo;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class User {
	private int id;
	private String username;
	private String password;	
	private String role;
	private Date registertime;
	private String cardid;
	private String name;
	private String address;
	private String telephone;
	private List<Order> order;
	
	
	public List<Order> getOrder() {
		return order;
	}
	public void setOrder(List<Order> order) {
		this.order = order;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getCardid() {
		return cardid;
	}
	public void setCardid(String cardid) {
		this.cardid = cardid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Date getRegistertime() {
		return registertime;
	}
	public void setRegistertime(Date registertime) {
		this.registertime = registertime;
	}
	public User(int id, String username, String password, String role, Date registertime, String cardid, String name,
			String address, String telephone, List<Order> order) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.role = role;
		this.registertime = registertime;
		this.cardid = cardid;
		this.name = name;
		this.address = address;
		this.telephone = telephone;
		this.order = order;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", role=" + role
				+ ", registertime=" + registertime + ", cardid=" + cardid + ", name=" + name + ", address=" + address
				+ ", telephone=" + telephone + ", order=" + order + "]";
	}
	
	
	
	
	
	
}
