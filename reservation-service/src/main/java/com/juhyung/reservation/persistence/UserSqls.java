package com.juhyung.reservation.persistence;

public class UserSqls {

	static final String CHECK_USER_VAILD = 
			"select count(*) from users where email= :email";
}
