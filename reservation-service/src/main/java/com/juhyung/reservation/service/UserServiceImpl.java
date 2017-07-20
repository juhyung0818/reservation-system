package com.juhyung.reservation.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juhyung.reservation.domain.User;
import com.juhyung.reservation.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{

	private UserDAO userDao;
	
	@Autowired
	public UserServiceImpl(UserDAO userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public int setUser(Map<String, String> userMap){
		User user = new User();
		String email = userMap.get("email");
		if(userDao.checkUserValid(email) == 0){
			user.setEmail(email);
			user.setUsername(userMap.get("name"));
			user.setSnsId(email.substring(0, 4) + "****");
			user.setAdminFlag(0);
			if(userDao.insertUser(user) > 0){
				System.out.println("success"); //
				return 1;
			}else{
				return -1; // error 발생
			}
		
			}
			return 1;
		}

}
