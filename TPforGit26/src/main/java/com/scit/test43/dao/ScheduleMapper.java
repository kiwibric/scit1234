package com.scit.test43.dao;

import java.util.ArrayList;

import com.scit.test43.vo.TscheduleVO;

public interface ScheduleMapper {

	ArrayList<TscheduleVO> scheduleList(String tc_id);
	ArrayList<TscheduleVO> SscheduleList(String st_id);
	
	int insertSchedule(TscheduleVO schedule);

}
