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
//		System.out.println("�����½"+user.toString());
		User result = userService.userLogin(user); 
		
		System.out.println("�����½111"+result);
		session.setAttribute("user", result);
		System.out.println("�����½222"+user);
//		session.setAttribute("result", user);
		

		
        if (result == null ) {
        	model.addAttribute("url", "login");
			model.addAttribute("infomation", "��½ʧ�ܣ�");
			model.addAttribute("second", 2);
			return "tip";
		} else {
			if (result.getRole().equals("����Ա")) {
				return "defaultwell";
			} else {
				return "forward:/index";
			}
		}
        
        
        
	}	
	
	@RequestMapping("/userRegister")
	public String userRegister(User user,String password2, Model model) {
		System.out.println("����ע��"+user.toString() );		
		if (!user.getPassword().equals(password2)) {
			System.out.println("1111111111111111");
			model.addAttribute("url", "register");
			model.addAttribute("infomation", "���벻һ�£�");
			model.addAttribute("second", 2);

		} else {
			int result = userService.userRegister(user);
			if (result == 1) {
				model.addAttribute("url", "login");
				model.addAttribute("infomation", "ע��ɹ���");
				model.addAttribute("second", 2);
			} else if (result == -1) {
				System.out.println("22222222222222222222");
				model.addAttribute("url", "register");
				model.addAttribute("infomation", "�û����Ѵ��ڣ�");
				model.addAttribute("second", 2);
			} else {
				model.addAttribute("url", "register");
				model.addAttribute("infomation", "ע��ʧ�ܣ�");
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
			model.addAttribute("infomation", "�û����ӳɹ���");
			model.addAttribute("second", 2);
		} else {
			model.addAttribute("url", "userList");
			model.addAttribute("infomation", "�û�����ʧ�ܣ�");
			model.addAttribute("second", 2);
		}
		return "tip";
	}
	
	@RequestMapping("/selectAllUser")
	public String selectAllUser(Model model) {
		System.out.println("��ѯ�����û�");		
		users = userService.selectAllUser();
        System.out.println("�����û���   "+users);
        if (users==null ) {       	
			model.addAttribute("infomation", "û�в�ѯ���κ��û�����");
			model.addAttribute("second", 2);
			return "tip";
		} else {			
			model.addAttribute("users", users);			
			return "userOrderTree2";
		}
	}

}