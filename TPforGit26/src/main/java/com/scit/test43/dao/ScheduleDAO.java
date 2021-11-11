package com.scit.test43.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.test43.vo.TscheduleVO;


@Repository
public class ScheduleDAO {
	@Autowired
	private SqlSession session;
	
	public ArrayList<TscheduleVO> scheduleList(String tc_id){
		ArrayList<TscheduleVO> scheduleList = null;
		System.out.println(tc_id);
		try {
			ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
			scheduleList = mapper.scheduleList(tc_id);
			System.out.println("dao까지 오나요?"+scheduleList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return scheduleList;
	}
	
	public int insertSchedule(TscheduleVO schedule) {
		int cnt = 0;
		try {
			ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
			cnt = mapper.insertSchedule(schedule);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
}
