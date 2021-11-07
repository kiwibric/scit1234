package com.scit.test43.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.test43.LoginDTO;
import com.scit.test43.vo.User;
@Service
public interface UserService {
	@Autowired
	User login(LoginDTO dto) throws Exception;
	@Autowired
	void keepLogin(String uid, String id, Date expire);
	@Autowired
	User checkLoginBefore(String value);
	@Autowired
	User getBySns(User snsUser);
	
}
