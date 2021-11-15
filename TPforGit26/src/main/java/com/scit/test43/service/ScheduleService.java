package com.scit.test43.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.test43.dao.ScheduleDAO;
import com.scit.test43.vo.TscheduleVO;

@Service
public class ScheduleService {
	
	
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ScheduleDAO dao;
	
	public ArrayList<TscheduleVO> scheduleList(){
		String tc_id = (String) session.getAttribute("tcLogin");
		ArrayList<TscheduleVO> scheduleList = dao.scheduleList(tc_id);
		 
		System.out.println("여기까지 오나요?service"+scheduleList);
		System.out.println("a");
		return scheduleList;
	}
	
	public ArrayList<TscheduleVO> SscheduleList(){
		String st_id = (String) session.getAttribute("stLogin");
		ArrayList<TscheduleVO> scheduleList = dao.SscheduleList(st_id);
		 
		System.out.println("여기까지 오나요?service"+scheduleList);
		System.out.println("a");
		return scheduleList;
	}
}
