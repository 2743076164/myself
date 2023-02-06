package opple.service;

import java.util.List;

import opple.pojo.User;

public interface UserService {
	User userLogin(User user);
	public int userRegister(User user);
	List<User> allUser();	
	int deleteUser(String username);
	int updateUser(User u);
	List<User> selectByUsername(String username);
	List<User> selectByRegistertime(String registertime);
	int insertUsers(User u);
	List<User> selectUserById(int id);
	List<User> selectByUsername1(String username);	
	int insertUseradd(User user);
	int deleteUserId(int id);
	int insertUser(User u);
	List<User> selectAllUser();
	
	
	

}
