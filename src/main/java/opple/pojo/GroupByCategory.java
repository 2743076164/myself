package opple.pojo;

import org.springframework.stereotype.Controller;

@Controller
public class GroupByCategory {
	private String category ;
	private int num;
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public GroupByCategory() {
		super();
	}
	public GroupByCategory(String category, int num) {
		super();
		this.category = category;
		this.num = num;
	}
	@Override
	public String toString() {
		return "GroupByCategory [category=" + category + ", num=" + num + "]";
	}
	

}
