package com.scit.test43.dao;

import java.util.ArrayList;

import com.scit.test43.vo.TscheduleVO;

public interface ScheduleMapper {

	ArrayList<TscheduleVO> scheduleList(String tc_id);
}
