package com.kh.circle.schedule.repository;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.circle.schedule.entity.SchAjax;
import com.kh.circle.schedule.entity.Entry;
import com.kh.circle.schedule.entity.Sch_unit;


public interface ScheduleDao {
	
	List<SchAjax> list(Map<String, Object> map);
	List<SchAjax> vacationList(Map<String, Object> map);
	List<SchAjax> projectList(Map<String, Object> map);
	List<HashMap<String, String>> entryList(String id);

	void insert(HashMap<String, Object> insertEvent);

	void delete(String id);

	void update(HashMap<String, Object> updateEvent);

	
}
