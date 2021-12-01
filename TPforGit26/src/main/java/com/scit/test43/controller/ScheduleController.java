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
	
	@Autowired
	private ScheduleDAO dao;
	
	@RequestMapping(value = "/TscheduleForm", method = RequestMethod.GET)
	public String TscheduleForm(String tc_id) {
		return "TscheduleForm";
	}
	
	
	@RequestMapping(value = "/Tschedule", method = RequestMethod.GET)
	public @ResponseBody ArrayList<TscheduleVO> Tschedule() {
		ArrayList<TscheduleVO> list = service.scheduleList();
		System.out.println("b");
		return list;
	}
	
	@RequestMapping(value = "/SscheduleForm", method = RequestMethod.GET)
	public String SscheduleForm(String st_id) {
		return "SscheduleForm";
	}
	
	@RequestMapping(value = "/Sschedule", method = RequestMethod.GET)
	public @ResponseBody ArrayList<TscheduleVO> Sschedule() {
		
		ArrayList<TscheduleVO> list = service.SscheduleList();
		System.out.println("b");
		return list;
	}
	
	
	@RequestMapping(value = "/insertSchedule", method= RequestMethod.GET)
	public String insertSchedule(TscheduleVO schedule, HttpSession session) {
	 
		
		String tc_id = (String) session.getAttribute("tcLogin");
		schedule.setTc_id(tc_id); 
		System.out.println("선생님 로그인 정보"+tc_id);
		
		
		int cnt = dao.insertSchedule(schedule);
		if(cnt>0) {
			System.out.println("인서트 성공");
		}else{
			System.out.println("인서트 실패");
		}
		return "redirect:/TscheduleForm";
		
		
	}
	

}
