package com.juhyung.reservation.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.juhyung.reservation.common.LoginBO;
import com.juhyung.reservation.service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {

	private UserService userService;
	private LoginBO loginBO;
	
	@Autowired
	public LoginController(UserService userService) {
		this.userService = userService;
	}
	
	@Autowired
	private void setNaverLoginBO(LoginBO loginBO){
		this.loginBO = loginBO;
	}
	
	@GetMapping
	public String login(HttpSession session) {
		String naverAuthUrl = loginBO.getAuthorizationUrl(session);
		return "redirect:" + naverAuthUrl;
	}
	
	@GetMapping("/check")
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
		OAuth2AccessToken oauthToken = loginBO.getAccessToken(session, code, state);
		String apiResult = loginBO.getUserProfile(oauthToken);
		Map<String, String> map = loginBO.getResultUserInfo(apiResult);
		
		boolean flag = userService.setUser(map);
		if(flag){
			System.out.println(map.get("id"));
			session.setAttribute("login", map.get("id"));
			return "redirect:/myreservation";
		}else{
			return "redirect:/login";
		}
	}
		
	
}
