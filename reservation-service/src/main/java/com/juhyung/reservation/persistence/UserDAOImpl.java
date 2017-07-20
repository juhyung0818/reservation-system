package com.juhyung.reservation.persistence;

import java.util.Collections;
import java.util.Map;

import javax.sql.DataSource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.juhyung.reservation.domain.User;

@Repository
public class UserDAOImpl implements UserDAO{

	private NamedParameterJdbcTemplate jdbc;
	private SimpleJdbcInsert insertAction;
    private RowMapper<User> userRowMapper = BeanPropertyRowMapper.newInstance(User.class); 
    
    public UserDAOImpl(DataSource dataSource) {
        this.jdbc = new NamedParameterJdbcTemplate(dataSource);
        this.insertAction = new SimpleJdbcInsert(dataSource) 
                .withTableName("users")   
                .usingGeneratedKeyColumns("id"); 
        
    }
	
	@Override
	public int insertUser(User user) {
		SqlParameterSource params = new BeanPropertySqlParameterSource(user);
        return insertAction.executeAndReturnKey(params).intValue();
	}

	@Override
	public int checkUserValid(String email) {
		Map<String, ?> params = Collections.singletonMap("email", email);
		return jdbc.queryForObject(UserSqls.CHECK_USER_VAILD, params, Integer.class);
	}
}
