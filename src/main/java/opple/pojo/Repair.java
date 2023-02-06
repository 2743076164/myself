package opple.pojo;

import java.util.Date;

public class Repair {
    private Integer id;

    private Integer uid;

    private Integer pid;

    private String image;

    private Date repairdate;

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

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getRepairdate() {
		return repairdate;
	}

	public void setRepairdate(Date repairdate) {
		this.repairdate = repairdate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Repair() {
		super();
	}

	public Repair(Integer id, Integer uid, Integer pid, String image, Date repairdate, String state) {
		super();
		this.id = id;
		this.uid = uid;
		this.pid = pid;
		this.image = image;
		this.repairdate = repairdate;
		this.state = state;
	}

	@Override
	public String toString() {
		return "Repair [id=" + id + ", uid=" + uid + ", pid=" + pid + ", image=" + image + ", repairdate=" + repairdate
				+ ", state=" + state + "]";
	}

    
}