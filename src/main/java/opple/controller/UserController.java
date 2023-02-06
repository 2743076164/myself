package opple.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import opple.pojo.User;
import opple.service.UserService;

@Controller
@SessionAttributes("user")
public class UserController {
	@Autowired
    UserService userService;
	@Autowired
    List<User> users;
	
	
	@RequestMapping("/userLogin")
	public String userLogin(User user,HttpSession session,Model model) {
//		System.out.println("进入登陆"+user.toString());
		User result = userService.userLogin(user); 
		
		System.out.println("进入登陆111"+result);
		session.setAttribute("user", result);
		System.out.println("进入登陆222"+user);
//		session.setAttribute("result", user);
		

		
        if (result == null ) {
        	model.addAttribute("url", "login");
			model.addAttribute("infomation", "登陆失败！");
			model.addAttribute("second", 2);
			return "tip";
		} else {
			if (result.getRole().equals("管理员")) {
				return "defaultwell";
			} else {
				return "forward:/index";
			}
		}
        
        
        
	}	
	
	@RequestMapping("/userRegister")
	public String userRegister(User user,String password2, Model model) {
		System.out.println("进入注册"+user.toString() );		
		if (!user.getPassword().equals(password2)) {
			System.out.println("1111111111111111");
			model.addAttribute("url", "register");
			model.addAttribute("infomation", "密码不一致！");
			model.addAttribute("second", 2);

		} else {
			int result = userService.userRegister(user);
			if (result == 1) {
				model.addAttribute("url", "login");
				model.addAttribute("infomation", "注册成功！");
				model.addAttribute("second", 2);
			} else if (result == -1) {
				System.out.println("22222222222222222222");
				model.addAttribute("url", "register");
				model.addAttribute("infomation", "用户名已存在！");
				model.addAttribute("second", 2);
			} else {
				model.addAttribute("url", "register");
				model.addAttribute("infomation", "注册失败！");
				model.addAttribute("second", 2);
			}
		}		
		return "tip";
	}
	@RequestMapping("/userList")
	public String allUser(Model model) {
		List<User> userList=userService.allUser();
		model.addAttribute("userList",userList);
		return "userList";
	}
	
	@RequestMapping(value = "/insertUseradd", method = RequestMethod.POST)
	public String insertUseradd( User user, Model model) {		
		System.out.println("insertUseradd: " + user.toString());
		int result = userService.insertUseradd(user);
		if (result == 1) {
			model.addAttribute("url", "userList");
			model.addAttribute("infomation", "用户增加成功！");
			model.addAttribute("second", 2);
		} else {
			model.addAttribute("url", "userList");
			model.addAttribute("infomation", "用户增加失败！");
			model.addAttribute("second", 2);
		}
		return "tip";
	}
	
	@RequestMapping("/selectAllUser")
	public String selectAllUser(Model model) {
		System.out.println("查询所有用户");		
		users = userService.selectAllUser();
        System.out.println("所有用户：   "+users);
        if (users==null ) {       	
			model.addAttribute("infomation", "没有查询到任何用户数据");
			model.addAttribute("second", 2);
			return "tip";
		} else {			
			model.addAttribute("users", users);			
			return "userOrderTree2";
		}
	}

}