package opple.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import opple.pojo.RequestUser;
import opple.pojo.User;
import opple.service.UserService;

@Controller
public class UserRest {
	
		@Autowired
		UserService userService;
		@Autowired
		RequestUser<User> result;	
		@RequestMapping(value = "/rest/users",method=RequestMethod.GET)
		@ResponseBody
		public RequestUser<User> allProduct(){
			List<User> userList = userService.allUser();
			if (userList != null) {
				result.setCode(200);
				result.setMessage("��ѯ�����û�");
				result.setSuccess(true);
				result.setData(userList);
			} else {
				result.setCode(200);
				result.setMessage("û�в�ѯ���û�");
				result.setSuccess(false);
				result.setData(null);
			}
			return result;
		}	
		
		
		@RequestMapping(value = "/rest/users", method = RequestMethod.POST)
		@ResponseBody
		public RequestUser<User> insertUser(@RequestBody User u) {
			int n = userService.insertUser(u);
			if (n >= 0) {
				result.setCode(201);
				result.setMessage("�û�ע��ɹ���");
				result.setSuccess(true);
				result.setData(null);
			} else {
				result.setCode(404);
				result.setMessage("�û�ע��ʧ�ܡ���");
				result.setSuccess(false);
				result.setData(null);
			}
			return result;
		}
		@RequestMapping(value = "/rest/user/{username}", method = RequestMethod.DELETE)
		@ResponseBody
		public  RequestUser<User> deleteUser(@PathVariable String username) {
			int n = userService.deleteUser(username);
			if (n >= 0) {
				result.setCode(204);
				result.setMessage("ע���û��ɹ�");
				result.setSuccess(true);
				result.setData(null);
			} else {
				result.setCode(404);
				result.setMessage("ע���û�ʧ��");
				result.setSuccess(false);
				result.setData(null);
			}
			return result;
		}
		@RequestMapping(value = "/rest/user/id/{id}", method = RequestMethod.DELETE)
		@ResponseBody
		public  RequestUser<User> deleteUserId(@PathVariable int id) {
			int n = userService.deleteUserId(id);
			if (n >= 0) {
				result.setCode(204);
				result.setMessage("ע���û��ɹ�");
				result.setSuccess(true);
				result.setData(null);
			} else {
				result.setCode(404);
				result.setMessage("ע���û�ʧ��");
				result.setSuccess(false);
				result.setData(null);
			}
			return result;
		}
		
		@RequestMapping(value = "/rest/user", method = RequestMethod.PUT)
		@ResponseBody
		public RequestUser<User> updateUser(@RequestBody User u) {
			int n = userService.updateUser(u);
			if (n >= 0) {
				result.setCode(200);
				result.setMessage("�ɹ��޸���id=" + u.getId() + "���û���Ϣ");
				result.setSuccess(true);
				result.setData(null);
			} else {
				result.setCode(200);
				result.setMessage("�û���Ϣ�޸�ʧ��");
				result.setSuccess(false);
				result.setData(null);
			}
			return result;
		}
		@RequestMapping(value = "/rest/user/username/{username}", method = RequestMethod.GET)
		@ResponseBody
		public RequestUser<User> selectByUsername(@PathVariable String username) {
			System.out.println("/rest/user/username/{username}" + username);
			List<User> userList = userService.selectByUsername(username);
			if (userList != null) {
				result.setCode(209);
				result.setMessage("�����û�����ѯ�û���Ϣ");
				result.setSuccess(true);
				result.setData(userList);
			} else {
				result.setCode(200);
				result.setMessage("û�в�ѯ����Ӧ���û���Ϣ");
				result.setSuccess(false);
				result.setData(null);
			}
			return result;
		}
		@RequestMapping(value ="/rest/user",method=RequestMethod.GET)
		@ResponseBody
		public RequestUser<User> selectByUsername1(String username){
			System.out.println("/rest/products/username/{username}" +username );
			List<User> userList = userService.selectByUsername1(username);	
			if (userList!=null) {
				result.setCode(200);
				result.setMessage("�����û�����ѯ�û�");
				result.setSuccess(true);
				result.setData(userList);	
			} else {
				result.setCode(200);
				result.setMessage("û�в�ѯ����Ӧ���û�");
				result.setSuccess(false);
				result.setData(null);	
			}			
		    return result;
		    }
		
		@RequestMapping(value = "/rest/user/registertime/{registertime}", method = RequestMethod.GET)
		@ResponseBody
		public RequestUser<User> selectByRegistertime(@PathVariable String registertime) {
			List<User> userList = userService.selectByRegistertime(registertime);
			if (userList != null) {
				result.setCode(200);
				result.setMessage("�����û�ע��ʱ���ѯ�û���Ϣ");
				result.setSuccess(true);
				result.setData(userList);
			} else {
				result.setCode(200);
				result.setMessage("û�в�ѯ����Ӧ���û���Ϣ");
				result.setSuccess(false);
				result.setData(null);
			}
			return result;
		}
		
		@RequestMapping(value = "/rest/user/id/{id}", method = RequestMethod.GET)
		@ResponseBody
		public RequestUser<User> selectUserById(@PathVariable int id) {
			List<User> userList = userService.selectUserById(id);
			if (userList != null) {
				result.setCode(200);
				result.setMessage("����id��ѯ���û�");
				result.setSuccess(true);
				result.setData(userList);
			} else {
				result.setCode(404);
				result.setMessage("û�в�ѯ����Ӧ���û�");
				result.setSuccess(false);
				result.setData(null);
			}
			return result;
		}

}
