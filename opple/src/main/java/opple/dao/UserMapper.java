package opple.dao;


import java.util.List;

import opple.pojo.User;

public interface UserMapper {

	List<User> allUser();

	public User selectUserByUsername(String username);

	public int inserUser(User user);

	User userLogin(String username);

	int deleteUser(String username);

	int updateUser(User u);

	List<User> selectByUsername(String username);

	List<User> selectByRegistertime(String registertime);

	int insertUsers(User u);

	List<User> selectUserById(int id);

	List<User> selectByUsername1(String username);

	int insertUser(User user);

	int insertUseradd(User user);

	int deleteUserId(int id);

	public List<User> selectAllUser();

}
