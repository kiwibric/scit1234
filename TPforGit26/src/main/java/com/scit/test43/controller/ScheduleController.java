package com.scit.test43.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.test43.dao.ScheduleDAO;
import com.scit.test43.service.JoinLoginService;
import com.scit.test43.service.ScheduleService;
import com.scit.test43.vo.StudentVO;
import com.scit.test43.vo.TeacherVO;
import com.scit.test43.vo.TscheduleVO;

@Controller
public class ScheduleController {
	
	
	
	@Autowired
	private ScheduleService service;
	
	@RequestMapping(value = "/TscheduleForm", method = RequestMethod.GET)
	public String TscheduleForm(String tc_id) {
		return "TscheduleForm";
	}
	
	
	@RequestMapping(value = "/Tschedule", method = RequestMethod.GET)
	public @ResponseBody ArrayList<TscheduleVO> Tschedule() {
		/*
		 * String tc_id = (String) session.getAttribute("tcLogin");
		 * System.out.println("선생님 로그인 정보"+tc_id);
		 * 
		 * 
		 * ArrayList<TscheduleVO> scheduleList = dao.scheduleList(tc_id);
		 * model.addAttribute("scheduleList", scheduleList);
		 * System.out.println("스케줄 리스트"+scheduleList);
		 */
		ArrayList<TscheduleVO> list = service.scheduleList();
		System.out.println("b");
		return list;
	}
	
	
	

}