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
				result.setMessage("查询所有用户");
				result.setSuccess(true);
				result.setData(userList);
			} else {
				result.setCode(200);
				result.setMessage("没有查询到用户");
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
				result.setMessage("用户注册成功！");
				result.setSuccess(true);
				result.setData(null);
			} else {
				result.setCode(404);
				result.setMessage("用户注册失败。。");
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
				result.setMessage("注销用户成功");
				result.setSuccess(true);
				result.setData(null);
			} else {
				result.setCode(404);
				result.setMessage("注销用户失败");
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
				result.setMessage("注销用户成功");
				result.setSuccess(true);
				result.setData(null);
			} else {
				result.setCode(404);
				result.setMessage("注销用户失败");
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
				result.setMessage("成功修改了id=" + u.getId() + "的用户信息");
				result.setSuccess(true);
				result.setData(null);
			} else {
				result.setCode(200);
				result.setMessage("用户信息修改失败");
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
				result.setMessage("根据用户名查询用户信息");
				result.setSuccess(true);
				result.setData(userList);
			} else {
				result.setCode(200);
				result.setMessage("没有查询到相应的用户信息");
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
				result.setMessage("根据用户名查询用户");
				result.setSuccess(true);
				result.setData(userList);	
			} else {
				result.setCode(200);
				result.setMessage("没有查询到相应的用户");
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
				result.setMessage("根据用户注册时间查询用户信息");
				result.setSuccess(true);
				result.setData(userList);
			} else {
				result.setCode(200);
				result.setMessage("没有查询到相应的用户信息");
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
				result.setMessage("根据id查询到用户");
				result.setSuccess(true);
				result.setData(userList);
			} else {
				result.setCode(404);
				result.setMessage("没有查询到相应的用户");
				result.setSuccess(false);
				result.setData(null);
			}
			return result;
		}

}
