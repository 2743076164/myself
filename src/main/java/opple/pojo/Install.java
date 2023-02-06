package opple.pojo;

import java.util.Date;

public class Install {
    private Integer id;

    private Integer uid;

    private Integer oid;

    private String image;

    private Date installdate;

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

	public Date getInstalldate() {
		return installdate;
	}

	public void setInstalldate(Date installdate) {
		this.installdate = installdate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Install() {
		super();
	}

	public Install(Integer id, Integer uid, Integer oid, String image, Date installdate, String state) {
		super();
		this.id = id;
		this.uid = uid;
		this.oid = oid;
		this.image = image;
		this.installdate = installdate;
		this.state = state;
	}

	@Override
	public String toString() {
		return "Install [id=" + id + ", uid=" + uid + ", oid=" + oid + ", image=" + image + ", installdate="
				+ installdate + ", state=" + state + "]";
	}

   
}