package com.juhyung.reservation.persistence;

import com.juhyung.reservation.domain.User;

public interface UserDAO {
	
	public int insertUser(User user);
	public int checkUserValid(String email);
}
