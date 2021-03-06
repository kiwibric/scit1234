package com.scit.test43.dao;

import org.apache.ibatis.session.SqlSession; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.test43.vo.StudentVO;
import com.scit.test43.vo.TeacherVO;
@Repository
public class JoinLoginDAO {
	@Autowired
	private SqlSession session;
	public StudentVO searchStudent(String st_id) {
		StudentVO student = null;
		try {
			JoinLoginMapper mapper = session.getMapper(JoinLoginMapper.class);
			student = mapper.searchStudent(st_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return student;
	}
	public TeacherVO searchTeacher(String tc_id) {
		TeacherVO teacher = null;
		System.out.println(tc_id);
		try {
			JoinLoginMapper mapper = session.getMapper(JoinLoginMapper.class);	
			teacher = mapper.searchTeacher(tc_id);
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return teacher;
	}
	public boolean tcCheck(String userNick) {
		System.out.println(userNick);
		TeacherVO teacher = null;
		boolean check = false;
		try {
			JoinLoginMapper mapper = session.getMapper(JoinLoginMapper.class);	
			teacher = mapper.searchTeacher(userNick);
			if(teacher != null) {
				check = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return check;
	}
	public boolean stCheck(String userNick) {
		System.out.println("st" + userNick);
		StudentVO student = null;
		boolean check = false;
		try {
			JoinLoginMapper mapper = session.getMapper(JoinLoginMapper.class);	
			student = mapper.searchStudent(userNick);
			if(student != null) {
				check = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return check;
	}
	public int joinStudent(StudentVO student) {
		int success = 0;
		try {
			JoinLoginMapper mapper = session.getMapper(JoinLoginMapper.class);
			success = mapper.joinStudent(student);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return success;
	
		
	}
	public int joinTeacher(TeacherVO teacher) {
		 int success = 0;
		try {
			JoinLoginMapper mapper = session.getMapper(JoinLoginMapper.class);
			success = mapper.joinTeacher(teacher);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return success;
	}
	
}
