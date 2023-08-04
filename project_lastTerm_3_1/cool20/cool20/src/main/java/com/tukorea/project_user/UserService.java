package com.tukorea.project_user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
private final UserMapper userMapper;
	
	@Autowired
	public UserService(UserMapper userMapper) {this.userMapper = userMapper;}

	public User loginProcess(String username, String password) {
		return userMapper.loginProcess(username, password);
	}
	
	public void registerUser(User user) {
		userMapper.registerUser(user);
	}
	
	public User findUser(String username) {
		return userMapper.findUser(username);
	}

	
}
