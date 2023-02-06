package opple.pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class Product {
	private int id;
	private String productname;
	private String category;
	private double price;
	private String image;
	private String barcode;
	private String qrcode;
	private String description;
	private Date protime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public String getQrcode() {
		return qrcode;
	}
	public void setQrcode(String qrcode) {
		this.qrcode = qrcode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getProtime() {
		return protime;
	}
	public void setProtime(String protime) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date time1;
		try {
			time1 = sdf.parse(protime);
			this.protime = time1;
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public Product() {
		super();
	}
	public Product(int id, String productname, String category, double price, String image, String barcode,
			String qrcode, String description, Date protime) {
		super();
		this.id = id;
		this.productname = productname;
		this.category = category;
		this.price = price;
		this.image = image;
		this.barcode = barcode;
		this.qrcode = qrcode;
		this.description = description;
		this.protime = protime;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", productname=" + productname + ", category=" + category + ", price=" + price
				+ ", image=" + image + ", barcode=" + barcode + ", qrcode=" + qrcode + ", description=" + description
				+ ", protime=" + protime + "]";
	}

}
