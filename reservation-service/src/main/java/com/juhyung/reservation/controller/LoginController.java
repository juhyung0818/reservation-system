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

	/* NaverLoginBO */
	private LoginBO loginBO;

	private UserService userService;
	
	@Autowired
	public LoginController(UserService userService) {
		this.userService = userService;
	}
	
	/* NaverLoginBO */
	@Autowired
	private void setNaverLoginBO(LoginBO loginBO){
		this.loginBO = loginBO;
	}
	
	@GetMapping
	public String login(HttpSession session) {
		String naverAuthUrl = loginBO.getAuthorizationUrl(session);

		/* 생성한 인증 URL을 View로 전달 */
		return "redirect:" + naverAuthUrl;
	}
	
	@GetMapping("/check")
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
		OAuth2AccessToken oauthToken = loginBO.getAccessToken(session, code, state);
		String apiResult = loginBO.getUserProfile(oauthToken);
		Map<String, String> map = loginBO.getResultUserInfo(apiResult);
		
		int flag = userService.setUser(map) ;
		if(flag == 1){
			session.setAttribute("login", "OK");
			return "myreservation";
		}else {
			return "redirect:/login";
		}
		
	}
	
}
