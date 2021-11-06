package com.scit.test43.controller;

import javax.inject.Inject;   

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.scit.test43.SNSLogin;
import com.scit.test43.SnsValue;
import com.scit.test43.service.JoinLoginService;
import com.scit.test43.vo.StudentVO;
import com.scit.test43.vo.TeacherVO;

@Controller
public class JoinLoginController {
	
	
	@Inject
	private SnsValue naverSns;
	
	@Inject
	private SnsValue googleSns;
	
	@Inject
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Inject
	private OAuth2Parameters googleOAuth2Parameters;
	
	@Autowired
	private JoinLoginService service;
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(TeacherVO account) {
		return service.login(account);
	}
	
	@RequestMapping(value = "/auth/google/callback", method = {RequestMethod.GET, RequestMethod.POST})
	public String snsLoginCallback(Model model, @RequestParam String code) throws Exception{
		SNSLogin snsLogin = new SNSLogin(googleSns);
		String profile = snsLogin.getUserProfile(code);
		System.out.println("Profile>>"+profile);
		model.addAttribute("result", profile);
		return "loginResult";
	}
	
	@RequestMapping(value = "/login2", method = RequestMethod.POST)
	public void login2(Model model) throws Exception{
		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		
		/* 구글code 발행을 위한 URL 생성 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		model.addAttribute("google_url", url);


	}
	

	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "/loginForm";
	}
	
	
	@RequestMapping(value = "/Login/tcLogout", method = RequestMethod.GET)
	public String tcLogout() {
		return service.tcLogout();
	}
	
	@RequestMapping(value = "/Login/stLogout", method = RequestMethod.GET)
	public String stLogout() {
		return service.stLogout();
	}
}
