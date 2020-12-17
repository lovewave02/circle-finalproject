package com.kh.circle.comu.entity;

import java.sql.Date;
import java.util.List;

import com.kh.circle.comu.entity.Comu;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class Comu {
	private String comu_post_ordr;
	private String comu_post_wrtr_emp_no;
	private String comu_post_title;
	private String comu_post_cont;
	private Date comu_post_dat;
	private int comu_post_view;
	//private String comu_post_comu_code;
	private String comu_post_list_code;
	private String comu_post_type;
	private String emp_info_name;
	private String emp_info_emp_no;
	private String comu_list_name;
	private String comu_list_code;
	private String comu_info_emp_no;
	
	//comuInfo 정보
	private String comu_info_comu_code;
	private Date comu_info_sdat;
	private Date comu_info_edat;
	private String comu_info_comu_job_code;
	private String comu_info_rm;
	private String comu_info_join;
	private Date comu_info_join_rqst_dat;
	
	private String job_info_name;
}
