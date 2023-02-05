package opple.pojo;

import org.springframework.stereotype.Component;

@Component
public class Orderlist {
	 private Integer id;
	 private String oid;
	 private Integer pid;
	 private Integer buynum;

    

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Integer getBuynum() {
		return buynum;
	}

	public void setBuynum(Integer buynum) {
		this.buynum = buynum;
	}

	

	public Orderlist(Integer id, String oid, Integer pid, Integer buynum) {
		super();
		this.id = id;
		this.oid = oid;
		this.pid = pid;
		this.buynum = buynum;
	}

	public Orderlist() {
		super();
	}

	@Override
	public String toString() {
		return "Orderlist [id=" + id + ", oid=" + oid + ", pid=" + pid + ", buynum=" + buynum + "]";
	}
	

	

    
}