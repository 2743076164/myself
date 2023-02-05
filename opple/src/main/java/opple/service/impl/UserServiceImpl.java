package opple.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import opple.dao.UserMapper;
import opple.pojo.User;
import opple.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	public User userLogin(User user) {
		
		User result=userMapper.userLogin(user.getUsername());
		if(result==null){
			System.out.println("用户不存在");
			return null;
		}else if(result.getPassword().equals(user.getPassword())&&result.getRole().equals(user.getRole())){
			System.out.println("登陆成功");
			
			return result;
		}else{
			System.out.println("密码错误");
			return null;
		}
	}
	public int userRegister(User user) {
		int registerResult=0;
		User result=userMapper.selectUserByUsername(user.getUsername());
		if(result==null){
			registerResult=userMapper.inserUser(user);
		}else{
			System.out.println("用户已存在");
			registerResult=-1;
		}
		return registerResult;		
	}
	@Override
	public List<User> allUser() {
		// TODO Auto-generated method stub
		return userMapper.allUser();
	}
	
	@Override
	public int deleteUser(String username) {
		// TODO Auto-generated method stub
		return userMapper.deleteUser(username);
	}
	@Override
	public int updateUser(User u) {
		// TODO Auto-generated method stub
		return userMapper.updateUser(u);
	}
	@Override
	public List<User> selectByUsername(String username) {
		// TODO Auto-generated method stub
		return userMapper.selectByUsername(username);
	}
	
	@Override
	public List<User> selectByRegistertime(String registertime) {
		// TODO Auto-generated method stub
		return userMapper.selectByRegistertime(registertime);
	}
	@Override
	public int insertUsers(User u) {
		// TODO Auto-generated method stub
		return userMapper.insertUsers(u);
	}
	@Override
	public List<User> selectUserById(int id) {
		// TODO Auto-generated method stub
		return userMapper.selectUserById(id);
	}
	@Override
	public List<User> selectByUsername1(String username) {
		// TODO Auto-generated method stub
		return userMapper.selectByUsername1(username);
	}
	
	@Override
	public int insertUseradd(User user) {
		// TODO Auto-generated method stub
		return userMapper.insertUseradd(user);
	}
	@Override
	public int deleteUserId(int id) {
		// TODO Auto-generated method stub
		return userMapper.deleteUserId(id);
	}
	@Override
	public int insertUser(User u) {
		// TODO Auto-generated method stub
		return userMapper.insertUser(u);
	}
	@Override
	public List<User> selectAllUser() {
		// TODO Auto-generated method stub
		return userMapper.selectAllUser();
	}
	
	
	
	
	
}