package opple.pojo;

import java.util.List;

import org.springframework.stereotype.Controller;
@Controller
public class RequestUser<T> {
	int code;
	String message;
	boolean success;
	List<T> data;
	T record;
	
	public T getRecord() {
		return record;
	}
	public void setRecord(T record) {
		this.record = record;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	public RequestUser() {
		super();
	}
	public RequestUser(int code, String message, boolean success, List<T> data) {
		super();
		this.code = code;
		this.message = message;
		this.success = success;
		this.data = data;
	}
	@Override
	public String toString() {
		return "RequestUser [code=" + code + ", message=" + message + ", success=" + success + ", data=" + data
				+ ", record=" + record + "]";
	}
	
	
	
	

}
