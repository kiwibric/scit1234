package com.scit.test43.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList; 

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.test43.SNSLogin;
import com.scit.test43.SnsValue;
import com.scit.test43.service.JoinLoginService;
import com.scit.test43.service.UserService;
import com.scit.test43.vo.StudentVO;
import com.scit.test43.vo.TeacherVO;
import com.scit.test43.vo.User;

@Controller
public class JoinLoginController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private JoinLoginService service;
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(TeacherVO account) {
		return service.login(account);
	}
	

	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "/loginForm";
	}
	@ResponseBody
	@RequestMapping(value = "/tcCheck", method = RequestMethod.GET)
	public boolean tcCheck(String userNick) {
		System.out.println("tccheck"+userNick);
		boolean check = service.tcCheck(userNick);
		System.out.println(check);
		return check;
	}
	@ResponseBody
	@RequestMapping(value = "/stCheck", method = RequestMethod.GET)
	public boolean stCheck(String userNick) {
		boolean check = service.stCheck(userNick);	
		return check;
	}
	
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(String userNick, String email, String gender, String image, Model model) {
		
		String[] array = {userNick, gender, email, image};
		model = model.addAttribute("array", array);
		
		return "/joinForm";
	}
	
	@RequestMapping(value = "/Login/tcLogout", method = RequestMethod.GET)
	public String tcLogout() {
		return service.tcLogout();
	}
	
	@RequestMapping(value = "/Login/stLogout", method = RequestMethod.GET)
	public String stLogout() {
		return service.stLogout();
	}
	
	@RequestMapping(value = "/teacherMypageTemp", method = RequestMethod.GET)
	public String teacherMypageTemp(String userNick) {
		session.setAttribute("tcLogin", userNick);
		return "redirect:teacherMypage";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(String member_id, String pw, String gender, String phone, int age, String address, String lan1, String lan2, String lan3, int type, String price, String intro, String teachLan) throws UnsupportedEncodingException {
		String url = "";
		StudentVO student = new StudentVO();
		TeacherVO teacher = new TeacherVO();
		if(type == 1) {
			student.setSt_id(member_id);
			student.setSt_pw(pw);
			student.setSt_gender(gender);
			student.setSt_phone(phone);
			student.setSt_age(age);
			student.setSt_loc(address);
			student.setSt_lan1(lan1);
			student.setSt_lan2(lan2);
			student.setSt_lan3(lan3);
			int cnt = service.joinStudent(student);
			session.setAttribute("stLogin", member_id);
			String encodedParam = URLEncoder.encode(member_id, "UTF-8");
			url= "redirect:map?st_id="+encodedParam;
		}else if (type == 0) {
			teacher.setTc_id(member_id);
			teacher.setTc_pw(pw);
			teacher.setTc_gender(gender);
			teacher.setTc_phone(phone);
			teacher.setTc_age(age);
			teacher.setTc_loc(address);
			teacher.setTc_teachLan(teachLan);
			teacher.setTc_lan1(lan1);
			teacher.setTc_lan2(lan2);
			teacher.setTc_lan3(lan3);
			int price2 = Integer.parseInt(price);
			teacher.setTc_price(price2);
			teacher.setTc_intro(intro);
			int cnt = service.joinTeacher(teacher);
			session.setAttribute("tcLogin", member_id);
			url = "redirect:teacherMypage";
		}
		return url;
	}
	
}
