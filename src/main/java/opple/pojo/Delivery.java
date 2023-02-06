package opple.pojo;

import java.util.Date;

public class Delivery {
    private Integer id;

    private Integer uid;

    private Integer oid;

    private String image;

    private Date deliverydate;

    private String state;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getDeliverydate() {
		return deliverydate;
	}

	public void setDeliverydate(Date deliverydate) {
		this.deliverydate = deliverydate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Delivery() {
		super();
	}

	public Delivery(Integer id, Integer uid, Integer oid, String image, Date deliverydate, String state) {
		super();
		this.id = id;
		this.uid = uid;
		this.oid = oid;
		this.image = image;
		this.deliverydate = deliverydate;
		this.state = state;
	}

	@Override
	public String toString() {
		return "Delivery [id=" + id + ", uid=" + uid + ", oid=" + oid + ", image=" + image + ", deliverydate="
				+ deliverydate + ", state=" + state + "]";
	}

  
}